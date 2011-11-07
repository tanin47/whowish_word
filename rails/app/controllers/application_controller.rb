class ApplicationController < ActionController::Base
  
  layout "main"
  
  before_filter :activate_whowish_word, :set_locale
  
  def activate_whowish_word
    if params[:edit_mode] == "yes"
      whowish_word.activate_edit_mode
    end
  end
  
  def set_locale
    if params[:locale]
      session[:locale] = params[:locale]
    end
    
    session[:locale] ||= "en"
    whowish_word.set_locale(session[:locale])
  end
  
  
end