# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "json"
verticals_file = File.open "json/verticals.json"
verticals = JSON.load verticals_file

for vertical in verticals do
  Vertical.create( name: vertical['Name'] )
end

categories_file = File.open "json/categories.json"
categories = JSON.load categories_file

for category in categories do
  Category.create( name: category['Name'], vertical_id: category["Verticals"], state: category["State"] )
end

courses_file = File.open "json/courses.json"
courses = JSON.load courses_file

for course in courses do
  Course.create( name: course['Name'], category_id: course["Categories"], state: course["State"],author: course["Author"] )
end
