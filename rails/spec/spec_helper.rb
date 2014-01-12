ENV["RAILS_ENV"] ||= 'test'

require 'rubygems'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.run_server = true
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    :debug => false,
    :js_errors => true,
  })
end
Capybara.current_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.default_wait_time = 5

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.include JsonRspecHelper
  config.include BrowserHelper
  config.mock_with :rspec
end



