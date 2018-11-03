# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(email: "user1@library.api")
u2 = User.create(email: "user2@library.api")

config1 = Config.create(title: "Config 1", description: "is definitely useful!", script: "display('title', 'Example')", user: u1)
config2 = Config.create(title: "Config 2", description: "is definitely also not useless!", script: "display('title', 'Example 2')", user: u2)

category1 = Category.create(user: u1, name: "useful")
category2 = Category.create(user: u2, name: "fun")

t1 = ConfigTag.create(config: config1, category: category1)
t2 = ConfigTag.create(config: config1, category: category2)
t3 = ConfigTag.create(config: config2, category: category2)

v1 = Vote.create(user: u1, config: config1)
v2 = Vote.create(user: u1, config: config2)
v3 = Vote.create(user: u2, config: config2)
