require 'spec_helper'

describe 'WhowishWord workflow spec' do
  
  it "edits a normal text" do
    
    goto '/integration?edit_mode=yes'
    
    click 'whowishWordId0_____html'
    
    fill "whowishWordDialogContent", "Some new word"
    click "whowishWordDialogSaveButton"
    
    html('whowishWordId0').should == "Some new word"
    
    
    
    goto '/integration?edit_mode=yes'
    
    html('whowishWordId0').should == "Some new word"
    
    click 'whowishWordId0_____html'
    value("whowishWordDialogContent").should == "Some new word"
    
  end
  
  it "edits a value" do
    
    goto '/integration/value?edit_mode=yes'
    
    click 'whowishWordId0_____value'
    
    fill "whowishWordDialogContent", "Some new word"
    click "whowishWordDialogSaveButton"
    
    value('whowishWordId0').should == "Some new word"
    
    
    
    goto '/integration/value?edit_mode=yes'
    
    value('whowishWordId0').should == "Some new word"
    
    click 'whowishWordId0_____value'
    value("whowishWordDialogContent").should == "Some new word"
    
  end
  
  it "edits an attribute" do
    
    goto '/integration/attr?edit_mode=yes'
    
    click 'whowishWordId0_____title'
    
    fill "whowishWordDialogContent", "Some new word"
    click "whowishWordDialogSaveButton"
    
    element(:id=>'whowishWordId0').attribute_value("title").should == "Some new word"
    
    
    
    goto '/integration/attr?edit_mode=yes'
    
    element(:id=>'whowishWordId0').attribute_value("title").should == "Some new word"
    
    click 'whowishWordId0_____title'
    element(:id=>'whowishWordId0').attribute_value("title").should == "Some new word"
    
  end
  
  it "edits an option" do
    
    goto '/integration/select?edit_mode=yes'
    
    
    click 'whowishWordId0_____value'
    
    fill "whowishWordDialogContent", "Some new value"
    click "whowishWordDialogSaveButton"
    
    value('whowishWordId0').should == "Some new value"
    
    
    click 'whowishWordId0_____text'
    
    fill "whowishWordDialogContent", "Some new text"
    click "whowishWordDialogSaveButton"
    
    execute_script('return $("#whowishWordId0").text();').should == "Some new text"
    
    
    
    
    goto '/integration/select?edit_mode=yes'
    
    value('whowishWordId0').should == "Some new value"
    
    click 'whowishWordId0_____value'
    value("whowishWordDialogContent").should == "Some new value"
    click 'whowishWordDialogCloseButton'

    execute_script('return $("#whowishWordId0").text();').should == "Some new text"
    
    click 'whowishWordId0_____text'
    value("whowishWordDialogContent").should == "Some new text"
    click 'whowishWordDialogCloseButton'
    
  end
  
end