module WhowishWord
  
  class Config
    
    attr_accessor :locale, :edit_mode
    
    def initialize
      @locale = "en"
      @edit_mode = false
    end
    
    def activate_edit_mode
      @edit_mode = true
    end
    
    def set_locale(locale)
      @locale = locale
    end
    
  end
  
end