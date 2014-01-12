require File.expand_path("../config", __FILE__)
require File.expand_path("../constant", __FILE__)
require File.expand_path("../initializer", __FILE__)
require File.expand_path("../word_for", __FILE__)
require File.expand_path("../authentication", __FILE__)
Dir[File.expand_path("../backends/**/*.rb", __FILE__)].each {|f| require f}

module WhowishWord
  include WhowishWord::Constant
  include WhowishWord::Initializer
  include WhowishWord::WordFor
  # include WhowishWord::Authentication

  attr_accessor :config_file_dir, :backend

  def init(config_file_dir = File.join(Rails.root, 'config', 'locales', 'whowish_word'))
    install_route
    install_hook
    load_rails

    @config_file_dir = config_file_dir
    @backend = WhowishWord::Backends::FlatFileStore

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
        if @locale == :en
          key = keys.last.to_s.gsub('_', ' ').gsub(/\b('?[a-z])/) { $1 }
          I18n.interpolate_hash(key, options)
        else
          @options[:locale] = :en
          I18n.translate(@key, @options)
        end
      end
    end

    I18n.class_eval do
      class << self
        def interpolate_hash(string, values)
          string.gsub(I18n::INTERPOLATION_PATTERN) do |match|
            if match == '%%'
              '%'
            else
              key = ($1 || $2).to_sym
              value = values.key?(key) ? values[key] : "%{#{key}}" #raise(MissingInterpolationArgument.new(values, string))
              value = value.call(values) if value.respond_to?(:call)
              $3 ? sprintf("%#{$3}", value) : value
            end
          end
        end
      end
    end

  end

  extend self
end

