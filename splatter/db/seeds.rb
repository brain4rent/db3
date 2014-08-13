# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users.create!([
	{id: 1, email: "bob@test.com", password: "test", name: "Bob"},
	{id: 2, email: "jane@test.com", password: "test", name: "Jane"},
	{id: 3, email: "frank@test.com", password: "test", name: "Frank"},
	{id: 4, email: "george@test.com", password: "test", name: "George"},
	{id: 5, email: "jim@test.com", password: "test", name: "Jim"}
])

splatts.create!([
	{body: "Hello all", belongs_to: 1},
	{body: "Here's another splatt", belongs_to: 1},
	{body: "And yet another", belongs_to: 1},
	{body: "First Post", belongs_to: 2},
	{body: "I'M YELLING", belongs_to: 2},
	{body: "Sorry for yelling", belongs_to: 2},
	{body: "This is weird", belongs_to: 3},
	{body: "Procrastinating", belongs_to: 3},
	{body: "This is a splatt", belongs_to: 3},
	{body: "Just like twitter", belongs_to: 4},
	{body: "So much to do", belongs_to: 4},
	{body: "So little time", belongs_to: 4},
	{body: "Change to splatter they said", belongs_to: 5},
	{body: "It'll be fun they said", belongs_to: 5},
	{body: "Is it?", belongs_to: 5}
])

follows.create!([
	{follower_id: 1, followed_id: 2},
	{follower_id: 1, followed_id: 3},
	{follower_id: 1, followed_id: 4},
	{follower_id: 1, followed_id: 5},
	{follower_id: 2, followed_id: 1},
	{follower_id: 3, followed_id: 1},
	{follower_id: 4, followed_id: 1},
	{follower_id: 5, followed_id: 1},
	{follower_id: 2, followed_id: 3},
	{follower_id: 3, followed_id: 2},
	{follower_id: 4, followed_id: 5},
	{follower_id: 5, followed_id: 4}
])

