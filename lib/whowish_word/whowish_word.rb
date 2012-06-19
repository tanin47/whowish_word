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

  attr_accessor :config_file_dir
  
  def init(config_file_dir = File.join(Rails.root, 'config', 'locales', 'whowish_word'))
    install_route
    install_hook
    load_rails

    @config_file_dir = config_file_dir
    
    Rails.configuration.i18n.load_path = Dir[File.join(@config_file_dir, '**', '*.{rb,yml}')]
  
    I18n.class_eval do
      class << self
        def translations
          backend.send(:translations)
        end
      end
    end

    I18n::MissingTranslation::Base.class_eval do
      def html_message
        key = keys.last.to_s.gsub('_', ' ').gsub(/\b('?[a-z])/) { $1.capitalize }
        key
      end
    end
  end

  extend self
end

