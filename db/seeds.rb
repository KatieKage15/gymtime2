# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'robb@gmail.com', username: 'robb123', password: 'abc123')
User.create(email: 'katie@gmail.com', username: 'katie456', password: 'abc456')
User.create(email: 'rosie@gmail.com', username: 'rosie789', password: 'abc789')
User.create(email: 'corinna@gmail.com', username: 'corinna012', password: 'abc012')

Instructor.create(name: 'Sam', gym: 'Globo', specialty: 'Strength')
Instructor.create(name: 'Amber', gym: 'Planet Fitness', specialty: 'Cardio')
Instructor.create(name: 'Tyler', gym: 'CrossFit Dynamix', specialty: 'Strength')
Instructor.create(name: 'Katie', gym: 'CrossFit Queens', specialty: 'Strength')
Instructor.create(name: 'Susan', gym: 'Happy Fitness', specialty: 'Spin')
Instructor.create(name: 'Sean', gym: 'Slow Turtle Gym', specialty: 'Yoga')
Instructor.create(name: 'Lauren', gym: 'Speedy', specialty: 'Cardio')
Instructor.create(name: 'Peter', gym: 'Move the Body', specialty: 'Pilates')
Instructor.create(name: 'Greg', gym: 'Grassroots Fitness', specialty: 'Spin')
