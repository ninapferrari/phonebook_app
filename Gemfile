source "https://rubygems.org"

ruby "3.0.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
gem "bootsnap", require: false
gem "webpacker", '~> 5.4.4'
gem 'devise', '~> 4.9', '>= 4.9.4'



group :development, :test do
  gem "rspec-rails", "~> 6.1"
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "simplecov", "~> 0.22.0", :require => false
  gem "simplecov_json_formatter", "~> 0.1.4", :require => false
end
