class HomeController < ActionController::Base
  
  layout "main"
  
  before_filter :activate_whowish_word
  
  def activate_whowish_word
    activate_whowish_word_edit_mode
  end
  
  def edit_nested
    render :edit, :layout=>"nested"
  end
  
end