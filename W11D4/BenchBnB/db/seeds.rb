# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Bench.destroy_all

# ActiveRecord::Base.connection.reset_pk_sequence!('users')
# ActiveRecord::Base.connection.reset_pk_sequence!('benches')
#  RESETS THE PRIMARY KEY ID

user1 = User.create(name: "JD", password: "password", email: "jd@aa.io")
user1 = User.create(name: "Jacky", password: "password", email: "jacky@aa.io")

area1 = Bench.create(description: "Little Baobab", lat: 37.760683, lng: -122.417228)
area2 = Bench.create(description: "San Tung", lat: 37.763964, lng: -122.468546)