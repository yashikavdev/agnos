# Pre-requisite

1. Install Ruby 3.1.2
2. Install Rails 7.0.5
3. Install postgres and setup local environment

# Setup

1. `bundle install`
2. Setup `database.yml`
3. `bundle exec rake db:create`
4. `bundle exec rake db:migrate`
5. `bundle exec rake db:seed`
6. Start Server - `bundle exec rails s`
7. Run Sidekiq - `bundle exec sidekiq`

# rspec

1. `bundle exec rspec`

# Postman

1. `You need to pass base_url value on which your server is running`
2. `You need to pass token inside header with Authorization key for every request except user create and user login after login you will receive a token`

# How discount works

1. `When quantity is greater then 2 it will apply buy 1 get 1 free discount rule`
2. `when quantity is greater then 1 it will apply 30% discount`

# Login

1.  email - `user-1@example.com`
2.  password - `pass123`
