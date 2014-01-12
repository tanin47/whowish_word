if defined?(ActionController) and defined?(ActionController::Base)
  class ActionController::Base
    include WhowishWord::Constant

    prepend_before_filter :initialize_whowish_word
    helper_method :whowish_word, :whowish_word_active?
    attr_accessor :whowish_word_config

    def initialize_whowish_word
      @whowish_word_config = WhowishWord::Config.new
    end

    def whowish_word
      return @whowish_word_config
    end

    def whowish_word_active?
      @whowish_word_config.edit_mode == true
    end
  end
end
