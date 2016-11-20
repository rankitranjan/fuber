# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  car = Car.create([
  	{ color: 'Pink', number: "MP09AB1231", owner_name: "foo1", model: "Indica", availability: true , latitude: 401, longitude: 40},
  	{ color: 'Silver', number: "MP09AB1232", owner_name: "foo3", model: "Indica", availability: true , latitude: 402, longitude: 39},
  	{ color: 'white', number: "MP09AB1233", owner_name: "foo4", model: "Indica", availability: true , latitude: 403, longitude: 38},
  	{ color: 'white', number: "MP09AB1234", owner_name: "foo2", model: "Indica", availability: true , latitude: 404, longitude: 37},
  	{ color: 'Black', number: "MP09AB1235", owner_name: "foo5", model: "Indica", availability: true , latitude: 405, longitude: 36},
  	{ color: 'Silver', number: "MP09AB1236", owner_name: "foo6", model: "Indica", availability: true , latitude: 406, longitude: 35 }
  ])