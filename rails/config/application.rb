require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "active_resource/railtie"

module WhowishWordRails
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.active_support.deprecation = :stderr
  end
end
