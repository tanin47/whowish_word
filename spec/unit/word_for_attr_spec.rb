require 'spec_helper'

describe 'word_for_attr' do
  
  before(:each) do
    WhowishWord.words = {}
  end
  
  
  it "no variables, no entry" do
    
    value = WhowishWord.word_for_attr("namespace", "id")
    value.should == "namespace:id(en)"
    
  end
  
  
  it "with variables, no entry" do
    
    value = WhowishWord.word_for_attr("namespace", "id", :number=>5, :name=>"tanin")
    value.should == "namespace:id(en){number,name}"
    
  end
  
  
  it "no variables, with entry" do
    
    WhowishWord.words = {"namespace:id(en)" => "hello"}
    value = WhowishWord.word_for_attr("namespace", "id")
    value.should == "hello"
    
  end
  
  
  it "with variables, with entry" do
    
    WhowishWord.words = {"namespace:id(en)" => "hello {name} for {number} times"}
    value = WhowishWord.word_for_attr("namespace", "id", :number=>5, :name=>"tanin")
    value.should == "hello tanin for 5 times"
    
  end
  
  
end