# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

gem 'encrypted_cookie', '0.1.0'
gem 'httparty', '~> 0.13.7'
gem 'puma', '~> 5.6'
gem 'rack_csrf', '~> 2.6', require: 'rack/csrf'
gem 'sass', '~> 3.7', require: false
gem 'sassc', '~> 2.4', require: false
gem 'sinatra', '~> 2.2'
gem 'sinatra-contrib', '~> 2.2', require: false
gem 'sprockets', '~> 4.0'
gem 'tux', '~> 0.3', require: false
gem 'uglifier', '~> 4.2', require: false

group :development, :test do
  gem 'dotenv', '~> 3.1', '>= 3.1.7'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.21'
  gem 'pry', '~> 0.14'
  gem 'pry-byebug', '~> 3.8', require: false
  gem 'rubocop', '~> 1.30'
  gem 'rubocop-performance', '~> 1.14'
  gem 'rubocop-rspec', '~> 2.11', require: false
end

group :test do
  gem 'rspec', '~> 3.13'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.21', require: false
end
