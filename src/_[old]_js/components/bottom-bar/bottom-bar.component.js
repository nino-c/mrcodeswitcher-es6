class BottomBarCtrl {
  constructor($rootScope) {
    'ngInject';

    //this.app = this.instance.game;
    console.log('BottomBarCtrl construct');
    
  }

}

let BottomBar = {
  controller: BottomBarCtrl,
  bindings: {
      instance: '=',
      viewname: '='
  },
  templateUrl: 'components/bottom-bar/bottom-bar.html'
};

export default BottomBar;
