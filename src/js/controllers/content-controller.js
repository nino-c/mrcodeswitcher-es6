/*
*	The `ContentController` handles everything to do with the
*	one and only <canvas> element, for bg and apps
*/



export default class ContentController {

    constructor($rootScope, $scope, $location, $timeout, $window, $state) {
		'ngInject';

        $rootScope.topScope = this;
		$rootScope.viewscope = this;

		this.loading = false;
        this.testvar2 = 2;
		this.featuredApps = [[888,60], [901, 15], [121,7]];
		this.currentInstance = null;
        this.currentInstanceIndex = 0;
        this.currentInstanceId = this.featuredApps[0][0];

		this.canvasLoadConfig = {
			loadFromServer: true,
		};

        this.init = () => {
            console.log('content init', $state);
            if ($state.current.name != 'app.instance') {
                $timeout(() => {
                    this.setCurrentInstance( this.featuredApps[this.currentInstanceIndex][0] );
                })
            }
        }

		this.setCurrentInstance = (id) => {
			if (id == this.currentInstanceId) {
				this.currentInstanceId = 0;
			}
			console.log('setCurrentInstance = ', id);
			this.currentInstanceId = id;
		};

		this.toggleBottomBar = () => {
            $rootScope.showBottom = !$rootScope.showBottom;
			console.log('toggleBottomBar', $rootScope.showBottom);
        };

        this.nextApp = () => {
            this.currentInstanceIndex++;
            this.currentInstanceIndex = this.currentInstanceIndex % this.featuredApps.length;
            this.setCurrentInstance( this.featuredApps[this.currentInstanceIndex][0] );
        };

   }
}
