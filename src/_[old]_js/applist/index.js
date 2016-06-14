import angular from 'angular';

class ApplistCtrl {

    constructor(api) {
        'ngInject';

        this.apps = [];
        this.loading = true;

        api.AppServiceMinimal.query()
            .$promise.then(apps => {
                this.apps = apps;
                this.loading = false;
            })

    }

}


let applistModule = angular.module('app.applist', [])
    // .config($stateProvider => {
    //   'ngInject';
    //
    //   $stateProvider
    //   .state('app.applist', {
    //     url: '/applist',
    //     controller: 'ApplistCtrl',
    //     controllerAs: 'ctrl',
    //     templateUrl: 'applist/applist.html',
    //     title: 'Apps by popularity'
    //   });
    //
    // })
    .controller('ApplistCtrl', ApplistCtrl)

export default applistModule.name;
