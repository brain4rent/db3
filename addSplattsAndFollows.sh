#!/bin/sh

#Author: 		Dan Bernhardt
#Paper:			Databases 3

#Creates 5 splatts for each user in a manner which produces mixes in chronological order
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hello, Splatter world", "user_id":54444eb069702d31ec000000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Well hello there", "user_id":54444eb069702d31ec010000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"First Post", "user_id":54444eb069702d31ec020000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Second Post", "user_id":54444eb069702d31ec020000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"I can post", "user_id":54444eb069702d31ec010000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"So much to do", "user_id":54444eb069702d31ec000000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"So little time", "user_id":54444eb069702d31ec000000"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Third Post", "user_id":54444eb069702d31ec020000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Fourth Post", "user_id":54444eb069702d31ec020000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Another post", "user_id":54444eb069702d31ec010000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Fifth Post", "user_id":54444eb069702d31ec020000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"And yet another", "user_id":54444eb069702d31ec010000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Still posting", "user_id":54444eb069702d31ec010000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"IM YELLING", "user_id":54444eb069702d31ec000000}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Now Im not", "user_id":54444eb069702d31ec000000}}'

#Task 3
#Causes first user to follow the other 2
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users/follows -d '{"follower_id":54444eb069702d31ec000000, "followed_id":54444eb069702d31ec010000}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users/follows -d '{"follower_id":54444eb069702d31ec000000, "followed_id":54444eb069702d31ec020000}'

#Task 4
#Gets the first users splatts
curl -i -H "Content-type: application/json" -X GET http://bernhardt.sqrawler.com:3000/users/splatts/1544422a869702d2fe8000000

#Task 5
#Gets the users followed by the first user
curl -i -H "Content-type: application/json" -X GET http://bernhardt.sqrawler.com:3000/users/follows/54444eb069702d31ec000000

#Task 6
#Displays the first user's newsfeed
curl -i -H "Content-type: application/json" -X GET http://bernhardt.sqrawler.com:3000/users/splatts-feed/54444eb069702d31ec000000

#Task 7
#Causes the first user to unfollow the third user
curl -i -H "Content-type: application/json" -X DELETE http://bernhardt.sqrawler.com:3000/users/follows/54444eb069702d31ec000000/54444eb069702d31ec020000

#Task 8
#Displays the first user's newsfeed
curl -i -H "Content-type: application/json" -X GET http://bernhardt.sqrawler.com:3000/users/splatts-feed/54444eb069702d31ec000000
