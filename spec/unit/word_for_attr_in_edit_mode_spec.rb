require 'spec_helper'

describe 'word_for' do
  
  before(:each) do
    WhowishWord.words = {}
  end
  
  
  it "no variables, no entry" do
    
    value = WhowishWord.word_for_attr_in_edit_mode("namespace", "id")
    value.should == "#{WhowishWord::PREFIX}#{WhowishWord::SEPARATOR}namespace:id(en)#{WhowishWord::SEPARATOR}namespace:id(en)"
    
  end
  
  
  it "with variables, no entry" do
    
    value = WhowishWord.word_for_attr_in_edit_mode("namespace", "id", :number=>5, :name=>"tanin")
    value.should == "#{WhowishWord::PREFIX}#{WhowishWord::SEPARATOR}namespace:id(en)|number,name#{WhowishWord::SEPARATOR}namespace:id(en){number,name}"
    
  end
  
  
  it "no variables, with entry" do
    
    WhowishWord.words = {"namespace:id(en)" => "hello"}
    value = WhowishWord.word_for_attr_in_edit_mode("namespace", "id")
    value.should == "#{WhowishWord::PREFIX}#{WhowishWord::SEPARATOR}namespace:id(en)#{WhowishWord::SEPARATOR}hello"
    
  end
  
  
  it "with variables, with entry" do
    
    WhowishWord.words = {"namespace:id(en)" => "hello {name} for {number} times"}
    value = WhowishWord.word_for_attr_in_edit_mode("namespace", "id", :number=>5, :name=>"tanin")
    value.should == "#{WhowishWord::PREFIX}#{WhowishWord::SEPARATOR}namespace:id(en)|number,name#{WhowishWord::SEPARATOR}hello tanin for 5 times"
    
  end
  
  
end