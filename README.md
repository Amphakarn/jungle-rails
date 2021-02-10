# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Screenshots

##### Main Page

!["Main page"](https://github.com/Amphakarn/jungle-rails/blob/master/doc/main_page.png?raw=true)

##### My Cart

!["My cart"](https://github.com/Amphakarn/jungle-rails/blob/master/doc/my_cart.png?raw=true)

##### Admin Page (All Products and All Categories)

!["Admin All Categories"](https://github.com/Amphakarn/jungle-rails/blob/master/doc/admin_new_category.png?raw=true)
!["Admin All Products"](https://github.com/Amphakarn/jungle-rails/blob/master/doc/admin_all_products.png?raw=true)

##### Sign Up

!["Sign up"](https://github.com/Amphakarn/jungle-rails/blob/master/doc/sign_up.png?raw=true)

##### Log In

!["Log in"](https://github.com/Amphakarn/jungle-rails/blob/master/doc/login.png?raw=true)
