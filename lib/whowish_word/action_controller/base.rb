if defined?(ActionController) and defined?(ActionController::Base)
  class ActionController::Base
    include WhowishWord::Constant
    
    prepend_before_filter :initialize_whowish_word
    helper_method :whowish_word
    attr_accessor :whowish_word_config

    def initialize_whowish_word
      @whowish_word_config = WhowishWord::Config.new
    end

    def whowish_word
      return @whowish_word_config
    end

    # alias_method :previous_t, :t
    # def t(uid, *variables)
    #   if @whowish_word_config.edit_mode == true
    #     s = PREFIX + \
    #          SEPARATOR + \
    #          scope_key_by_partial(uid.to_s) + \
    #          SEPARATOR + \
    #          previous_t(uid)
    #     return "<dfn>#{s}</dfn>".html_safe
    #   else
    #     return previous_t(uid, *variables)
    #   end
    # end

    # def ta(uid, *variables)
    #   if @whowish_word_config.edit_mode == true
    #     s = PREFIX + \
    #          SEPARATOR + \
    #          scope_key_by_partial(uid.to_s) + \
    #          SEPARATOR + \
    #          previous_t(uid)
    #     return s.html_safe
    #   else
    #     return previous_t(uid, *variables)
    #   end
    # end

    # def word_for(namespace, id, *variables)
    #   if @whowish_word_config.edit_mode == true
    #     return WhowishWord.word_for_in_edit_mode(namespace, id, @whowish_word_config.locale, *variables)
    #   else
    #     return WhowishWord.word_for(namespace, id, @whowish_word_config.locale, *variables)
    #   end
    # end
    
    
    # def word_for_attr(namespace, id, *variables)
    #   if @whowish_word_config.edit_mode == true
    #     return WhowishWord.word_for_attr_in_edit_mode(namespace, id, @whowish_word_config.locale, *variables)
    #   else
    #     return WhowishWord.word_for_attr(namespace, id, @whowish_word_config.locale, *variables)
    #   end
    # end
  end
end