# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
User.destroy_all
Boat.destroy_all

puts 'Creating user...'
user = User.new({email: "user@exemple.com", password: "password"})
user.save

puts 'Creating boats...'
boats_attributes = [
  {
    name:         "Grand voilier",
    address:      "Vieux Port",
    city:         "Marseille",
    user:         kevin
  },
  {
    name:         "Yacht",
    address:      "Port de Malmousque",
    city:         "Marseille",
    user:         kevin
  },
  {
    name:         "Grand voilier",
    address:      "Port de plaisance",
    city:         "Toulon",
    user:         kevin
  }
]
Boat.create!(boats_attributes)
puts 'Finished!'
