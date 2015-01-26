'use strict'

angular
  .module('beautyApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'duScroll'
  ])

  .config ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode true
    $routeProvider
      .when '/:path?',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/home'