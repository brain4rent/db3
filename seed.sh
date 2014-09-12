#!/bin/sh

#Author: 		Dan Bernhardt
#Date:			12/09/2014
#Paper:			Databases 3
#Purpose:		Seed database for site

#Create 3 users
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"bob@test.com", "name":"Bob", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"jane@test.com", "name":"Jane", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"frank@test.com", "name":"Frank", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"jeff@test.com", "name":"Jeff", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"george@test.com", "name":"George", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"dave@test.com", "name":"Dave", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"dan@test.com", "name":"Dan", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"john@test.com", "name":"John", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users -d '{"user": {"email":"colin@test.com", "name":"Colin", "password":"foo"}}'

#Creates 5 splatts for each user in a manner which produces mixes in chronological order

curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Im First", "user_id":4}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Hello, Splatter world", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Well hello there", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"First Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"In the average lifetime, a person will walk the equivalent of 5 times around the equator.", "user_id":4}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Isaac Asimov is the only author to have a book in every Dewey-decimal category.", "user_id":5}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Albert Einstein and Charles Darwin both married their first cousins", "user_id":6}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Half of all bank robberies take place on a Friday.", "user_id":7}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"In 1980, a Las Vegas hospital suspended workers for betting on when patients would die.", "user_id":8}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"In Utah, it is illegal to swear in front of a dead person.", "user_id":9}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Second Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"First PostAccording to suicide statistics, Monday is the favored day for self-destruction.First Post", "user_id":7}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The plastic things on the end of shoelaces are called aglets.", "user_id":8}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"I can post", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The average person spends about 2 years on the phone in a lifetime", "user_id":8}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"So much to do", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"So little time", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The 57 on Heinz ketchup bottles represents the number of varieties of pickles the company once had.", "user_id":8}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Odontophobia is the fear of teeth.", "user_id":9}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Third Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Fourth Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Another post", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Fifth Post", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"And yet another", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Still posting", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"IM YELLING", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Now Im not", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Cats sleep 16 to 18 hours a day", "user_id":5}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The most common name in the world is Mohammed", "user_id":6}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The king of hearts is the only without a moustache", "user_id":7}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Women are 37% more likely to go to a psychiatrist than men are", "user_id":8}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The international telephone dialing code for Antarctica is 672", "user_id":9}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"When snakes are born with two heads, they fight each other for food.", "user_id":4}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"St. Stephen is the patron saint of bricklayers.", "user_id":5}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The average person makes about 1,140 telephone calls each year.", "user_id":6}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Canadian researchers have found that Einsteins brain was 15% wider than normal.", "user_id":7}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"In ancient Rome, it was considered a sign of leadership to be born with a crooked nose", "user_id":9}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The bagpipe was originally made from the whole skin of a dead sheep.", "user_id":4}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"On average, there are 178 sesame seeds on each McDonalds BigMac bun.", "user_id":5}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Minus 40 degrees Celsius is exactly the same as minus 40 degrees Fahrenheit.", "user_id":6}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Every human spent about half an hour as a single cell.", "user_id":7}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"The elephant is the only animal with 4 knees.", "user_id":9}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"Kansas state law requires pedestrians crossing the highways at night to wear tail lights.", "user_id":4}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"There are two credit cards for every person in the United States.", "user_id":5}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/splatts -d '{"splatt": {"body":"First PostAccording to suicide statistics, Monday is the favored day for self-destruction.First Post", "user_id":7}}'




#Causes first user to follow the other 2
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users/follows -d '{"follower_id":1, "followed_id":2}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com/api/users/follows -d '{"follower_id":1, "followed_id":3}'
