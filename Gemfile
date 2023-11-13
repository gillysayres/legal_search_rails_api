source "https://rubygems.org"

ruby "3.1.2"

gem "rails", "~> 7.1.2"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem 'graphql'
gem 'search_object_graphql'
gem 'search_object'
gem 'rack-cors', require: 'rack/cors'
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'faker'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner-active_record'
  gem 'shoulda-matchers'
end

group :development do
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end