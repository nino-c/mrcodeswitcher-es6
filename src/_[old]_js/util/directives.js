
let directives = angular.module('app.directives', [])

    .directive('validateJson', function() {
        return {
            require: 'ngModel',
            link: function(scope, elem, attrs, ctrl) {
                ctrl.$validators.validateJson =
                    function(modelValue, viewValue) {

                        try {
                            var obj = JSON.parse(viewValue)
                        } catch (e) {
                            return false;
                        }
                        return true;
                    }
            }
        }
    })
    .directive('spacer', function() {
        return {
            template: function(elem, attrs) {
                console.log('spacer template');
                var height = attrs.height ? parseInt(attrs.height) : 10;
                return '<div style="height:'+height+'px;"></div>';
            }
        }
    })
    .directive('spinner', function() {
        return {
            restrict: 'EA',
            scope: {
                size: '='
            },
            template: function(elem, attr) {
                return '<span class="glyphicon glyphicon-refresh fa-spin-custom {{ sizeClass }}"></span>'
            },
            link: function postLink(scope, elem, attrs) {
                if (scope.attrs.size) {
                    scope.attrs.sizeClass = 'spinner-' + size;
                }
            }
        }
    })
    .directive('colorbox', ['$scope', function($scope) {
        return {
            //require: '?ngModel',
            scope: {
                hex: '='
            },
            template:function(elem, attr) {

                '<div style="background-color: {{ hex }}; width: 15px; height: '
                    +'15px; border: 2px solid #dddddd;"></div>'
            },
            // link: function($scope, elem, attrs, ngModel) {
            //     console.log('link', elem, attrs)
            // }
        }
    }])
    .directive('hideShort', ['$window', function($window) {
        return {
            link: function(scope, element, attrs) {
                function adjust() {
                    if ($window.innerHeight < 500) {
                        element.css({display:"none"});
                    } else {
                        element.css({display:"block"});
                    }
                }
                adjust();

                angular.element($window).bind('resize', function() {
                    adjust();
                    scope.$apply();
                });
            }
        }
    }])
    .directive('appCanvasInstance', ($rootScope, $compile, $route, api) => {
        'ngInject';

        return {
            restrict: 'EA',
            scope: {
                currentInstanceId: '=',
                canvasLoadConfig: '='
            },
            link: function ($scope, element, attrs) {

                function execInstance(instance) {
                    $rootScope.currentInstance = instance;

                    var dialect = instance.game.scriptType;
                    var seedStructure = JSON.parse(instance.game.seedStructure);
                    var seed = JSON.parse(instance.seed);

                    if ($rootScope.viewname == 'instance') {
                        console.log('$rootScope.viewscope', $rootScope.viewscope);
                        $rootScope.viewscope.dialect = dialect;
                        $rootScope.viewscope.seedStructure = seedStructure;
                        $rootScope.viewscope.seed = seed;
                    }

                    // prepare code to eval
                    // line-by-line for the system-generated part
                    var seedcodelines = [];
                    seedcodelines.push( 'var seed = ' + instance.seed + ';' );

                    // canvas declarations
                    if (dialect.indexOf('paperscript') == -1) {
                        seedcodelines.push( 'var canvas = $("#big-canvas");' )
                        seedcodelines.push( 'var Canvas = document.getElementById("big-canvas");' )
                        seedcodelines.push( 'canvas.css({\'display\':\'block\'});' )
                        seedcodelines.push( 'Canvas.width = $(window).width();' )
                        seedcodelines.push( 'Canvas.height = $(window).height()-50;' )
                        seedcodelines.push( 'console.log(Canvas);' )
                        seedcodelines.push( 'console.log(canvas);' )
                    }

                    // import seed attributes into local namespace
                    for (attr in seed) {

                        var line = '';
                        var k = seedStructure[attr].varname ?
                                    seedStructure[attr].varname : attr;

                        switch (seed[attr].type) {
                            case 'string':
                            case 'color':
                                line = "var " + k + " = \""
                                    + seed[attr].value.toString() + "\";"
                                break;
                            case 'math':
                                line = "var " + k + " = "
                                    + JSON.stringify(seed[attr]) + ";"
                                break;
                            case 'javascript':
                                line = "var " + k + " = "
                                    + seed[attr].value + ";"
                                break;
                            case 'number':
                                line = "var " + k + " = "
                                    + seed[attr].value.toString() + ";"
                                break;
                        }

                        seedcodelines.push(line);

                    }



                    var required_codeblocks = '';
                    if (instance.game.required_modules.length > 0) {
                        required_codeblocks = _.map(
                            instance.game.required_modules, function(mod) {
                                return mod.source;
                            }).join("\n\n");
                    }

                    if (dialect == 'text/coffeescript') {

                        var coffee_seedcodelines = _.map(seedcodelines, function(line) {
                            return line.split('var ').join('').split(';').join('');
                        });

                        instance.sourcecode += "\ntry\n\twindow.start()\ncatch error\n\tconsole.log error";
                        instance.sourcecode = CoffeeScript.compile(instance.sourcecode);
                        var source = seedcodelines.join("\n") + "\n"
                            //+ required_codeblocks + "\n"
                            + instance.sourcecode;

                    } else {
                        instance.sourcecode += "\n try { window.start(); } catch(e) {}"
                        var source = seedcodelines.join("\n") + "\n"
                            + required_codeblocks + "\n"
                            + instance.sourcecode;
                    }





                    if (source.indexOf('window.renderingDone()') == -1) {
                        source += "\n\nwindow.renderingDone()";
                    }

                    switch (dialect) {
                        case 'text/paperscript':
                            //$parent.clearPaperCanvas();
                            element.html('<canvas id="paperscript-canvas" class="canvas-fullscreen"></canvas>'
                                + '<script type="' + dialect + '" canvas="paperscript-canvas">'
                                + source +'</script>');
                            $compile(element.contents())($scope);
                            //console.log(source);
                            eval( seedcodelines );


                            paper.PaperScript.load();
                            loading = false;
                        break;
                        default:
                            //$parent.clearCanvas();
                            element.html('<canvas id="big-canvas"></canvas>');
                            $compile(element.contents())($scope);
                            //console.log($scope);

                            // extra_seedcodelines = [ 'var canvas = $("#big-canvas");',
                            //     'var Canvas = document.getElementById("big-canvas");'];

                            // eval(extra_seedcodelines.join("\n") + "\n" + seedcodelines );

                            eval(seedcodelines );

                            var Canvas = angular.element(element);
                            console.log('Canvas', Canvas);
                            //gameFunction = new Function('Canvas', source);
                            //gameFunction(Canvas);
                            console.log(source);
                            eval(source);
                            loading = false;

                        break;
                    }

                }

                $rootScope.topScope.$watch('currentInstanceId', function(instanceId) {

                    if (!instanceId) return;
                    console.log('$watch currentInstanceId', instanceId);

                    if ($rootScope.topScope.canvasLoadConfig.loadFromServer) {
                        console.log('EXEC directive, load');
                        api.InstanceService.get({id:parseInt(instanceId)})
                            .$promise.then(function(instance) {
                                $rootScope.viewscope.instance = instance;
                                execInstance(instance);
                            });

                    } else {
                        console.log('EXEC directive, NONload');
                        if ($rootScope.viewscope.instance) {
                            console.log($rootScope.viewscope.instance);
                            execInstance($rootScope.viewscope.instance);
                        }
                    }

                });
            }
        };
    })

export default directives.name;
