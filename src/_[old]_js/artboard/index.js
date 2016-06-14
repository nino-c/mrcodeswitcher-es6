import angular from 'angular';

let artboard = angular.module('app.artboard', [])

class ArtboardCtrl {

    constructor($rootScope, $window, $document, $interval, $location, $route,
        $mdToast, $timeout, $http, $mdDialog, api)  {
        'ngInject';

        $rootScope.viewscope = this;
        $rootScope.showBottom = true;
        $rootScope.viewname = 'instance';
        $rootScope.viewscope = this;

        this.loading = true;
        this.timer = null;
        this.timeElapsed = 0;
        this.autosnapshot = false;
        this.source = null;
        this.seedcodelines = null;
        this.dialect = null;
        this.seedlings = null;

        this.currentCycleValue = null;
        this.varyParam = null;
        this.varyMin = 0;
        this.varyMax = 0;

        this.featureDisplayContent = '';
        this.featureDisplayCSS = {};

        // $rootScope.topScope.canvasLoadConfig = {
        //     loadFromServer: true,
        // };
        //
        // $rootScope.topScope.setCurrentInstance($route.current.params.instance_id);

        // InstanceService.get({id:$route.current.params.instance_id})
        //     .$promise.then(function(inst) {
        //
        //         console.log('instance seed', inst.seed, inst)
        //
        //         this.instance = inst;
        //         this.seedStructure = JSON.parse(inst.game.seedStructure);
        //         this.dialect = inst.game.scriptType;
        //         this.execute();
        //     })

        // this.initialize = function() {
        //     $rootScope.showBottom = true;
        // };

        cleanSeed(seed) {
            return _.mapObject(seed, function(s) {
                if (s.type == "number") {
                    s.value = parseInt(s.value);
                }
                return s;
            });
        }

        parseSeedVector() {
            /*
                FROM instance.seed:String
                TO _seed:Object (with int conversion)
                TO seedlings:Array
            */
            // this._seed = _.mapObject(
            //     JSON.parse(this.instance.seed), function(s) {
            //         // if (s.parsing === undefined) s.parsing = false;
            //         // if (setToFalse) s.parsing = false;
            //
            //         if (s.type == "number") {
            //             s.value = parseInt(s.value);
            //         }
            //         return s;
            //     });
            this._seed = this.cleanSeed(JSON.parse(this.instance.seed));
            this.seedlings = _.pairs(this._seed);


            console.log('parseSeedVector, seedlings = ', this.seedlings);

        };

        updateSeed() {
            /*
                FROM seedlings:Array
                TO _seed:Object
            */
            console.log('updateSeed', this.seedlings);
            this._seed = this.cleanSeed(_.object(this.seedlings)); console.log('_seed', this._seed);
            this.instance.seed = JSON.stringify(this._seed); console.log('this.instance.seed', this.instance.seed);
        }

        execute(options) {
            this.appstart = new Date();
            this.timer = $interval(function() {
                this.timeElapsed = ((new Date()).getTime() - this.appstart.getTime()) / 1000;
            }, 1000);

            this.parseSeedVector();

            if (!options.loadFromServer) {
                options.instance = this.instance;
            }
            $rootScope.topScope.canvasLoadConfig = options;
            $rootScope.topScope.setCurrentInstance(this.instance.id);
        };

        renderingDone() {

            console.log('renderingDone');

            if (this.autosnapshot) {
                this.snapshot();
                this.autosnapshot = false;
            }

            if (this.currentCycleValue != null) {
                $timeout(function() {
                    this.doCycle();
                }, 1500)
            }
            $window.renderingDone = this.renderingDone;

        }


        cycleParam(param, min, max) {

            this.varyParam = param;
            this.currentCycleValue = min;
            this.varyMin = min;
            this.varyMax = max;

            console.log('cycle', this.varyParam, this.varyMin, this.varyMax);

            if (typeof this._seed[this.varyParam] == 'object' && this._seed[this.varyParam].value) {
                this._seed[this.varyParam].value = this.currentCycleValue;
            } else {
                this._seed[this.varyParam] = this.currentCycleValue;
            }

            this.updateInstance({
                autosnapshot: true
            });
        }

        doCycle() {

            this.currentCycleValue++;

            if (this.currentCycleValue > this.varyMax)  {
                this.currentCycleValue = null;
                return;
            }

            if (typeof this._seed[this.varyParam] == 'object' && this._seed[this.varyParam].value) {
                this._seed[this.varyParam].value = this.currentCycleValue;
            } else {
                this._seed[this.varyParam] = this.currentCycleValue;
            }

            //this.parseSeedList();
            this.updateInstance({
                autosnapshot: true
            });

        };


        featureDisplay(content, css) {

            if (!css)
                css = {};
            if (typeof content == 'string')
                content = [content];

            this.featureDisplayContent = content;
            this.featureDisplayCSS = _.reduce(
                _.mapObject(css, function(val, key) {
                    return key+':'+val+';';
                }), function(a,b) { return a+b; }, '');

            $timeout(this.refreshMathJax);
            $window.featureDisplay = this.featureDisplay;
        };



        updateInstance(options) {

            if (typeof options != 'object')
                options = {autosnapshot:Boolean(options)};

            this.seedlings = options.seedlings ? options.seedlings : this.seedlings;
            this.autosnapshot = options.autosnapshot ? true : false;
            this.loading = true;

            this.updateSeed();
            this.parseSeedVector();

            if (this.userLoggedIn) {
                console.log('upInst, inside');
                var req = {
                    method: 'POST',
                    data: this._seed,
                    url: '/game/app-instantiate/' + this.instance.game.id + '/',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }

                $http(req).then(function successCallback(response) {

                    console.log(response);

                    if (response.data.id) {

                        this.instance.id = response.data.id;
                        $route.current.params.instance_id = response.data.id;

                        this.clearCanvas();
                        this.clearPaperCanvas();
                        this.clearEvalScope();
                        this.loading = true;
                        this.timeElapsed = 0;
                        this.seedTouched = false;
                        this.readyToSave = false;

                        if (response.data.alreadyExists) {
                            $rootScope.toast("Seed-vector exists already.");
                            this.autosnapshot = false;
                        } else {
                            $rootScope.toast("Saved as new instance.");
                        }

                        var snapshot = response.data.alreadyExists ? false : true;
                        this.execute({
                            loadFromServer:true
                        });

                    }

                }, function errorCallback(response) {
                    console.log('error', response)
                });


            } else {

                this.clearCanvas();
                this.clearPaperCanvas();
                this.clearEvalScope();
                this.loading = true;
                this.timeElapsed = 0;
                //this.seedTouched = false;
                //this.readyToSave = false;
                this.execute({
                    loadFromServer:false
                });
            }

        };



        viewSource(ev) {

            $mdDialog.show({
                locals: {
                    app: this.instance.game,
                },
                templateUrl: '/static/AaaE/views/view-source-dialog.html',
                parent: angular.element(document.body),
                targetEvent: ev,
                controller: ViewSourceDialog
            });

            function ViewSourceDialog(this, $mdDialog, app) {

                this.initialize = function() {

                    var lang = app.scriptType.split('text/').join('');
                    if (lang == 'paperscript') { lang = 'javascript'; }

                    this.cmOptions = {
                        lineWrapping: true,
                        lineNumbers: true,
                        indentWithTabs: true,
                        viewportMargin: Infinity,
                        mode: lang,
                        matchBrackets: true,
                        gutters: ['codemirror-gutters']
                    }

                    this.app = app;
                }

                this.closeDialog = function() {
                    $mdDialog.hide();
                };
            }
        }

        editSeed($event) {

            console.log('editseed');
            //this.seedlings = _.pairs(this._seed);
            this.parseSeedVector();

            $mdDialog.show({
                bindToController: true,
                targetEvent: $event,
                //require: ['^mdRadioGroup'],
                locals: {
                    seedlings: this.seedlings,
                    parentScope: this
                },
                //preserveScope: true,
                templateUrl: '/static/AaaE/views/seed-editor-dialog.html',
                parent: angular.element(document.body),
                controller: function(scope, $mdDialog, seedlings, parentScope) {

                    scope.seedlings = seedlings;
                    scope.varyParam = null;
                    scope.varyMin = 0;
                    scope.varyMax = 0;
                    scope.seedTouched = false;
                    scope.readyToSave = false;

                    scope.initializeSeedEditor = function() {
                        console.log('DialogController init');
                        console.log(scope.seedlings);
                    };

                    scope.closeDialog = function() {
                        $mdDialog.hide();
                    };

                    scope.seedChange = function() {
                        scope.seedTouched = true;
                        scope.readyToSave = true;
                        console.log('seedChanged', scope.seedlings)
                    };

                    scope.changeVaryParam = function() {
                        console.log('changeVaryParam');
                    }

                    scope._updateInstance = function() {
                        console.log('_updateInstance :: inside DialogController');
                        console.log('varyParam', scope.varyParam);
                        //scope.parseSeedList();
                        //scope.updateSeed();

                        parentScope.seedlings = scope.seedlings;


                        if (scope.varyParam != null) {
                            parentScope.cycleParam(scope.varyParam, scope.varyMin, scope.varyMax);
                        } else {
                            console.log('calling upIns from inside DC');
                            parentScope.updateInstance({
                                autosnapshot: true,
                                seedlings: scope.seedlings
                            });
                        }
                        $mdDialog.hide();
                    }

                }
            });


        }


        snapshot() {

            if (!USER_ID) { return; }

            //var canvas = $("#big-canvas");
            var Canvas = this.dialect.indexOf('paperscript') > -1 ?
                document.getElementById("paperscript-canvas") : document.getElementById("big-canvas");

            if (window._renderer) {
                var snapshot = window._renderer.domElement.toDataURL("image/png");
            } else {
                var snapshot = Canvas.toDataURL("image/png");
            }
            var url = "/game/snapshot/";
            $.post(url, {
                    instance: this.instance.id,
                    time: this.timeElapsed,
                    image: snapshot
                },
                function(data) {
                    $rootScope.toast("Snapshot saved.")
                    console.log(data);
                }
            );
            $window.snapshot = this.snapshot;
        }

        clearCanvas() {
            try {
                var _canvas = document.getElementById('big-canvas');
                if (_canvas) {
                    var context = _canvas.getContext('2d')
                    if (context) {
                        context.fillStyle = '#ffffff';
                        context.fillRect(0,0,_canvas.width, _canvas.height);
                        context.clearRect(0,0,_canvas.width, _canvas.height);
                        console.log('clear canvas')
                    }
                }
            } catch (e) {
                console.log(e);
            }
        }

        clearPaperCanvas() {

            this.source = null;
            this.seedcodelines = null;
            //this.dialect = null;

            try {
                with (paper) {
                    if (project) {
                        project.layers.forEach((lay) => {
                            lay.removeChildren();
                            lay.remove();
                        });
                        project.clear();
                    }
                }
            } catch (e) { console.log('clearPaperCanvas error', e); }
        };

        clearEvalScope() {

            this.source = null;
            this.seedcodelines = null;
            //this.dialect = null;

            // try to delete all vars in scope of previously eval()-ed app
            try {
                window.appdestroy();
            } catch (e) {
                console.log('no appdestroy()', e);
            };

            if (this.gameFunction) {
                delete this.gameFunction;
                console.log('deleting gameFunction')

            }
        }

        _destroy() {
            console.log('scope destroy instance.js')
            this.clearCanvas();
            this.clearPaperCanvas();
            this.clearEvalScope();
        }


    }
}

artboard.controller('ArtboardCtrl', ArtboardCtrl);
export default artboard.name;
