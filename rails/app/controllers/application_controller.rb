class ApplicationController < ActionController::Base
  
  layout "main"
  
  before_filter :activate_whowish_word
  
  def activate_whowish_word
    if params[:edit_mode] == "yes"
      activate_whowish_word_edit_mode
    end
    
    
  end
  
  
end