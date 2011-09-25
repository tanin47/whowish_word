# encoding: utf-8

require 'rspec'
require File.expand_path("../../lib/whowish_word",__FILE__)

RSpec.configure do |config|
  
  config.mock_with :rspec
  
  String.class_eval do
    def html_safe
      return self
    end
  end
  
end



