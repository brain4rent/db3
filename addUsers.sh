#!/bin/sh

#Author: 		Dan Bernhardt
#Date:			24/09/2014
#Paper:			Databases 3
#Purpose:		Contains curl commands to add 3 new users

#Create 3 users
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users -d '{"user": {"email":"bob@test.com", "name":"Bob", "password":"foo"}}'
curl -i -H "Content-type: application/json" -X POST http://bernhardt.sqrawler.com:3000/users -d '{"user": {"email":"jane@test.com", "name":"Jane", "password":"foo"}}'
