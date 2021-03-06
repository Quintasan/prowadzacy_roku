# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.2"

gem "aasm"
gem "bootsnap", ">= 1.1.0", require: false
gem "carrierwave"
gem "daemons"
gem "decent_exposure"
gem "delayed_job_active_record"
gem "devise"
gem "dotenv-rails"
gem "hamlit"
gem "hamlit-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mini_racer", platforms: :ruby
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "pundit"
gem "rails", "~> 5.2.0"
gem "rails-i18n", "~> 5.1"
gem "roo", "~> 2.7.0"
gem "roo-xls"
gem "shrine", "~> 2.0"
gem "simple_form"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"
gem "rails-i18n", "~> 5.1"
gem "devise-i18n"

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "byebug"
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.7"
end

group :test do
  gem "shoulda-matchers"
end

group :development do
  gem "bcrypt_pbkdf", ">= 1.0", "< 2.0"
  gem "brakeman", require: false
  gem "bullet"
  gem "bundler-audit"
  gem "capistrano", "~> 3.7", ">= 3.7.1"
  gem "capistrano-passenger", "~> 0.2.0"
  gem "capistrano-rails", "~> 1.2"
  gem "capistrano-rbenv", "~> 2.1"
  gem "ed25519", ">= 1.2", "< 2.0"
  gem "i18n-tasks", "~> 0.9.29"
  gem "fasterer"
  gem "letter_opener"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "overcommit"
  gem "rails_best_practices"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
