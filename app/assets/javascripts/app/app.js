var brewbeckApp = angular.module('brewbeckApp', [
    'brewbeckRouter',
    'brewbeckController',
    'ngResource'
    ]);

var brewbeckController = angular.module('brewbeckController', []);

var brewbeckRouter = angular.module('brewbeckRouter', [
    'ngRoute'
    ]);

brewbeckRouter.config(['$routeProvider', function($routeProvider) {
    $routeProvider
    .when('/', {
        templateUrl: '/templates/dashboard.html',
        controller: 'BeerCtrl'
    })
    .when('/beer_selection', {
        templateUrl: '/templates/beer_selection.html',
        controller: 'BeerCtrl'
    });
}]);