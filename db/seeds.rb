# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all

order1 = Order.create!(v_id: 1, customer_name: "Barry Smith", order_ref: "#P-1325000", source: 'amz')
order2 = Order.create!(v_id: 12, customer_name: "John Smith", order_ref: "#P-1325001", source: 'ebay')
order3 = Order.create!(v_id: 13, customer_name: "Alex Smith", order_ref: "#P-1325002", source: 'phone')
order4 = Order.create!(v_id: 14, customer_name: "Phil Smith", order_ref: "#P-1325003", source: 'amz')


OrderItem.create!(price: 8.99, sku: "SUP-008", image_url: "http://cdn.shopify.com/s/files/1/1186/0576/products/Nom-Living-Stoneware-Stackable-Coffee-Mug-04-WEB_grande.jpg?v=1581527272", title: "Coffee Mug", order: order1, height: 5, width: 3, depth: 3, weight: 1)
OrderItem.create!(price: 22.00, sku: "SUP-008",image_url: "https://www.lovefrankie.com/wp-content/uploads/2019/02/floralduckegg6-400x400.jpg", title: "Lampshade", order: order1, height: 20, width: 10, depth: 10, weight: 3)
OrderItem.create!(price: 11.25, sku: "SUP-008",image_url: "https://sc04.alicdn.com/kf/HTB1cG6zmbZnBKNjSZFrq6yRLFXaV.jpg", title: "Inflatable Sofa", order: order1, height: 40, width: 20, depth: 10, weight: 2)
OrderItem.create!(price: 2.50, sku: "SUP-008",image_url: "https://ih1.redbubble.net/image.906893060.1802/st,small,507x507-pad,600x600,f8f8f8.jpg", title: "Stickers", order: order1, height: 2, width: 1, depth: 1, weight: 1)
OrderItem.create!(price: 43.00, sku: "SUP-008",image_url: "https://d7hftxdivxxvm.cloudfront.net/?resize_to=fit&width=600&height=1020&quality=80&src=https%3A%2F%2Fd32dm0rphc51dk.cloudfront.net%2FyXTQoNa-RcB0wmR7vghz6A%2Flarge.jpg", title: "Glass Hammer", order: order2, height: 2, width: 7, depth: 4, weight: 1)
OrderItem.create!(price: 20.00, sku: "SUP-008",image_url: "https://www.scotclans.com/wp-content/uploads/2011/04/scotclans-tartan-paint1.jpg", title: "Tin of Tartan Paint", order: order2, height: 5, width: 4, depth: 4, weight: 2)
OrderItem.create!(price: 10.00, sku: "SUP-008",image_url: "https://cdn.shopify.com/s/files/1/0166/6656/products/Skinnydip_London_Pastel_Pink_Chilly_s_Bottle_-_EDIT_600x.jpg?v=1566481669", title: "Water Bottle", order: order3, height: 6, width: 3, depth: 3, weight: 1)
OrderItem.create!(price: 8.99, sku: "SUP-008",image_url: "https://res.cloudinary.com/teepublic/image/private/s--96CF_t33--/t_Resized%20Artwork/c_crop,x_10,y_10/c_fit,w_470/c_crop,g_north_west,h_626,w_470,x_0,y_-47/g_north_west,u_upload:v1462829024:production:blanks:a59x1cgomgu5lprfjlmi,x_-395,y_-372/b_rgb:eeeeee/c_limit,f_auto,h_630,q_90,w_630/v1516826478/production/designs/2305884_0.jpg", title: "T-Shirt", order: order3, height: 3, width: 4, depth: 2, weight: 1)
OrderItem.create!(price: 12.00, sku: "SUP-008",image_url: "https://resource.logitechg.com/w_695,c_limit,q_auto:best,f_auto,b_rgb:f4f4f4,dpr_2.0/content/dam/gaming/en/products/pro-keyboard/pro-clicky-hero.png?v=1", title: "Keyboard", order: order3, height: 10, width: 4, depth: 2, weight: 2)
OrderItem.create!(price: 9.99, sku: "SUP-008",image_url: "https://zazahomes.co.uk/wp-content/uploads/2017/04/P4012391-800x800.jpg", title: "Candle Sticks", order: order4, height: 10, width: 1, depth: 1, weight: 3)
OrderItem.create!(price: 2.00, sku: "SUP-008",image_url: "http://i.imgur.com/bLeDN2r.jpg", title: "Oregano (1oz)", order: order4, height: 5, width: 5, depth: 5, weight: 2)
OrderItem.create!(price: 4.50, sku: "SUP-008",image_url: "https://res-4.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco/v1397752462/79ac8afaa8b10a6a3f3566078001ec47.png", title: "Veeqo Socks", order: order4, height: 4, width: 2, depth:1, weight: 1)

puts "orders created"
