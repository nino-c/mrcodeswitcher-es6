import angular from 'angular';

// a blank page

class HomeCtrl {
    constructor() {
        'ngInject';
        this.test = 23;
    }

}

let homeModule = angular.module('app.home', []);
homeModule.config($stateProvider => {
    'ngInject';

    // $stateProvider.state('app.home', {
    //     url: '/',
    //     controller: 'HomeCtrl',
    //     controllerAs: 'ctrl',
    //     templateUrl: 'home/home.html',
    //     title: 'home'
    // });

})
.controller('HomeCtrl', HomeCtrl);



export default homeModule.name;
