
if defined?(ActionController) and defined?(ActionController::Base)

  class ActionController::Base
    
    prepend_before_filter :initialize_whowish_word
    attr_accessor :whowish_word_config


    def initialize_whowish_word
      @whowish_word_config = WhowishWord::Config.new
    end


    helper_method :whowish_word
    
    def whowish_word
      return @whowish_word_config
    end


    def word_for(namespace, id, *variables)
      
      if @whowish_word_config.edit_mode == true
        return WhowishWord.word_for_in_edit_mode(namespace, id, @whowish_word_config.locale, *variables)
      else
        return WhowishWord.word_for(namespace, id, @whowish_word_config.locale, *variables)
      end
      
    end
    
    
    def word_for_attr(namespace, id, *variables)
      
      if @whowish_word_config.edit_mode == true
        return WhowishWord.word_for_attr_in_edit_mode(namespace, id, @whowish_word_config.locale, *variables)
      else
        return WhowishWord.word_for_attr(namespace, id, @whowish_word_config.locale, *variables)
      end
      
    end

  end

end