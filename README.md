# Jungle

A mini e-commerce application built with Rails 4.2. 

## Project goals
- Become familiar with Ruby and the Rails framework
- Learn how to navigate an existing code-base
- Use existing code style and approach to implement new features in unfamiliar territory
- Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
- A simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution

## Feature/Bug-fix Requests
### Major Features
1. User Authentication: Allow visitors to register and log in to the site using bcrypt.

2. Product Ratings and Reviews: Allow visitors to view list of ratings and reviews on the product page and logged in users to rate and review a product.

### Minor Features
1. Sold out badge: When a product has 0 quantity, it should display on the product list page as "sold out"

2. Admin -> Categories:  Allow administrators to create and view categories.

3. Email confirmation - Sends the order receipt via email once an order ha been placed


### Feature Enchancements
1. Order details: Enhances the details the user sees once their order is placed successfully

### Bug fixes
1. Use HTTP basic authentication to secure all admin pages
2. Display a message when a user tries to check out an empty cart



## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe(test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
