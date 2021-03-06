source 'https://rubygems.org'

gem 'bootstrap-generators'
#Gem for Font Awesome to be included in the project
gem 'font-awesome-sass', '~> 4.4.0'

gem 'redis'
gem 'sidekiq'
gem 'sinatra', :require => nil

ruby "2.2.3"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Omniauth Gem for Github
gem 'omniauth-github'

# Github Ruby API Wrapper
gem 'octokit'

# Pivotal Tracker API Ruby Wrapper
gem 'tracker_api'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'dotenv-rails'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'guard-bundler'
  gem 'bcrypt'
  gem 'faker'
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'launchy'
  gem 'looksee'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :test do
  gem 'webmock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'foreman'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # Use Puma as the app server
  gem 'puma'
  gem 'pg'
  gem 'rails_12factor'
end
