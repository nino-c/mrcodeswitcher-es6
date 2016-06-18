import angular from 'angular';
import material from 'angular-material';
import router from 'angular-ui-router';

import 'angular-route';

// gulp-generated template cache
import './config/app.templates';

import './aaae'

// import './services';
// import './util/filters';
// import './util/directives';
// import './layout';
// import './components';
// import {HomeCtrl} from './home';
// import {ApplistCtrl} from './applist';
// import './profile';
// import './article';
//
// [
//     'ui.router',
//     'ngRoute',
//     'ngMaterial',
//     'templates',
//     'app.services',
//     'app.components',
//     HomeCtrl,
//     ApplistCtrl,
//     'app.profile',
//     'app.article',
//     'app.filters',
//     'app.directives']


// Mount on window for testing
window.app = angular.module('app', [
    'ui.router',
    'ngRoute',
    'ngMaterial',
    'templates',
    'aaae'
]);

angular.bootstrap(document, ['app'], {
  strictDi: true
});
