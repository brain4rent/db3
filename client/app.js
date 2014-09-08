(function() { // We use this anonymous function to create a closure.

	var app = angular.module('splatter-web', ['ngResource']);

  // REGISTER CONTROLLER
  app.controller('RegisterController', function(User){
     this.registerUser = function(){
       var newName = this.data.registerName;
       var newEmail = this.data.registerEmail;
       var newPassword = this.data.registerPassword;
       User.save({user:{email:newEmail, name:newName, password:newPassword}});
       this.data = {};
    };
  });

  // LOGIN CONTROLLER
	app.controller('LoginController', function(User) {
    this.u = User.get({id: 1});
    
    var self = this;
    this.loginUser = function (){
      var userID = this.data.name;
      self.u = User.get({id: userID});
      this.data = {};
    }
	});

  // UPDATE CONTROLLER
  app.controller('UpdateController', function(User) {
    var self = this;
    this.updateUser = function(){
      var userID = this.data.currentID;
      var userName = this.data.currentName;
      var userBlurb = this.data.currentBlurb;
      User.update({id: userID}, {user:{name: userName, blurb: userBlurb}});
      this.data = {};
     };
   });

  // COMPOSE CONTROLLER
  app.controller('ComposeController', function(Splatt) {
    this.submitSplatt = function(){
      var userID = this.data.userID;
      var splattBody = this.data.currentBody;
      Splatt.save({splatt:{body:splattBody, user_id:userID}});
      this.data = {};
    };
  });

  // FEED CONTROLLER
  app.controller('FeedController', function(Feed) {
    this.feed = Feed.get({id: 1});
    self = this;
    this.updateFeed = function(){
      var userID = this.data.userID;
      self.feed = Feed.get({id: userID});
    }
  });

	app.factory("User", function ($resource) {
    return $resource("http://bernhardt.sqrawler.com/api/users/:id", {},
      {update: {method:'PUT', url:'http://bernhardt.sqrawler.com/api/users/:id'}}
    )
  });

  app.factory("Splatt", function ($resource) {
    return $resource("http://bernhardt.sqrawler.com/api/splatts")
  });

  app.factory("Feed", function ($resource) {
    return $resource("http://bernhardt.sqrawler.com/api/users/splatts-feed/:id.json")
  });

}());