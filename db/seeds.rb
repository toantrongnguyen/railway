# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  name = Faker::Name.name
  gender = Faker::Gender.binary_type == 'Male' ? 1 : 0
  birthday = Faker::Date.backward(days: 100.years / 1.day)
  Actor.create!(name: name, gender: gender, birthday: birthday)
end
