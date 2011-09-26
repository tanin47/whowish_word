require 'spec_helper'
require File.expand_path("../../../../lib/whowish_word",__FILE__)

module WhowishWordRspecHelper
  
  include WhowishWord::Constant
  
  def get_whowish_word(namespace, id, variables={})
    
    var_keys= []
    variables.each_pair { |key,value|
      var_keys.push(key)
    }
    
    variables_clause = ""
    variables_clause = "{#{var_keys.join(',')}}" if var_keys.length > 0
    
    return "#{namespace}:#{id}(en)#{variables_clause}"
    
  end
  
  def get_whowish_word_in_edit_mode(namespace, id, variables={}) 
    
    return "<dfn>#{get_whowish_word_attr_in_edit_mode(namespace, id, variables)}</dfn>"
           
  end
  
  def get_whowish_word_attr_in_edit_mode(namespace, id, variables={}) 
    
    var_keys = []
    variables.each_pair { |key,value|
      var_keys.push(key)
    }
    
    variables_params = ""
    variables_clause = ""
    
    variables_params = "|#{var_keys.join(',')}" if var_keys.length > 0
    variables_clause = "{#{var_keys.join(',')}}" if var_keys.length > 0
    
    return PREFIX + \
           SEPARATOR + \
           "#{namespace}:#{id}(en)#{variables_params}" + \
           SEPARATOR + \
           "#{namespace}:#{id}(en)#{variables_clause}"
           
  end
  
end

describe 'Generator spec' do
  
  include WhowishWordRspecHelper
  
  it "generates word_for correctly for all types of view (in edit mode)" do
    
    goto '/test_word_for?edit_mode=yes'
    
    html("view_before_partial").should == get_whowish_word_in_edit_mode("test_word_for/index.html.erb", "text")
    
    html("view").should == get_whowish_word_in_edit_mode("test_word_for/index.html.erb", "text")
    html("view_attr").should == get_whowish_word_attr_in_edit_mode("test_word_for/index.html.erb", "text")
    
    html("view_with_variables").should == get_whowish_word_in_edit_mode("test_word_for/index.html.erb", "text", {:number=>5,:name=>"tanin"})
    html("view_attr_with_variables").should == get_whowish_word_attr_in_edit_mode("test_word_for/index.html.erb", "text", {:number=>5,:name=>"tanin"})
    
    
    
    html("partial").should == get_whowish_word_in_edit_mode("test_word_for/_partial.html.erb", "text")
    html("partial_attr").should == get_whowish_word_attr_in_edit_mode("test_word_for/_partial.html.erb", "text")
    
    html("partial_with_variables").should == get_whowish_word_in_edit_mode("test_word_for/_partial.html.erb", "text", {:number=>5,:name=>"tanin"})
    html("partial_attr_with_variables").should == get_whowish_word_attr_in_edit_mode("test_word_for/_partial.html.erb", "text", {:number=>5,:name=>"tanin"})
    
    
    
    html("nested_layout_before_yield").should == get_whowish_word_in_edit_mode("layouts/nested_test_word_for.html.erb", "text")
    
    html("nested_layout").should == get_whowish_word_in_edit_mode("layouts/nested_test_word_for.html.erb", "text")
    html("nested_layout_attr").should == get_whowish_word_attr_in_edit_mode("layouts/nested_test_word_for.html.erb", "text")
    
    html("nested_layout_with_variables").should == get_whowish_word_in_edit_mode("layouts/nested_test_word_for.html.erb", "text", {:number=>5,:name=>"tanin"})
    html("nested_layout_attr_with_variables").should == get_whowish_word_attr_in_edit_mode("layouts/nested_test_word_for.html.erb", "text", {:number=>5,:name=>"tanin"})
    
    
    
    html("layout_before_nested_layout").should == get_whowish_word_in_edit_mode("layouts/test_word_for.html.erb", "text")
    
    html("layout").should == get_whowish_word_in_edit_mode("layouts/test_word_for.html.erb", "text")
    html("layout_attr").should == get_whowish_word_attr_in_edit_mode("layouts/test_word_for.html.erb", "text")
    
    html("layout_with_variables").should == get_whowish_word_in_edit_mode("layouts/test_word_for.html.erb", "text", {:number=>5,:name=>"tanin"})
    html("layout_attr_with_variables").should == get_whowish_word_attr_in_edit_mode("layouts/test_word_for.html.erb", "text", {:number=>5,:name=>"tanin"})
    
  end
  
  it "generates word_for correctly for all types of view" do
    
    goto '/test_word_for'
    
    html("view_before_partial").should == get_whowish_word("test_word_for/index.html.erb", "text")
    
    html("view").should == get_whowish_word("test_word_for/index.html.erb", "text")
    html("view_attr").should == get_whowish_word("test_word_for/index.html.erb", "text")
    
    html("view_with_variables").should == get_whowish_word("test_word_for/index.html.erb", "text", {:number=>5,:name=>"tanin"})
    html("view_attr_with_variables").should == get_whowish_word("test_word_for/index.html.erb", "text", {:number=>5,:name=>"tanin"})
    
    
    
    html("partial").should == get_whowish_word("test_word_for/_partial.html.erb", "text")
    html("partial_attr").should == get_whowish_word("test_word_for/_partial.html.erb", "text")
    
    html("partial_with_variables").should == get_whowish_word("test_word_for/_partial.html.erb", "text", {:number=>5,:name=>"tanin"})
    html("partial_attr_with_variables").should == get_whowish_word("test_word_for/_partial.html.erb", "text", {:number=>5,:name=>"tanin"})
    
    
    
    html("nested_layout_before_yield").should == get_whowish_word("layouts/nested_test_word_for.html.erb", "text")
    
    html("nested_layout").should == get_whowish_word("layouts/nested_test_word_for.html.erb", "text")
    html("nested_layout_attr").should == get_whowish_word("layouts/nested_test_word_for.html.erb", "text")
    
    html("nested_layout_with_variables").should == get_whowish_word("layouts/nested_test_word_for.html.erb", "text", {:number=>5,:name=>"tanin"})
    html("nested_layout_attr_with_variables").should == get_whowish_word("layouts/nested_test_word_for.html.erb", "text", {:number=>5,:name=>"tanin"})
    
    
    
    html("layout_before_nested_layout").should == get_whowish_word("layouts/test_word_for.html.erb", "text")
    
    html("layout").should == get_whowish_word("layouts/test_word_for.html.erb", "text")
    html("layout_attr").should == get_whowish_word("layouts/test_word_for.html.erb", "text")
    
    html("layout_with_variables").should == get_whowish_word("layouts/test_word_for.html.erb", "text", {:number=>5,:name=>"tanin"})
    html("layout_attr_with_variables").should == get_whowish_word("layouts/test_word_for.html.erb", "text", {:number=>5,:name=>"tanin"})
    
  end
  
end
  