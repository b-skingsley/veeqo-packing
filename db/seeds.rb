# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

order1 = Order.create!(v_id: 1, customer_name: "Barry Smith")
order2 = Order.create!(v_id: 12, customer_name: "John Smith")
order3 = Order.create!(v_id: 13, customer_name: "Alex Smith")
order4 = Order.create!(v_id: 14, customer_name: "Phil Smith")

OrderItem.create!(order: order1, height: 1, width: 2, depth: 1, weight: 1)
OrderItem.create!(order: order1, height: 3, width: 5, depth: 1, weight: 1)
OrderItem.create!(order: order1, height: 4, width: 3, depth: 5, weight: 1)
OrderItem.create!(order: order1, height: 2, width: 1, depth: 4, weight: 1)
OrderItem.create!(order: order2, height: 1, width: 1, depth: 3, weight: 1)
OrderItem.create!(order: order2, height: 5, width: 1, depth: 2, weight: 1)
OrderItem.create!(order: order3, height: 1, width: 3, depth: 1, weight: 1)
OrderItem.create!(order: order3, height: 3, width: 4, depth: 2, weight: 1)
OrderItem.create!(order: order3, height: 1, width: 2, depth: 1, weight: 1)
OrderItem.create!(order: order4, height: 4, width: 1, depth: 3, weight: 1)
OrderItem.create!(order: order4, height: 3, width: 5, depth: 2, weight: 1)
OrderItem.create!(order: order4, height: 2, width: 1, depth: 1, weight: 1)

puts "orders created"
