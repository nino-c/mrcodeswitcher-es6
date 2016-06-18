import angular from 'angular';

import './config'
import request from './request'
import auth from './authentication';
import resolver from './resolver';
import api from './api';

export default angular.module('aaae.services', [
    request,
    auth,
    resolver,
    api
]).name;
