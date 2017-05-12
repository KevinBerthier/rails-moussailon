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
user = User.new({email: "user@exemple.com", password: "password",
  first_name: "Kevin", last_name: "Berthier",
  description: "Salut je m'appelle Kevin et j'adore la mer ! Marseille
  Mais je ne sais pas nager... A vos risques et perils"})
user.save

puts 'Creating boats...'
boats_attributes = [
  {
    name:         "Grand voilier",
    address:      "Vieux Port",
    city:         "Marseille",
    user:         user,
    price:        150,
    capacity:     6,

    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!"
  },
  {
    name:         "Yacht",
    address:      "Port de Malmousque",
    city:         "Marseille",
    user:         user,
    price:        200,
    capacity:     4,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!"
  },
  {
    name:         "Grand voilier",
    address:      "Port de plaisance",
    city:         "Toulon",
    user:         user,
    price:        50,
    capacity:     2,
    description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur dolorum adipisci rerum ratione eius nobis eveniet officiis at animi. Rem libero eum recusandae sit corporis voluptas, eos consectetur possimus suscipit!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse minima odit, nostrum tenetur maiores sint odio aspernatur. Enim repudiandae dignissimos totam accusantium voluptates maiores earum quia. Non nemo explicabo dignissimos!"
  }
]
Boat.create!(boats_attributes)

Boat.all.each do |boat|
  boat.photo_urls = ["http://res.cloudinary.com/dzxuxl4av/image/upload/v1494580495/nv2mhzwwiimhhaseew0k.jpg"]
end

puts 'Finished!'
