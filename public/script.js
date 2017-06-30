	
    var app = angular.module('test_A', []);
	app.controller('test_C', function($scope, $http) {
		var get = function() {
			$http.get("/task").then(function(response) {
				console.log("sent get");
				$scope.smdata = response.data;
				setTimeout(get, 1000);
			});
			//$scope.$apply()
		};
		setTimeout(get, 1000);
	});

	