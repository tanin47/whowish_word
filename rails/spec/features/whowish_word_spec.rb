require 'spec_helper'

describe 'WhowishWord workflow spec' do
  it "edits a normal text" do
    new_text = "NormalText #{Time.now.to_i}"

    visit '/integration?edit_mode=yes'
    click 'whowishWordId0_____html'
    fill_in "whowishWordDialogContent", :with => new_text
    click "whowishWordDialogSaveButton"
    wait_until { find('#whowishWordId0').should have_content(new_text) }
    
    visit '/integration?edit_mode=yes'
    wait_until { find('#whowishWordId0').should have_content(new_text) }
    click 'whowishWordId0_____html'
    wait_until { find('#whowishWordDialogContent').value.should == new_text }
  end
  
  it "edits a value" do
    new_text = "Value #{Time.now.to_i}"

    visit '/integration/value?edit_mode=yes'
    click 'whowishWordId0_____value'
    fill_in "whowishWordDialogContent", :with => new_text
    click "whowishWordDialogSaveButton"
    wait_until { find('#whowishWordId0').value.should == new_text }
    
    visit '/integration/value?edit_mode=yes'
    wait_until { find('#whowishWordId0').value.should == new_text }
    click 'whowishWordId0_____value'
    wait_until { find('#whowishWordDialogContent').value.should == new_text }
  end
  
  it "edits an attribute" do
    new_text = "Attribute #{Time.now.to_i}"

    visit '/integration/attr?edit_mode=yes'
    click 'whowishWordId0_____title'
    fill_in "whowishWordDialogContent", :with => new_text
    click "whowishWordDialogSaveButton"
    wait_until { find('#whowishWordId0')[:title].should == new_text }
    
    visit '/integration/attr?edit_mode=yes'
    wait_until { find('#whowishWordId0')[:title].should == new_text }
    click 'whowishWordId0_____title'
    wait_until { find("#whowishWordDialogContent").value.should == new_text }
  end
  
  it "edits an option" do
    new_text = "OptionText#{Time.now.to_i}"
    new_value = "OptionValue#{Time.now.to_i}"

    visit '/integration/select?edit_mode=yes'
    click 'whowishWordId0_____value'
    fill_in "whowishWordDialogContent", :with => new_value
    click "whowishWordDialogSaveButton"
    wait_until { find('#whowishWordId0').value.should == new_value }
    
    click 'whowishWordId0_____text'
    fill_in "whowishWordDialogContent", :with => new_text
    click "whowishWordDialogSaveButton"
    wait_until { find('#whowishWordId0').text.should == new_text }
    
    visit '/integration/select?edit_mode=yes'
    wait_until { find('#whowishWordId0').value.should == new_value }
    click 'whowishWordId0_____value'
    wait_until { find("#whowishWordDialogContent").value.should == new_value }
    click 'whowishWordDialogCloseButton'

    wait_until { find('#whowishWordId0').text.should == new_text }
    click 'whowishWordId0_____text'
    wait_until { find("#whowishWordDialogContent").value.should == new_text }
    click 'whowishWordDialogCloseButton'
  end
end