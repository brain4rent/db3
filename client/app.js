(function() { // We use this anonymous function to create a closure.

	var app = angular.module('splatter-web', ['ngResource']);


  // REGISTER CONTROLLER
  app.controller('RegisterController', function(User){
     
  });

  // LOGIN CONTROLLER
	app.controller('UserController', function(User, Feed, Follows, Splatt) {
    this.u;
    this.feed;
    var self = this;
    this.registerUser = function(){
       var newName = this.data.registerName;
       var newEmail = this.data.registerEmail;
       var newPassword = this.data.registerPassword;
       User.save({user:{email:newEmail, name:newName, password:newPassword}});
       this.data = {};
    };
    this.loginUser = function (){
      var userID = this.data.loginName;
      self.u = User.get({id: userID});
      self.feed = Feed.get({id: userID});
      this.data = {};
    };
    this.updateUser = function(){
      var userID = self.u.id;
      var userName = this.data.updateName;
      var userBlurb = this.data.updateBlurb;
      User.update({id: userID}, {user:{name: userName, blurb: userBlurb}});
      this.data = {};
    };
    this.addFollow = function(){
      var follower = self.u.id;
      var followed = this.data.addFollow;
      Follows.save({follower_id: follower, followed_id: followed});
      this.data = {};
    };
    this.removeFollow = function(){
      var follower = self.u.id;
      var followed = this.data.removeFollow;
      Follows.delete({follower_id:follower, followed_id:followed});
      this.data = {};
    };
    this.removeUser = function(){
      var userID = self.u.id;
      User.delete({id:userID});
      this.data = {};
    };
    this.submitSplatt = function(){
      var userID = self.u.id;
      var splattBody = this.data.newBody;
      Splatt.save({splatt:{body:splattBody, user_id:userID}});
      this.data = {};
    };
	});

  // FEED CONTROLLER
  app.controller('FeedController', function(Feed) {
    this.feed;
    self = this;
    this.updateFeed = function(){
      var userID = this.data.userID;
      self.feed = Feed.get({id: userID});
      this.data = {};
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

  app.factory("Follows", function ($resource) {
    return $resource("http://bernhardt.sqrawler.com/api/users/follows/:follower_id/:followed_id")
  });

}());