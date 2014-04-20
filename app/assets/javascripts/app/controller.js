brewbeckController.controller('BeerCtrl', ['$scope', '$http', function($scope, $http) {

    getBeers();
    function getBeers(){
        $http.get('./beer.json').success(function(data) {
            $scope.beers = data;
            console.log(data)
        });
    }
}]);