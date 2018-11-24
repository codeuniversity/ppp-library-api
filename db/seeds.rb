# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(email: "user1@library.api")
u2 = User.create(email: "user2@library.api")

script1 = <<~SCRIPT
var average = get("average", 0)
var count = get("count", 0)
average = ((average * count) + message.value) / (count+1)
count++
set("average", average)
set("current", message.value)
set("count", count)

var t = "The lifetime average of the CPU temperature is "+ average.toFixed(2) +"C"
title(t)
description("Its current temperature is "+message.value.toFixed(2) + "C")

if (message.value > 60) {
  action("You should cool it down")
}
SCRIPT
script2 = <<~SCRIPT
var sum = get("sum", 0)
sum += message.value
set("sum", sum)

title("Sum")
description("The sum is " + sum.toFixed(2))

if (sum > 9000) {
  action("It's over 9000!")
}
SCRIPT

script3 = <<~SCRIPT
const bla = 10
title(bla)
SCRIPT
temp_filter = "temp"

config1 = Config.create(title: "Config 1", description: "is definitely useful!", script:script1, user: u1, names_filter: temp_filter)
config2 = Config.create(title: "Config 2", description: "is definitely also not useless!", script: script2, user: u2, names_filter: temp_filter)
config3 = Config.create(title: "Config 3", description: "is definitely also working! Really!", script: script3, user: u2)

category1 = Category.create(user: u1, name: "useful")
category2 = Category.create(user: u2, name: "fun")

t1 = ConfigTag.create(config: config1, category: category1)
t2 = ConfigTag.create(config: config1, category: category2)
t3 = ConfigTag.create(config: config2, category: category2)
t4 = ConfigTag.create(config: config3, category: category1)
t5 = ConfigTag.create(config: config3, category: category2)

v1 = Vote.create(user: u1, config: config1)
v2 = Vote.create(user: u1, config: config2)
v3 = Vote.create(user: u2, config: config2)
