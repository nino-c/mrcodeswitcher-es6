angular.module('Exhibition')
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
    .directive('seedListValue', function() {
        return {
            restrict: 'E',
            require: 'ngModel',
            scope: {
                value: '@',
                type: '@'
            },
            template: '<span ng-switch="type" class="seed-list-value">'
                        + '<span ng-switch-when="color" class="list-value">'
                            + '<colorbox hex="{{ value }}"></colorbox>'
                        + '</span>'
                        + '<span ng-switch-when="math" class="math">'
                            + '${{ value }}$'
                        + '</span>'
                        + '<span ng-switch-default class="list-value">'
                            + '{{ value }}'
                        + '</span>'
                    + '</span>',
            link: function(scope, element, attrs, ngModel) {
                ngModel.$render = function() {
                    scope.type = ngModel.$viewValue.type;
                    scope.value = ngModel.$viewValue.value;
                }
            }
        }
    })
    .directive('seedList', ['$compile', function($compile) {
        return {
            restrict: 'E',
            replace: true,
            require: 'ngModel',
            scope: {
                seedlings: '@'
            },
            transclude: true,
            template: '<div><div ng-repeat="seedling in seedlings" class="seedline">'
                + '<strong>{{ seedling[0] }}:</strong>'
                + '<seed-list-value ng-model="seedling[1]"></seed-list-value>'
                + '</div></div>',
            link: function(scope, element, attrs, ngModel) {
                scope.seedlings = [];
                ngModel.$render = function() {
                    scope.seedlings = _.pairs(ngModel.$viewValue);
                    //console.log(scope.seedlings);
                }
            }
        }
    }])
    .directive('draw', function () {
        return {
            restrict: 'A',
            link: function postLink($scope, element, attrs) {

                function initPaper() {

                    paper.install(window);
                    paper.setup(angular.element(element)[0].id);
                    //paper.view.onFrame
                }

                initPaper();

            }
        }
    })
    .directive('paper', ['$compile', function ($compile) {
        return {
            restrict: 'A',
            scope: {
                source: '='
            },
            link: function ($scope, element, attrs) {

                $scope.$watch('source', function(val) {
                    if (val && val.length > 0) {
                        element.html('<canvas style="width:100%; height:100%;" id="paperscript-canvas"></canvas>'
                            + '<script type="text/paperscript" canvas="paperscript-canvas">'+val+'</script>')
                        $compile(element.contents())($scope);
                        paper.PaperScript.load();
                    }
                })

            }
        };
    }])
    .directive('appCanvas', ['$compile', function ($compile) {
        return {
            restrict: 'A',
            scope: {
                source: '=',
                seedcodelines: '=',
                dialect: '=',
                loading: '='
            },
            link: function ($scope, element, attrs) {

                $scope.$watch('source', function(val) {
                    if (val && val.length > 0) {
                        console.log($scope);
                        switch ($scope.dialect) {
                            case 'text/paperscript':
                                $scope.$parent.clearPaperCanvas();
                                element.html('<canvas id="paperscript-canvas" class="canvas-fullscreen-under-toolbar"></canvas>'
                                    + '<script type="' + $scope.dialect + '" canvas="paperscript-canvas">'
                                    + val +'</script>');
                                $compile(element.contents())($scope);

                                eval( $scope.seedcodelines );


                                paper.PaperScript.load();
                                $scope.loading = false;
                            break;
                            default:
                                $scope.$parent.clearCanvas();
                                element.html('<canvas id="big-canvas"></canvas>');
                                $compile(element.contents())($scope);
                                console.log($scope);

                                // extra_seedcodelines = [ 'var canvas = $("#big-canvas");',
                                //     'var Canvas = document.getElementById("big-canvas");'];

                                // eval(extra_seedcodelines.join("\n") + "\n" + $scope.seedcodelines );

                                eval($scope.seedcodelines );


                                $scope.gameFunction = new Function('Canvas', val);
                                $scope.gameFunction(Canvas);
                                $scope.loading = false;

                            break;
                        }

                    }
                })

            }
        };
    }])
    .directive('appCanvasInstance', ['$rootScope', '$compile', '$route',
        'InstanceService', function ($rootScope, $compile, $route, InstanceService) {
        return {
            restrict: 'A',
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
                        //seedcodelines.push( 'Canvas.width = $(window).width();' )
                        //seedcodelines.push( 'Canvas.height = $(window).height()-50;' )
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
                        InstanceService.get({id:parseInt(instanceId)})
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
    }])
    .directive('paperscriptCanvas', function($compile, Complex) {
        'ngInject';

        return {
            restrict: 'E',
            link: function(scope, element, attrs) {
                element.html('<canvas id="paperscript-canvas" class="canvas-fullscreen"></canvas>'
                    + '<script type="text/paperscript" canvas="paperscript-canvas" src="'
                    + attrs.source +'"></script>');
                $compile(element.contents())(scope);
                paper.PaperScript.load();
            }
        }
    })
    // .directive('fillVertical', ['$window', function($window) {
    //     return {
    //         restrict: 'A',
    //         link: function(scope, element, attrs) {
    //             console.log('csstop', (element).position());
    //             element.css({height: ($window.innerHeight - element.position().top).toString()+'px'})
    //         }
    //     }
    // }])
    // .directive('feature-display', ['$scope', function() {
    //     return {
    //         scope: {
    //             featureDisplayContent: '@',
    //             featureDisplayCSS: '@'
    //         },
    //         restrict: 'E',
    //         template: function(element, attr) {
    //             var style = _.reduce(_.mapObject(featureDisplayCSS, function(val, key) {
    //                 return key+':'+val+';';
    //             }), function(a,b) { return a+b; }, '');
    //             return '<div class="feature-display" style="{{style}}">{{featureDisplayContent}}</div>';
    //         },
    //         //transclude: true,
    //         link: function postLink($scope, element, attrs) {
    //             console.log('ss', $scope, element, attrs)

    //             function applyCSS() {
    //                 $(element[0]).css($scope.featureDisplayCSS);
    //             }

    //             $scope.$watch("featureDisplayContent.length > 0", function(newValue) {
    //                 console.log('fff')
    //                 applyCSS();
    //                 $(element[0]).html(newValue);
    //             });
    //         }
    //     }
    // }])
    // .directive('fitImageToParent', function() {
    //     return {
    //         restrict: 'A',
    //         link: function postLink(scope, element, attrs) {
    //             var parentElement = element.parent().parent();
    //             console.log('fitImage', parentElement.width());
    //         }
    //     }
    // })
    .directive('adjustImage', function($window, $rootScope, $timeout) {
        return {
            restrict: 'A',
            link: function postLink(scope, element, attrs) {

                var win = angular.element($window);
                var _basewidth = parseInt(attrs.basewidth);
                var basewidth = _basewidth;
                var parentElement = element.parent();
                var transform_started = false;

                function getCSSTotal(el, arg) {

                    var val = _.reduce(
                        _.map(['left', 'right'], function(dir) {
                            return parseInt(el.css(arg+'-'+dir).split('px').join(''));
                        }), function(a,b) { return a+b; }, 0);
                    if (isNaN(parseInt(val))) {
                        val = 0;
                    }
                    return val;
                }

                function transform() {

                    transform_started = true;

                    var parent_padding = getCSSTotal(parentElement, 'padding');
                    var images = parentElement.children();

                    var basewidth_plus;
                    if (images.length > 0) {
                        basewidth_plus = basewidth
                            +  parseInt(getCSSTotal(angular.element(images[0]), 'padding'))
                            +  parseInt(getCSSTotal(angular.element(images[0]), 'border' ))
                            +  parseInt(getCSSTotal(angular.element(images[0]), 'margin' ));

                    } else {
                        basewidth_plus = basewidth;
                    }

                    function adjust() {
                        var elem_width = parentElement.width();
                        var im_per_row = Math.floor((elem_width - parent_padding) / basewidth_plus);
                        var im_width = elem_width / im_per_row;
                        var image_width = Math.floor(im_width - (basewidth_plus - basewidth));

                        _.each(images, function(im) {
                            $(im).css({
                                width:image_width.toString()+'px',
                                height:image_width.toString()+'px'
                            });
                        });
                    }

                    adjust();

                    win.bind('resize', function() {
                        adjust();
                        scope.$apply();
                    });

                }

                $timeout(function() {
                    transform();
                })


                // causes directive to resize upon first pageload
                scope.$watch('loading', function(val) {
                    if (!val && !transform_started) {
                        transform();
                    }
                });

                scope.$watch('$last', function(val) {
                    if (val && !transform_started) {
                        transform();
                    }
                });

            }
        }
    })
    .directive('ngRepeatEndCall', function() {
        return {
            restrict: 'A',
            scope: {},
            link: function (scope, element, attrs) {
                if (attrs.ngRepeat) {
                    if (scope.$parent.$last) {
                        if (attrs.ngRepeatEndCall !== '') {
                            if (typeof scope.$parent.$parent[attrs.ngRepeatEndCall] === 'function') {
                                scope.$parent.$parent[attrs.ngRepeatEndCall]();
                            } else {
                                scope.$parent.$parent[attrs.ngRepeatEndCall] = true;
                            }
                        } else {
                            scope.$parent.$parent.ngRepeatEnd = true;
                        }
                    }
                } else {
                    throw 'ngRepeatEndCall: `ngRepeat` Directive required to use this Directive';
                }
            }
        }
    })
    // .directive('stickToBottom', function($window) {
    //     return {
    //         restrict: 'A',
    //         link: function (scope, element, attrs) {
    //             console.log('stickToBottom');
    //             var el = angular.element(element[0]);
    //             var mintop = angular.element($window).height() - el.height();
    //             console.log('mintop', mintop, el.offset().top);
    //             if (el.offset().top < mintop) {
    //                 el.css({position: 'absolute', top: mintop+'px'});
    //             }
    //         }
    //     }
    // })
    .directive('lazySrc', ['$window', '$document', function($window, $document){
        var doc = $document[0],
            body = doc.body,
            win = $window,
            $win = angular.element(win),
            uid = 0,
            elements = {};

        function getUid(el){
            var __uid = el.data("__uid");
            if (! __uid) {
                el.data("__uid", (__uid = '' + ++uid));
            }
            return __uid;
        }

        function getWindowOffset(){
            var t,
                pageXOffset = (typeof win.pageXOffset == 'number') ? win.pageXOffset : (((t = doc.documentElement) || (t = body.parentNode)) && typeof t.ScrollLeft == 'number' ? t : body).ScrollLeft,
                pageYOffset = (typeof win.pageYOffset == 'number') ? win.pageYOffset : (((t = doc.documentElement) || (t = body.parentNode)) && typeof t.ScrollTop == 'number' ? t : body).ScrollTop;
            return {
                offsetX: pageXOffset,
                offsetY: pageYOffset
            };
        }

        function isVisible(iElement){
            var elem = iElement[0],
                elemRect = elem.getBoundingClientRect(),
                windowOffset = getWindowOffset(),
                winOffsetX = windowOffset.offsetX,
                winOffsetY = windowOffset.offsetY,
                elemWidth = elemRect.width,
                elemHeight = elemRect.height,
                elemOffsetX = elemRect.left + winOffsetX,
                elemOffsetY = elemRect.top + winOffsetY,
                viewWidth = Math.max(doc.documentElement.clientWidth, win.innerWidth || 0),
                viewHeight = Math.max(doc.documentElement.clientHeight, win.innerHeight || 0),
                xVisible,
                yVisible;

            if(elemOffsetY <= winOffsetY){
                if(elemOffsetY + elemHeight >= winOffsetY){
                    yVisible = true;
                }
            }else if(elemOffsetY >= winOffsetY){
                if(elemOffsetY <= winOffsetY + viewHeight){
                    yVisible = true;
                }
            }

            if(elemOffsetX <= winOffsetX){
                if(elemOffsetX + elemWidth >= winOffsetX){
                    xVisible = true;
                }
            }else if(elemOffsetX >= winOffsetX){
                if(elemOffsetX <= winOffsetX + viewWidth){
                    xVisible = true;
                }
            }

            return xVisible && yVisible;
        };

        function checkImage(){
            Object.keys(elements).forEach(function(key){
                var obj = elements[key],
                    iElement = obj.iElement,
                    $scope = obj.$scope;
                if(isVisible(iElement)){
                    iElement.attr('src', $scope.lazySrc);
                }
            });
        }

        $win.bind('scroll', checkImage);
        $win.bind('resize', checkImage);

        function onLoad(){
            var $el = angular.element(this),
                uid = getUid($el);

            $el.css('opacity', 1);

            if(elements.hasOwnProperty(uid)){
                delete elements[uid];
            }
        }

        return {
            restrict: 'A',
            scope: {
                lazySrc: '@',
                animateVisible: '@',
                animateSpeed: '@'
            },
            link: function($scope, iElement){

                iElement.bind('load', onLoad);

                $scope.$watch('lazySrc', function(){
                    var speed = "1s";
                    if ($scope.animateSpeed != null) {
                        speed = $scope.animateSpeed;
                    }
                    if(isVisible(iElement)){
                        if ($scope.animateVisible) {
                            iElement.css({
                                'background-color': '#fff',
                                'opacity': 0,
                                '-webkit-transition': 'opacity ' + speed,
                                'transition': 'opacity ' + speed
                            });
                        }
                        iElement.attr('src', $scope.lazySrc);
                    }else{
                        var uid = getUid(iElement);
                        iElement.css({
                            'background-color': '#fff',
                            'opacity': 0,
                            '-webkit-transition': 'opacity ' + speed,
                            'transition': 'opacity ' + speed
                        });
                        elements[uid] = {
                            iElement: iElement,
                            $scope: $scope
                        };
                    }
                });

                $scope.$on('$destroy', function(){
                    iElement.unbind('load');
                    var uid = getUid(iElement);
                    if(elements.hasOwnProperty(uid)){
                        delete elements[uid];
                    }
                });
            }
        };
    }])
    // .directive('seedField', function($compile) {
    //     return {
    //         restrict: 'E',
    //         scope: {
    //             label: '=',
    //             type: '=',
    //             value: '='
    //         },
    //         templateUrl: 'seedField.html',
    //         link: function(scope, elem, attrs, ctrl) {

    //             $scope.$apply();

    //             ctrl.seedChange = function() {

    //             }
    //         }
    //     }
    // })
    // .directive('seedEditor', function() {
    //     return {
    //         restrict: 'E',
    //         require: 'ngModel',
    //         templateUrl: 'seedEditor.html',
    //         link: function(scope, elem, attrs, ngModel) {
    //             //ngModel.$render = function() {
    //                 scope.seedlist = _.map(ngModel.$viewValue,
    //                     function(item) {
    //                         return {label: item[0], value: item[1].value}
    //                     })
    //                 console.log($scope.seedlist);
    //             //}
    //         }
    //     }
    // })

    // .directive('imageGrid', function($window, $timeout) {
    //         return {
    //             restrict: 'E',
    //             template: function(elem, attr) {
    //                 //return '<img ng-src="/media/{{ im | thumbnail:125 }}" class="nthumbnail pull-left" '
    //                 //+ 'ng-repeat="im in images | limit:{{ imlimit }}" />';
    //                 return 'elemwidth: {{ elemwidth }} <div ng-repeat="im in images">im {{im}}</div>';
    //             },
    //             link: function(scope, element, attrs, ngModel) {

    //                 var parentElement = element.parent();
    //                 var _basewidth = (parseInt(attrs.basewidth) || 80);
    //                 var basewidth = _basewidth;

    //                 function getCSSTotalWidth(el, arg) {
    //                     var val = _.reduce(
    //                         _.map(['left', 'right'], function(dir) {
    //                             return parseInt(el.css(arg+'-'+dir).split('px').join(''));
    //                         }), function(a,b) { return a+b; }, 0);
    //                     if (isNaN(parseInt(val))) {
    //                         val = 0;
    //                     }
    //                     return val;
    //                 }

    //                 function adjust() {
    //                     var elemwidth = parentElement.width();
    //                     var parent_padding = getCSSTotalWidth(parentElement, 'padding');
    //                     var im_per_row = Math.floor((elemwidth - parent_padding) / basewidth);
    //                     var im_width = elemwidth / im_per_row;
    //                     //var image_width = Math.floor(im_width - (basewidth_plus - basewidth));

    //                     scope.images = attrs.images;
    //                     scope.elemwidth = elemwidth;
    //                     scope.imlimit = im_per_row * 3;
    //                 }
    //                 adjust();

    //                 angular.element($window).bind('resize', function() {
    //                     adjust();
    //                     scope.$apply();
    //                 });

    //             }
    //         }
    //     })
    //     .directive('paperJs', function () {
    //         return {
    //             restrict: 'A',
    //             link: function (scope, element, attrs) {
    //                 element.css({width:'100%', height:'100%'});
    //                 paper.setup(element.get(0));
    //             }
    //         };
    //     })
    // .component('seedDisplay', {
    //     bindings: {
    //         __seed: '='
    //     },
    //     controller: function() {

    //     },
    //     templateUrl: 'views/seedDisplay.html'
    // })
    // .directive('gameTimer', function() {
    //     return function(scope, element, attrs) {

    //         restrict: 'E',
    //         scope: {},
    //         bindToController: {
    //             timeElapsed: '='
    //         },
    //         controller: function($scope) {
    //             this.startTime = new Date();
    //             this.timeElapsed = 0;
    //             $scope.$watch('timeElapsed', function() {
    //                 this.timeElapsed = ((new Date()).getTime() - this.startTime.getTime()) / 1000;
    //             }.bind(this));
    //         },
    //         controllerAs: 'ctrl',
    //         //bindToController: true,
    //         template: 'time: {{ timeElapsed }}'
    //     }
    // })
