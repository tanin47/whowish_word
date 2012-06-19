class ApplicationController < ActionController::Base
  
  layout "main"
  
  before_filter :activate_whowish_word, :set_locale
  
  def activate_whowish_word
    if params[:edit_mode]
      session[:edit_mode] = params[:edit_mode]
    end

    if session[:edit_mode] == "yes"
      whowish_word.activate_edit_mode
    end
  end
  
  def set_locale
    if params[:locale]
      session[:locale] = params[:locale]
    end
    
    session[:locale] ||= "en"
    I18n.locale = session[:locale].to_sym
  end
  
  
end