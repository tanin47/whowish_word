module WhowishWord
  
  def database_engine=(engine)
    @database_engine = engine
  end
  
  def database_engine
    @database_engine
  end
  
  def init(database_engine = :mysql)
    
    @database_engine = database_engine
    
    run_database_migration
    install_hook
    load_rails
    
    words = WhowishWordHtml.all() + WhowishWordEmail.all()
      
    @whowish_word = {}
    words.each { |word|
      @whowish_word[word.word_id] = word.content
    }
    
  end
  
  
  def run_database_migration
    
    Dir[File.expand_path("../db_migration/#{@database_engine}/**/*.rb", __FILE__)].each {|f| require f}
    
  end
  
    
  
  def install_hook
    
    Dir[File.expand_path("../action_controller/**/*.rb", __FILE__)].each {|f| require f}
    Dir[File.expand_path("../action_mailer/**/*.rb", __FILE__)].each {|f| require f}
    Dir[File.expand_path("../action_view/**/*.rb", __FILE__)].each {|f| require f}
    
  end
  
  
  
  def load_rails
    
    paths = ["controllers","views","models/#{@database_engine}"]

    # load all controllers, helpers, and models
    paths.each do |dir|
      
      path = File.join(File.dirname(__FILE__), 'rails', 'app', dir)
      
      $LOAD_PATH.insert(0, path)
      ActiveSupport::Dependencies.autoload_paths.insert(0, path)
      ActiveSupport::Dependencies.autoload_once_paths.delete(path)
      
    end
    
    ActionController::Base.append_view_path(File.join(File.dirname(__FILE__), 'rails', 'app', 'views'))
    
  end

  extend self
end

