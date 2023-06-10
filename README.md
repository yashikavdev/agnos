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

# Updated Postman Collection

1. `https://drive.google.com/file/d/1zcb-VJ4QMEmDAb2IWM1XzLYlYw1juv96/view`

# How discount works

1. `When item id is 1 it apply 20% or id is 2 it apply 100% discount`
2. `in case user purchase combination of item including these it will apply discount accordingly`

# Login

1.  email - `user-1@example.com`
2.  password - `pass123`
