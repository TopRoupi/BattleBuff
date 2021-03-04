# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby ">= 2.6.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.1.1"
# Use Postgres as the database for Active Record
gem "pg"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "jbuilder", "~> 2.7"
gem "sassc", "~> 2.1.0"

gem "redis", "~> 4.0", require: ["redis", "redis/connection/hiredis"]
gem "hiredis"

gem "omniauth", "~> 1.9.1"
gem "figaro"
gem "view_component"
gem "slim-rails"
gem "devise"
gem "omniauth-steam"
# gem "hotwire-rails"
gem "stimulus_reflex", "~> 3.4"
gem "simple_form"

# gem 'image_processing', '~> 1.2'

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "standard"
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
