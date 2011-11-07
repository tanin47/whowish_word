require File.expand_path("../config", __FILE__)
require File.expand_path("../constant", __FILE__)
require File.expand_path("../initializer", __FILE__)
require File.expand_path("../word_for", __FILE__)
require File.expand_path("../authentication", __FILE__)

module WhowishWord
  include WhowishWord::Constant
  include WhowishWord::Initializer
  include WhowishWord::WordFor
  include WhowishWord::Authentication
  
  attr_accessor :words
  
  def init(orm_engine = :active_record)
    
    @orm_engine = orm_engine
    
    init_username_and_password
    run_database_migration
    install_route
    install_hook
    load_rails
    
    words = WhowishWordHtml.all()
      
    @words = {}
    words.each { |word|
      @words[word.word_id] = word.content
    }
    
  end
  
  def add_or_set_word(word_id, content)
    @words[word_id] = content
  end

  extend self
end

