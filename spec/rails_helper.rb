require 'spec_helper'
require 'simplecov'
require 'simplecov_json_formatter'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::JSONFormatter,
  SimpleCov::Formatter::HTMLFormatter,
])

SimpleCov.start do
  add_group 'Config', 'config'
  add_group 'Controllers', 'app/controllers' # Corrigi para 'controllers'
  add_group 'Libs', 'lib'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Spec', 'spec'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'
require_relative 'support/controller_macros'
require 'capybara/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_paths = ["#{::Rails.root}/spec/fixtures"]

  config.use_transactional_fixtures = true

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include FactoryBot::Syntax::Methods
  config.extend ControllerMacros, type: :controller

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
