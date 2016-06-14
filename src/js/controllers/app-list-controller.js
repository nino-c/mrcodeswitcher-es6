export default class AppListController {
    constructor($rootScope, $timeout, $location, $window, api) {
        'ngInject';

        this.showSearch = false;
        this.loading = true;
        $rootScope.showBottom = false;

        api.AppServiceMinimal.query().$promise.then(apps => {
            this.apps = apps;
            this.loading = false;
        });

        this.openSortMenu = function($mdOpenMenu, $event) {
            $event.stopPropagation();
            $mdOpenMenu($event);
        }

        this.initAppList = function() {
            console.log('AppList scope init');
        };

        // this.toggleAppList = function() {
        //     this.showAppList = !this.showAppList;
        // };


        // $window.renderingDone = function() {
        //     console.log('renderingDone');
        // }

    }
}
