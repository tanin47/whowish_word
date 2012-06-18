module WhowishWord
  class Config
    attr_accessor :edit_mode
    
    def initialize
      @edit_mode = false
    end
    
    def activate_edit_mode
      @edit_mode = true
    end
  end
end