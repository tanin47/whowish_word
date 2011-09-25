# encoding: utf-8
require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'

require 'watir-webdriver-rails'

WatirWebdriverRails.host = "localhost"
WatirWebdriverRails.port = 57124

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}


RSpec.configure do |config|
  
  config.include Browser
  config.include MongoidHelper
  config.include JsonRspecHelper
  
  config.before(:each) do
    
    WhowishWordHtml.delete_all
    WhowishWord.words = {}
    
  end
  
  config.mock_with :rspec
  
end



