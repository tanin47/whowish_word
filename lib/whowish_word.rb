module WhowishWord

  def database_engine=(engine)
    
  end
  
  extend self
end

paths = ["controllers","views","models/#{WHOWISH_WORD_DATABASE_ENGINE}"]

# load all controllers, helpers, and models
paths.each do |dir|
  
  path = File.join(File.dirname(__FILE__), 'rails', 'app', dir)
  
  $LOAD_PATH.insert(0, path)
  ActiveSupport::Dependencies.autoload_paths.insert(0, path)
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
  
end

ActionController::Base.append_view_path(File.join(File.dirname(__FILE__), 'rails', 'app', 'views'))

ActionView::Base.init_whowish_word