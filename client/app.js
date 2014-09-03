(function() { // We use this anonymous function to create a closure.

	var app = angular.module('splatter-web', ['ngResource']);

  //solves CORS issues
  app.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.headers.common = {};
    $httpProvider.defaults.headers.post = {};
    $httpProvider.defaults.headers.put = [];
  }]);

  // USER CONTROLLER
	app.controller('UserController', function(User) {
    this.u = User.get({id: 1});
    
    var self = this;
    this.updateUser = function (){
      var userID = this.data.name;
      self.u = User.get({id: userID});
      this.data = {};
    }
	});


  app.controller('RegisterController', function(User){
  });

	app.factory("User", function ($resource) {
    return $resource("http://bernhardt.sqrawler.com/api/users/:id");
  });

}());