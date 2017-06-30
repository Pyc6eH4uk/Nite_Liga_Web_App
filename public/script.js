/* 
* COPYRIGHT (C) 2017 Zorin Alexei zetx43@gmail.com
*
* 
*/
   
var INF;
var app = angular.module('test_A', []);
	app.controller('test_C', function($scope, $http) {
		var get = function() {
			$http.get("/get_task").then(function(response) {
				console.log("sent get");
				INF = $scope.smdata = response.data;
				setTimeout(get, 1000);
			});
			//$scope.$apply()
		};
		setTimeout(get, 1000);
	});

	app.config(['$qProvider', function ($qProvider) {
		$qProvider.errorOnUnhandledRejections(false);
	}]);

