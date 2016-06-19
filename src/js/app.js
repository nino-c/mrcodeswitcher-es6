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
    //'react',
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
    'login'
]);




window.app.value('ui.config', {
  codemirror: {
    lineWrapping : true,
    lineNumbers: true,
    indentWithTabs: true,
    viewportMargin: Infinity,
    mode: 'javascript',
    matchBrackets: true,
    theme: "mdn-like",
    //gutters: ['codemirror-gutters']
  }
})
.config(function($mdThemingProvider, $stateProvider, $urlRouterProvider,
    $resourceProvider, $mdIconProvider) {



    //var codeswitcherMap = $mdThemingProvider.extendPalette('light-green', {
    //'500': '#ff0000',
    //'contrastDefaultColor': 'dark'
    //});
    // $mdThemingProvider.definePalette('codeswitcher', codeswitcherMap);
    //     $mdThemingProvider.theme('default')
    //     .primaryPalette('codeswitcher')
    //     // If you specify less than all of the keys, it will inherit from the
    //     // default shades
    //     .accentPalette('green', {
    //         'default': '300' // use shade 200 for default, and keep all other shades the same
    //     });
    //     $mdThemingProvider.alwaysWatchTheme(true);
    $mdThemingProvider.theme('default')
            .primaryPalette('blue-grey')
            .accentPalette('orange');

    $mdIconProvider.viewBoxSize = 16;

    //$mdIconProvider.viewBoxSize = 16;

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
                'bottom-bar@app': {
                    controller: 'BottomBarController',
                    controllerAs: 'ctrl',
                    templateUrl: 'views/bottom-bar.html'
                },
            }
        })
        .state('app.home', {
            url: '/home',
            templateUrl: 'views/homepage.html',
            controller: 'HomeController',
            controllerAs: 'ctrl',
            //resolve: { __: resolverProvider.$get }
        })
        .state('app.login', {
            url: '/login',
            templateUrl: 'login/login.html',
            controller: 'LoginController',
            controllerAs: 'ctrl'
        })
        .state('app.applist', {
          url: '/app-list',
          templateUrl: 'views/app-list-by-popularity.html',
          controller: 'AppListController',
          controllerAs: 'ctrl',
          //resolve: { __: resolverProvider.$get }
        })
        .state('app.display', {
            url: '/:id',
            templateUrl: 'views/app-display.html',
            controller: 'AppDisplayController',
            controllerAs: 'ctrl'
        })
        .state('app.edit', {
            url: '/:id/edit/',
            templateUrl: 'views/app-editor.html',
            controller: 'AppEditorController',
            controllerAs: 'ctrl'
        })
        .state('app.instance', {
            url: '/:app/:id',
            templateUrl: 'views/app-instance.html',
            controller: 'AppInstanceController',
            controllerAs: 'ctrl'
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

        // $rootScope.showBGCanvas = true;   <--------- now obsolete
        // $rootScope.showAppCanvas = false; <--------- now obsolete
        $rootScope.isAngularApp = true;
        $rootScope.showBottom = false;
        $rootScope.topScope = null;
        $rootScope.viewname = 'home';
        $rootScope.currentInstanceId = 0;

        var history = [];
        $rootScope.$on( "$routeChangeStart", function($event, next, current) {
            history.push($location.$$path);
        });
        $rootScope.$on('$routeChangeSuccess', function() {
            history.push($location.$$path);
        });

        // root-scope vars
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
