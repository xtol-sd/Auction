source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'
gem 'carrierwave'
gem 'carrierwave_direct'
gem 'sidekiq'
gem 'flatui-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'rolify'
gem 'simple_form'
gem "faker"
gem "bcrypt-ruby", '~> 3.0.0'
gem "rmagick"
gem "fog"


group :production do
  gem 'pg'
  gem 'rails_12factor', '0.0.2'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'meta_request'
end

group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'guard-spork'
  gem 'childprocess'
  gem 'spork'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
end
