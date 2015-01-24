'use strict'

angular
  .module('beautyApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
  ])

  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'

