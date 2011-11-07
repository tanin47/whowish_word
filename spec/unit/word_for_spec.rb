require 'spec_helper'

describe 'word_for' do
  
  before(:each) do
    WhowishWord.words = {}
  end
  
  
  it "no variables, no entry" do
    
    value = WhowishWord.word_for("namespace", "id", "en")
    value.should == "id(en)"
    
  end
  
  
  it "with variables, no entry" do
    
    value = WhowishWord.word_for("namespace", "id", "en", :number=>5, :name=>"tanin")
    value.should == "id(en){number,name}"
    
  end
  
  
  it "no variables, with entry" do
    
    WhowishWord.words = {"namespace:id(en)" => "hello"}
    value = WhowishWord.word_for("namespace", "id", "en")
    value.should == "hello"
    
  end
  
  
  it "with variables, with entry" do
    
    WhowishWord.words = {"namespace:id(en)" => "hello {name} for {number} times"}
    value = WhowishWord.word_for("namespace", "id", "en", :number=>5, :name=>"tanin")
    value.should == "hello tanin for 5 times"
    
  end
  
  
end