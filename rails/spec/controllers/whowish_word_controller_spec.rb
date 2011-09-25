require 'spec_helper'

describe WhowishWordController do
  
  it "adds a word correctly" do
    
    word_id = "some_controller/some_view.html.erb:some_word(en)"
    content = "Hello"
    
    post :change_word, {
                          :word_id => word_id,
                          :content => content
                        }
                        
    body = expect_json_response    
    body['ok'].should be_true
    
    commit_database
    
    word = WhowishWordHtml.first(:conditions=>{:word_id=>word_id})
    word.content.should == content
    
    WhowishWord.words[word_id].should == content
    WhowishWord.words.length.should == 1
    
  end
  
  it "changes a word correctly" do
    
    word_id = "some_controller/some_view.html.erb:some_word(en)"
    content = "Hello"
    
    WhowishWord.add_or_set_word(word_id, content)
    WhowishWordHtml.create(:word_id=>word_id, :content=>content)
    
    new_content = "Yo!"
    
    post :change_word, {
                          :word_id => word_id,
                          :content => new_content
                        }
                        
    body = expect_json_response    
    body['ok'].should be_true
    
    commit_database
    
    word = WhowishWordHtml.first(:conditions=>{:word_id=>word_id})
    word.content.should == new_content
    
    WhowishWord.words[word_id].should == new_content
    WhowishWord.words.length.should == 1
    
  end
  
end