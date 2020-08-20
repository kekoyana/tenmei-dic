# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

gem 'pg', '>= 0.18', '< 2.0'

gem 'bootsnap'
gem 'bootstrap', '~> 5.0.0.alpha1'
gem 'haml-rails'
gem 'httpclient'
gem 'oj'
gem 'puma'

group :development, :test do
  gem 'brakeman', require: false
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'rspec-rails'
end

group :development do
  gem 'haml-lint', require: false
  gem 'listen'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
  gem 'yaml-lint', require: false
end

group :test do
  gem 'capybara', require: false
  gem 'rspec-json_matchers'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver', require: false
  gem 'webmock'
end
