# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'cheeselife_user', email: 'cheeselife_user@gmail.com', password: '12345678', role: 'user', lat: '12.972248', long: '77.635033')
@rest1 = User.create!(username: 'cheeselife_rest1', email: 'cheeselife_rest1@gmail.com', password: '12345678', role: 'restaurant', lat: '12.975855', long: '77.135033')
User.create!(username: 'cheeselife_rest2', email: 'cheeselife_rest2@gmail.com', password: '12345678', role: 'restaurant', lat: '12.372248', long: '77.135033')
User.create!(username: 'cheeselife_driver1', email: 'cheeselife_driver1@gmail.com', password: '12345678', role: 'driver', lat: '12.372248', long: '77.135033')

@menu1 = Menu.create!(name: 'Menu1', summary: 'Summary', user_id: @rest1.id)
@menu2 = Menu.create!(name: 'Menu2', summary: 'Summary', user_id: @rest1.id)

Item.create!(name: 'Item1', desc: 'desc', price: 120, aval_quantity: 100, food_type: 'North Indian', cuisine: 'Indian', menu_id: @menu1.id)
Item.create!(name: 'Item2', desc: 'desc', price: 120, aval_quantity: 100, food_type: 'Mexican', cuisine: 'Mexican', menu_id: @menu1.id)
Item.create!(name: 'Item3', desc: 'desc', price: 120, aval_quantity: 100, food_type: 'North Indian', cuisine: 'Indian', menu_id: @menu1.id)
Item.create!(name: 'Item4', desc: 'desc', price: 120, aval_quantity: 100, food_type: 'Italian', cuisine: 'Italian', menu_id: @menu1.id)
Item.create!(name: 'Item5', desc: 'desc', price: 120, aval_quantity: 100, food_type: 'North Indian', cuisine: 'Indian', menu_id: @menu1.id)
Item.create!(name: 'Item6', desc: 'desc', price: 120, aval_quantity: 100, food_type: 'South Indian', cuisine: 'Indian', menu_id: @menu1.id)


Item.create!(name: 'Item1', desc: 'desc', price: 120, aval_quantity: 100, food_type: 'North Indian', cuisine: 'Indian', menu_id: @menu2.id)
Item.create!(name: 'Item2', desc: 'desc', price: 120, aval_quantity: 100, food_type: 'Mexican', cuisine: 'Mexican', menu_id: @menu2.id)