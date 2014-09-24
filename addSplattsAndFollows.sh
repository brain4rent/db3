#!/bin/sh

#Author: 		Dan Bernhardt
#Date:			14/08/2014
#Paper:			Databases 3
#Purpose:		Contains curl commands to show functionality of database api

#Task 1
#Create 3 users
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users -d '{"user": {"email":"bob@test.com", "name":"Bob", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users -d '{"user": {"email":"jane@test.com", "name":"Jane", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users -d '{"user": {"email":"frank@test.com", "name":"Frank", "password":"foo"}}'

#Task 2
#Creates 5 splatts for each user in a manner which produces mixes in chronological order
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hello, Splatter world", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Well hello there", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"First Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Second Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"I can post", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"So much to do", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"So little time", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Third Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Fourth Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Another post", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Fifth Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"And yet another", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Still posting", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"IM YELLING", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Now Im not", "user_id":1}}'

#Task 3
#Causes first user to follow the other 2
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users/follows -d '{"follower_id":1, "followed_id":2}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users/follows -d '{"follower_id":1, "followed_id":3}'

#Task 4
#Gets the first users splatts
curl -i -H "Content-type: application/json" -X GET http://bernhardt.sqrawler.com:3000/users/splatts/1

#Task 5
#Gets the users followed by the first user
curl -i -H "Content-type: application/json" -X GET http://bernhardt.sqrawler.com:3000/users/follows/1

#Task 6
#Displays the first user's newsfeed
curl -i -H "Content-type: application/json" -X GET http://bernhardt.sqrawler.com:3000/users/splatts-feed/1

#Task 7
#Causes the first user to unfollow the third user
curl -i -H "Content-type: application/json" -X DELETE http://bernhardt.sqrawler.com:3000/users/follows/1/3

#Task 8
#Displays the first user's newsfeed
curl -i -H "Content-type: application/json" -X GET http://bernhardt.sqrawler.com:3000/users/splatts-feed/1