module WhowishWord
  module Initializer
    def install_route
      Rails.application.routes.prepend do
        match "whowish_word/change_word", :to => "whowish_word#change_word"
        match "whowish_word_css", :to => "whowish_word#css"
        match "whowish_word_js", :to => "whowish_word#js"
        match "whowish_word/download", :to => "whowish_word#download"
      end
    end
    
    def install_hook
      require_all("../action_controller/**/*.rb")
      require_all("../action_view/**/*.rb")
    end
    
    def load_rails
      paths = ["controllers"]
  
      paths.each do |dir|
        path = File.join(File.dirname(__FILE__), 'rails', 'app', dir)
        $LOAD_PATH.insert(0, path)
        ActiveSupport::Dependencies.autoload_paths.insert(0, path)
        ActiveSupport::Dependencies.autoload_once_paths.delete(path)
      end
      
      ActionController::Base.append_view_path(File.join(File.dirname(__FILE__), 'rails', 'app'))
    end

    private
    def require_all(path)
      Dir[File.expand_path(path, __FILE__)].each { |f| require f }
    end
  end
end