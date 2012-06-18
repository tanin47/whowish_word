require File.expand_path("../config", __FILE__)
require File.expand_path("../constant", __FILE__)
require File.expand_path("../initializer", __FILE__)
require File.expand_path("../word_for", __FILE__)
require File.expand_path("../authentication", __FILE__)

module WhowishWord
  include WhowishWord::Constant
  include WhowishWord::Initializer
  include WhowishWord::WordFor
  # include WhowishWord::Authentication
  
  attr_accessor :words
  
  def init()
    
    # @orm_engine = orm_engine
    
    # init_username_and_password
    install_route
    install_hook
    load_rails
    
    # run_database_migration
    
    # words = WhowishWordHtml.all()
      
    # @words = {}
    # words.each { |word|
    #   @words[word.word_id] = word.content
    # }
    
    Rails.configuration.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'whowish_word', '**', '*.{rb,yml}')]
  
    I18n.class_eval do
      class << self
        def translations
          I18n.translate(:some_shit)
          backend.send(:translations)
        end
      end
    end
  end
  
  def add_or_set_word(word_id, content)
    @words[word_id] = content
  end

  extend self
end

