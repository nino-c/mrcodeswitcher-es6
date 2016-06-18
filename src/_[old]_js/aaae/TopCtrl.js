import angular from 'angular';

class TopCtrl {
    constructor($rootScope, api) {
        'ngInject';

        this.currentInstance = null;
        this.viewname = 'home';

        this.featuredInstances = [142, 829, 861];
        this.featuredInstanceIndex = 0;

        this.setInstance = (id) => {
            api.InstanceService.get({'id':id}).$promise.then(instance => {
                console.log('TopCtrl setInstance', instance);
                this.currentInstance = instance;
            })
        }
        this.setInstance(this.featuredInstances[0]);

    }

    testInstanceChange() {
        console.log('--%%tic');
        this.setInstance(121);
    }

}

export default TopCtrl
