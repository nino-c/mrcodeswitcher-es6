import 'angular'
import 'angular-material';
import 'angular-ui-router';
import 'angular-route';
import 'angular-resource';
import 'angular-cookies';
import 'angular-bootstrap';
//import 'ng-infinite-scroll';

// gulp-generated template cache
import './config/templates';

import './controllers';
import './services';
import './directives';
import './services';
import './filters';

import login from './login';

import 'numeric';
import 'underscore';
import Complex from 'complex';
import Babel from  'babel-standalone';
//import 'codemirror';
//import 'angular-ui-codemirror';
//import MathJax from 'mathjax';

// Mount on window for testing
window.app = angular.module('app', [
    'ui.router',
    'ngMaterial',
    'ui.bootstrap',
    //'ui.codemirror',
    'ngRoute',
    'ngResource',
    'ngCookies',
    //'infinite-scroll',
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
    //theme: "monokai",
    //gutters: ['codemirror-gutters']
  }
})
.config(function($mdThemingProvider, $stateProvider, $urlRouterProvider, $resourceProvider) {

        $urlRouterProvider.otherwise('/app/home')
        $mdThemingProvider.theme('default')
            .primaryPalette('blue-grey')
            .accentPalette('orange');

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
        .state('app.instance', {
            url: '/:app/:id',
            templateUrl: 'views/app-instance.html',
            controller: 'AppInstanceController',
            controllerAs: 'ctrl'
        });

        // $stateProvider
        //     .state('home', {
        //         url:'',
        //         views: {
        // 			'content': {
        // 				templateUrl: 'views/homepage.html',
        //                 controller: 'HomeController'
        // 			},
        // 			'bottom': {
        // 				templateUrl: 'views/bottom-bar.html',
        //                 controller: 'BottomBarController'
        // 			}
        // 		}
        //     })
        //     .state('app', {
        // 		url: 'app-list',
        // 		views: {
        // 			'content': {
        // 				templateUrl: 'views/app-list-by-popularity.html',
        //                 controller: 'AppListController'
        // 			}
        // 		}
        // 	})

        $resourceProvider.defaults.stripTrailingSlashes = false;

        // $routeProvider
        //     .when('/', {
        //       templateUrl: 'views/homepage.html'
        //     })
        //     .when('/paperscript/:id', {
        //       templateUrl: 'views/paperscript.html'
        //     })
        //     .when('/apps-list/', {
        //       templateUrl: 'views/app-list-by-popularity.html'
        //     })
        //     .when('/apps/new/', {
        //       templateUrl: 'views/app-editor.html'
        //     })
        //     .when('/apps/:id/', {
        //       templateUrl: 'views/app-details.html'
        //     })
        //     .when('/apps/:id/edit/', {
        //       templateUrl: 'views/app-editor.html'
        //     })
        //     .when('/instance/:app_id/:instance_id/', {
        //       templateUrl: 'views/app-display.html',
        //       reloadOnSearch: false
        //     })
        //     // .when('/categories/', {
        //     //   templateUrl: 'views/categories.html'
        //     // })
        //     // .when('/category/:id/', {
        //     //   templateUrl: 'views/category-list.html'
        //     // })
        //     .otherwise({
        //       redirectTo: '/'
        //     })

    })
    .run(function($rootScope, $location, $http, $cookies, $timeout, $mdToast, $window,
            $document, authentication) {

        $window.Complex = Complex;
        //$window.MathJax = MathJax;

        $.ajaxPrefilter(function( options ) {
            if ($window.location.hostname == 'localhost') {
                if (options.url.substr(0,1) == '/') {
                    options.url = options.url.substr(1,(options.url.length-1));
                }
                options.url = "http://localhost:8000/" + encodeURIComponent( options.url );
                options.crossDomain = false;
            }
        });

        // paperscript events
        //$document.on('click', function(event) {
            //console.log(event);
            //$rootScope.$broadcast('click', {event:{point:{x:event.clientX, y:event.clientY}}});
            //$window.clickHandler({point:{x:event.clientX, y:event.clientY}});
        //})

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

        //$rootScope.userLoggedIn = isNaN(parseInt($window.USER_ID)) ? false : true;
        $rootScope.userLoggedIn = authentication.isAuthorized() ? true : false;
        //$rootScope.userLoggedIn = true; $window.USER_ID = 1;
    //     $rootScope.goHome = function() {
    //       $location.path('/');
    //       $rootScope.showBottom = false;
    //       $rootScope.viewname = 'home';
    //       $rootScope.topScope.init();
    //   };

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
