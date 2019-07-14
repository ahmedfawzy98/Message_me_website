# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'ahmed', password: 'password')
User.create(username: 'mohamed', password: 'password')
User.create(username: 'omar', password: 'password')
User.create(username: 'ali', password: 'password')
User.create(username: 'khaled', password: 'password')

Message.create(body: 'Hey everybody', user_id: User.find(1).id)
Message.create(body: 'Hello world', user_id: User.find(2).id)
Message.create(body: 'Good morning', user_id: User.find(3).id)
Message.create(body: "I'm back again", user_id: User.find(4).id)
Message.create(body: 'What do you want?', user_id: User.find(5).id)
Message.create(body: '', user_id: User.find(5).id)