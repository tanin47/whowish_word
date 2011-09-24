
if defined?(ActionController) and defined?(ActionController::Base)

  class ActionController::Base

    helper_method :activate_whowish_word_edit_mode
    attr_accessor :whowish_word_edit_mode
    
    def activate_whowish_word_edit_mode
      @whowish_word_edit_mode = true
    end

    def word_for(namespace, id, *variables)
      
      if @whowish_word_edit_mode == true
        return WhowishWord.word_for_in_edit_mode(namespace, id, *variables)
      else
        return WhowishWord.word_for(namespace, id, *variables)
      end
      
    end
    
    def word_for_attr(namespace, id, *variables)
      
      if @whowish_word_edit_mode == true
        return WhowishWord.word_for_attr_in_edit_mode(namespace, id, *variables)
      else
        return WhowishWord.word_for_attr(namespace, id, *variables)
      end
      
    end

  end

end