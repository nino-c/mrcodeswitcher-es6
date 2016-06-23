import 'angular'
import 'angular-material';
import 'angular-ui-router';
import 'angular-route';
import 'angular-resource';
import 'angular-cookies';
import 'angular-bootstrap';
import 'angular-animate';
import 'angular-ui-codemirror';
//import 'ngreact'

import './config/templates';
import './config';
import './controllers';
import './services';
import './directives';
import './services';
import './filters';
//import './react/hello';

import login from './login';

import 'numeric';
import 'underscore';
import Complex from 'complex';
import Babel from  'babel-standalone';
import CodeMirror from 'codemirror';
import CoffeeScript from 'coffee-script';
//import MathJax from 'mathjax';


window.app = angular.module('app', [
    'config',
    'ui.router',
    'ngMaterial',
    'ui.bootstrap',
    'ui.codemirror',
    'ngRoute',
    'ngAnimate',
    'ngResource',
    'ngCookies',
    'templates',
    'controllers',
    'services',
    'directives',
    'filters',
    'login']

    ).value('ui.config', {

      codemirror: {
        lineWrapping : true,
        lineNumbers: true,
        indentWithTabs: true,
        viewportMargin: Infinity,
        mode: 'javascript',
        matchBrackets: true,
        theme: "mdn-like",
      }

}).config(function($mdThemingProvider, $stateProvider, $urlRouterProvider,
    $resourceProvider, $mdIconProvider) {

        $mdThemingProvider.theme('default')
                .primaryPalette('blue-grey')
                .accentPalette('orange');

        $mdIconProvider.viewBoxSize = 16;
        $urlRouterProvider.otherwise('/app/home')

        $stateProvider.state('app', {
            url: '/app',
            views: {
                '': {
                    controller: 'ContentController',
                    controllerAs: '$ctrl',
                    templateUrl: 'views/main.html'
                },
                'toolbar@app': {
                    controller: 'ToolbarController',
                    controllerAs: 'ctrl',
                    templateUrl: 'views/toolbar.html'
                },
                'panel@app': {
                    controller: 'PanelController',
                    controllerAs: 'ctrl',
                    templateUrl: 'views/panel.html'
                }
            }
        })
        .state('app.home', {
            url: '/home',
            views: {
                '': {
                    templateUrl: 'views/homepage.html',
                    controller: 'HomeController',
                    controllerAs: 'ctrl'
                },
                'panel-content@app': {
                    templateUrl: 'views/panel.home.html'
                },
                'panel-buttons@app': {
                    templateUrl: 'views/panel.button-bar.home.html'
                }
            },
            data: {
                viewname: 'home'
            }
        })
        .state('app.applist', {
          url: '/app-list',
        //   templateUrl: 'views/app-list-by-popularity.html',
        //   controller: 'AppListController',
        //   controllerAs: 'ctrl',
          views: {
              'panel-content@app': {
                  templateUrl: 'views/app-list-by-popularity.html',
                  controller: 'AppListController',
                  controllerAs: 'ctrl'
              }
          },
          data: {
              viewname: 'app-list'
          }
        })
        .state('app.login', {
            url: '/login',
            templateUrl: 'login/login.html',
            controller: 'LoginController',
            controllerAs: 'ctrl',
            data: {
                viewname: 'login'
            }
        })
        .state('app.display', {
            url: '/{id:[0-9]+}/',
            templateUrl: 'views/app-display.html',
            controller: 'AppDisplayController',
            controllerAs: 'ctrl',
            data: {
                viewname: 'app-display'
            }
        })
        .state('app.edit', {
            url: '/{id:[0-9]+}/edit/',
            templateUrl: 'views/app-editor.html',
            controller: 'AppEditorController',
            controllerAs: 'ctrl',
            data: {
                viewname: 'app-edit'
            }
        })
        .state('app.instance', {
            url: '/{app:[0-9]+}/{id:[0-9]+}/',
            templateUrl: 'views/app-instance.html',
            controller: 'AppInstanceController',
            controllerAs: 'ctrl',
            views: {
                'panel-buttons@app': {
                    templateUrl: 'views/panel.button-bar.instance.html'
                },
                'panel-content@app': {
                    templateUrl: 'views/seed-panel.html'
                }
            },
            data: {
                viewname: 'instance'
            }
        });

        $resourceProvider.defaults.stripTrailingSlashes = false;

    })
    .run(function($rootScope, $location, $http, $cookies, $timeout, $mdToast, $window,
            $document, authentication) {

        $window.Complex = Complex;
        //$window.MathJax = MathJax;
        $window.CodeMirror = CodeMirror;
        $window.CoffeeScript = CoffeeScript;

        $rootScope.hostnametest = $window.location.hostname;

        $.ajaxPrefilter(function( options ) {
            console.log('HOSTNAME2', window.location);
            if (options.url.substr(0,1) == '/') {
                options.url = options.url.substr(1,(options.url.length-1));
            }
            options.url = `http://${$window.location.hostname}:8000/` + encodeURIComponent( options.url );
            options.crossDomain = false;
        });

        $http.defaults.headers.common['X-CSRFToken'] = $cookies['csrftoken'];
        $http.defaults.xsrfCookieName = 'csrftoken';
        $http.defaults.xsrfHeaderName = 'X-CSRFToken';

        $rootScope.showBottom = false;
        $rootScope.topScope = null;

        var history = [];
        $rootScope.$on('$stateChangeStart', function(event, toState,
            toParams, fromState, fromParams, options) {
                history.push($location.$$path);
                $rootScope.stateData = toState.data;
            });
        $rootScope.$on('$routeChangeSuccess', function() {
            history.push($location.$$path);
        });

        $rootScope.scriptTypes = [
            'text/javascript',
            'text/coffeescript',
            'text/paperscript'
        ];

        $rootScope.userLoggedIn = authentication.isAuthorized() ? true : false;
        $rootScope.user = authentication.isAuthorized() ? authentication.current : null;

        $rootScope.back = function () {
            var prevUrl = history.length > 1 ? history.splice(-2)[0] : "/";
            $location.path(prevUrl);
        };

        $rootScope.refreshMathJax = function() {
            $timeout(function() {
                MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
            }, 500);
        };

        $rootScope.toast = function(message) {
          $mdToast.show(
            $mdToast.simple()
              .textContent(message)
              .capsule(true)
              .position('top right')
            );
        };

        $window.renderingDone = function() {
            console.log('renderingDone, $rootScope level');
        };

        $rootScope.hideXS = $window.innerWidth < 400 ? "display: 'none';" : "";

  });

angular.bootstrap(document, ['app'], {
  strictDi: true
});
