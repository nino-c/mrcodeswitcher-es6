import angular from 'angular'
import services from './services'
import {TopCtrl} from './TopCtrl'

let aaae = angular.module('aaae', ['aaae.services']);

aaae.constant('AppConstants', {
    api: 'http://localhost:3000/api',
    jwtKey: 'jwtToken',
    appName: '∀aa∃ :: Apps at an Exhibition',
});

aaae.config(($httpProvider, $stateProvider, $locationProvider, $urlRouterProvider) => {
    'ngInject';

    // $locationProvider.html5Mode(true);
    //$urlRouterProvider.when("", "/app");
    //$urlRouterProvider.when("/", "/app");

    $stateProvider
        .state('app', {
            abstract: true,
            templateUrl: 'index.html'
        })
        // .state('app.home', {
        //     url: '/',
        //     controller: 'HomeCtrl',
        //     controllerAs: 'ctrl',
        //     templateUrl: 'home/home.html',
        //     title: 'home'
        // })
        // .state('app.applist', {
        //   url: '/applist',
        //   controller: 'ApplistCtrl',
        //   controllerAs: 'ctrl',
        //   templateUrl: 'applist/applist.html',
        //   title: 'applist'
        // });

    //$urlRouterProvider.otherwise('/app');

})

aaae.run((AppConstants, $rootScope, api) => {
    'ngInject';

    // $rootScope.currentInstance = null;
    //
    // $rootScope.featuredInstances = [142, 829, 861];
    // $rootScope.featuredInstanceIndex = 0;
    //
    // $rootScope.viewname = 'home';
    // $rootScope.showBottom = true;
    //
    // api.InstanceService.get({'id':$rootScope.featuredInstances[0]})
    //     .$promise.then(instance => $rootScope.setInstance(instance));
    //
    // $rootScope.setInstance = (instance) => {
    //     console.log('$rootScope.setInstance :: $rootScope.currentInstance', instance);
    //     $rootScope.currentInstance = instance;
    // }

    // change page title based on state
    $rootScope.$on('$stateChangeSuccess', (event, toState) => {
        $rootScope.pageTitle = AppConstants.appName + " => " + toState.title;
        $rootScope.viewname = toState.title;
    });

})
export default aaae.name;
