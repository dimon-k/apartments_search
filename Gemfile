source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2'
# Use postgres as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Use React with Rails
gem 'react-rails', '~> 2.6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Geocoding solution for Ruby.
gem 'geocoder', '~> 1.5', '>= 1.5.2'
# MetaSearch gem
gem 'ransack', '~> 2.3'
# Allows to generate JSON in an object-oriented manner
gem 'active_model_serializers', '~> 0.10.10', require: true
# Amazon Simple Storage Service (Amazon S3)
gem 'aws-sdk-s3', '~> 1.60', '>= 1.60.1'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Good tool for generating fake data
gem 'ffaker', '~> 2.13'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Library that pretty prints Ruby objects
  gem 'awesome_print', '~> 1.8'
  gem 'rspec', '~> 3.9'
  gem 'rspec-rails', '~> 3.9'
  gem 'factory_bot', '~> 5.1', '>= 5.1.1'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
