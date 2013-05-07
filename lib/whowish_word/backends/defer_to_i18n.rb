module WhowishWord
  module Backends
    class DeferToI18n
      def initialize
      end

      def set(key, value)
        I18n.backend.store_translations(I18n.locale,
                                        { key => value },
                                        :escape => false)
      end

      def get(*args)
        I18n.t *args
      end
    end
  end
end
