
export default class AppDisplayController {
    constructor($rootScope, $scope, $stateParams, $location, $route, $http,
        $window, $mdToast, $timeout, api) {
        'ngInject';

        this.loading = true;
        this.loadingInstances = true;
        $rootScope.showBottom = false;

        api.AppServiceMinimal.get({id:$stateParams.id})
            .$promise.then(app_min => {

                this.app = app_min;
                this.loading = false;

                if (this.app.instance_count == 0) return;

                api.OrderedInstanceService.query({id:this.app.id})
                    .$promise.then(instances => {

                        _.each(instances, inst => {
                            inst._seed = JSON.parse(inst.seed);
                            inst.image = inst.images[0];
                        });
                        this.instances = instances;
                        this.loadingInstances = false;

                });

                $http({
                    method: 'GET',
                    url: '/api/increment-popularity/app/' + this.app.id + '/'
                }).then(response => {
                    console.log('increment response', response);
                }, error => {
                    console.log('increment response', error);
                });

            }
        );


        this.selectFirstInstance = function() {
            if (this.app.instance_count > 0) {
                this.selectInstance(this.app.first_instance_id);
            } else {
                this.instantiate();
            }
        };

          this.playApp = function() {

          }

          this.selectInstance = function(instance_id) {
              $location.path('/instance/'+this.app.id+'/'+instance_id+'/')
          };

          this.instantiate = function() {
              var req = {
                  method: 'GET',
                  url: '/game/app-instantiate/' + this.app.id + '/',
                  headers: {
                      'Content-Type': 'application/json'
                  }
              }

              $http(req).then(function successCallback(response) {

                  console.log(response);

                  if (response.data.id) {

                      $location.path('/instance/'+this.app.id+'/'+response.data.id+'/');
                      $rootScope.toast("New instance created");

                  }

              }, function errorCallback(response) {
                  console.log('error', response)
              });

          };

          this.delete = function() {
              if (confirm("Are you sure you want to delete this app?")) {
                  AppService.$delete({id:this.app.id}).$promise.then(function(response) {
                  // this.app = _.reject(
                  //   this.app, function(a) {
                  //     return a.id == this.app.id;
                  //   })
                  console.log(response);
                });
              }
          };

        this.deleteInstance = function($event, instance) {

          $event.stopPropagation();
          $event.preventDefault();

          if (confirm("Are you sure you want to delete this instance?")) {

              InstanceService.remove({id:instance.id}, function(response) {
                  console.log('deleted', response)
                  this.app.instances = _.reject(
                      this.app.instances, function(inst) {
                      return inst.id == instance.id;
                  });
              })

          }
        };

        $window.renderingDone = function() {
          console.log('renderingDone');
        }
    }
}
