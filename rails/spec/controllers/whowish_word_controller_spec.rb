require 'spec_helper'

describe WhowishWordController do
  it "adds a word correctly" do
    
    word_id = "test"
    content = "Hello"
    
    post :change_word, {
                          :word_id => word_id,
                          :content => content
                        }
                        
    body = expect_json_response    
    body['ok'].should be_true
    
    I18n.t(word_id.to_sym).should == content
  end
end