﻿(function () {
    'use strict';

    function data($http, $q, baseUrl) {

        function get(url, params) {
            var defered = $q.defer();

            $http
                .get(baseUrl + url, {
                    params: params
                })
                .then(function (response) {
                    defered.resolve(response.data);
                }, function (err) {
                    defered.reject(err.data);
                });

            return defered.promise;
        }

        function post(url, data) {
            var defered = $q.defer();

            $http
                .post(baseUrl + url, data)
                .then(function (response) {
                    defered.resolve(response.data);
                }, function (err) {
                    defered.reject(err.data);
                });

            return defered.promise;
        }

        return {
            get: get,
            post: post
        }
    }

    angular.module('game.services')
        .factory('data', ['$http', '$q', 'baseUrl', data]);
}());