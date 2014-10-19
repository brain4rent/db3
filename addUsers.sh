#!/bin/sh

#Author: 		Dan Bernhardt
#Paper:			Databases 3


#Create 3 users
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users -d '{"user": {"email":"bob@test.com", "name":"Bob", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users -d '{"user": {"email":"jane@test.com", "name":"Jane", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users -d '{"user": {"email":"frank@test.com", "name":"Frank", "password":"foo"}}'
