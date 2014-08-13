#!/bin/sh

#Author: 		Dan Bernhardt
#Date:			14/08/2014
#Paper:			Databases 3
#Purpose:		Contains curl commands to show functionality of database api

#Task 1
#Create 3 users
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000

#Task 2
#Creates 5 splatts for each user in a manner which produces mixes in chronological order
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000

#Task 3
#Causes first user to follow the other 2
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000

#Task 4
#Gets the first users splatts
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000

#Task 5
#Gets the users followed by the first user
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000

#Task 6
#Displays the first user's newsfeed
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000

#Task 7
#Causes the first user to unfollow the third user
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000

#Task 8
#Displays the first user's newsfeed
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000