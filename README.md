# README.md

## Application Overview

This README provides an overview of the routes and features in the Ruby on Rails application. It covers the configuration of routes in the `routes.rb` file and the database schema in the `schema.rb` file.

### Routes Configuration (`routes.rb`)

The `routes.rb` file defines the routing structure of the application. Here's a breakdown of the configured routes:

1. **GET '/current_user'**
   - Route: `/current_user`
   - Controller: `current_user#index`
   - Description: Handles a GET request to retrieve information about the current user.

2. **Devise Authentication Routes**
   - Customizes routes for user authentication using the Devise gem.
   - Paths:
      - Sign-in: '/login' (customized from 'sign_in')
      - Sign-out: '/logout' (customized from 'sign_out')
      - Registration: '/signup' (customized from 'registration')
   - Controllers:
      - Sessions: 'users/sessions'
      - Registrations: 'users/registrations'

3. **Books Resource**
   - RESTful routes for managing books.
   - Allowed Actions: Index, Create, Destroy
   - Example Routes:
      - Index: GET '/books'
      - Create: POST '/books'
      - Destroy: DELETE '/books/:id'

### Database Schema (`schema.rb`)

The `schema.rb` file represents the current state of the database schema. It includes the following tables:

1. **Authors**
   - Columns:
      - `first_name` (String)
      - `last_name` (String)
      - `age` (Integer)
      - Timestamps: `created_at`, `updated_at`

2. **Books**
   - Columns:
      - `title` (String)
      - `author_id` (Bigint)
      - Timestamps: `created_at`, `updated_at`
   - Index: `index_books_on_author_id`

3. **Users**
   - Columns:
      - `email` (String)
      - `encrypted_password` (String)
      - `reset_password_token` (String)
      - `reset_password_sent_at` (Datetime)
      - `remember_created_at` (Datetime)
      - `jti` (String)
      - Timestamps: `created_at`, `updated_at`
   - Indexes: `index_users_on_email` (unique), `index_users_on_jti`, `index_users_on_reset_password_token` (unique)

## Getting Started

To set up and run the application, follow these steps:

1. Clone the repository.
2. Run `bundle install` to install dependencies.
3. Set up the database using `bin/rails db:create` and `bin/rails db:migrate`.
4. Start the server with `bin/rails server`.
5. Visit the application in your web browser.

Feel free to explore the routes and features based on the provided information. For more detailed information on each route and model, refer to the corresponding controller and model files in the application.

Happy coding!
