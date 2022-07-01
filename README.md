# The Cheese Life

Welcome to The Cheese Life. This is a food ordering app where you can place the order and check all the orders and track your order realtime. This is api only application.

## Getting Started

Dependencies:

- Ruby 2.7.3
- Rails 5.2.8 (Framework)
- MySql (Database)

Setup:
- `gem jwt` (for setup token based authentication)
- `bundle install`
- `bin/rails db:create` (to create database)
- `bin/rails db:migrate` (to create all the migrations)

Now you are ready to run the application :

1.  `rails s` - to start the rails server
2.  `rails c` - to open to rails console

## Details

Mainly there are 3 types of users (user, restaurant, driver) which are defined by `role` in users table. Each user has different capability and he can make changes in data accordingly.

User can:
- see all the menu items.
- place the order and make the payment.
- track the order.
- check his booking details.

Restaurant can:
- create/edit the menus.
- create/edit the items.
- check the placed order.
- check booking details.

## Authentication

You need to be authenticate to access any API. Each role has different capabilities and they can make changes accordingly. This is simple token base authentication which made with payload and secret key. Currently payload has 2 keys :

`{user_id: 1, exp: 12344555}`

We do have encode and decode methods to use token.

## Example Data

To support the evaluation process, please make the following available via the `bin/rails db:seed` task in your application:

* Users:
  * have 4 different users (1 user, 2 restaurants, 1 driver)
  * each user defined with the role.
  * normal user with "cheeselife_user" username and "12345678" password.
  * restaurant1 with "cheeselife_rest1@gmail.com" email and "12345678" password.
  * restaurant2 with "cheeselife_rest2@gmail.com" email and "12345678" password.
  * driver with "cheeselife_driver1@gmail.com" email and "12345678" password.

* Menus:
  * have 2 menus from same restaurant.

* Items:
  * have 8 items from both the menues.

