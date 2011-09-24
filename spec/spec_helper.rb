# encoding: utf-8
require File.expand_path("../../lib/whowish_word", __FILE__)

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  
  config.before(:suite) do
    
    String.class_eval do
      
      def html_safe
        return self
      end
      
    end
    
  end
end



