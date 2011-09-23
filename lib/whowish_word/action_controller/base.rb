class ActionController::Base
  
  
  def choose_locale
    
    $locale = "en"
    $locale = session[:whowish_locale].downcase.strip if session[:whowish_locale]
    $locale = params[:whowish_locale].downcase.strip if params[:whowish_locale]
    
    session[:whowish_locale] = $locale
    
    logger.debug { "locale=#{$locale}"}
    
  end
  
  
  def word_for(namespace,id,*p)
     ActionView::Base.whowish_word_for(namespace,id,*p)
  end
  
  
  def self.word_for(namespace,id,*p)
     ActionView::Base.whowish_word_for(namespace,id,*p)
  end
  
  
end