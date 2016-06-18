import angular from 'angular';
import header from './header/header.component';
import footer from './footer/footer.component';
import bottomBar from './bottom-bar/bottom-bar.component';

let components = angular.module('app.components', [])
    .component('appHeader', header)
    .component('appFooter', footer)
    .component('bottomBar', bottomBar);

export default components.name;
