import angular from 'angular';
import 'angular-resource';

import config from './config';

class API {
    constructor($resource) {
        'ngInject';

        this.token = localStorage.getItem(config.AUTH_KEY);

        this.AppService = $resource(this.endpointUrl('/api/apps/:id/'), {id:'@id'}, {
            update: {
                method: 'PUT'
            }
        });
        this.AppServiceMinimal = $resource(this.endpointUrl('/api/apps-minimal/:id/'), {id:'@id'}, {
            update: {
                method: 'PUT'
            }
        });
        this.InstanceService = $resource(this.endpointUrl('/api/instances/:id/'), {id:'@id'}, {
            update: {
                method: 'PUT'
            }
        });
        this.OrderedInstanceService = $resource(this.endpointUrl('/game/instances-ordered/:id/'), {
            id:'@id'
            //key:'@key'
        });
        this.CodeModuleService = $resource(this.endpointUrl('/api/code_modules/:id/'), {id:'@id'}, {
            update: {
                method: 'PUT'
            }
        });
        this.CategoryService = $resource(this.endpointUrl('/api/categories/:id/'), {id:'@id'}, {
            update: {
                method: 'PUT'
            }
        });
        this.CategoryWithApps = $resource(this.endpointUrl('/api/categories-with-apps/:id/'), {id:'@id'});
    }

    endpointUrl(url) {
        return `${config.ENDPOINT}${url}`;
    }
}

export default angular.module('services.api', ['ngResource'])
  .service('api', API)
  .name;
