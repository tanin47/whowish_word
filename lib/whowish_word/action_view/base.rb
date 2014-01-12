if defined?(ActionView) and defined?(ActionView::Base)
  class ActionView::Base
    include WhowishWord::Constant

    def whowish_word_active?
      @whowish_word_config.edit_mode == true
    end

    def whowish_word_javascript_and_css(force = false)
      return "" if !whowish_word_active? and force == false

      script_text = <<-HTML
        <script type="text/javascript">
          $w(function() {
            $w.whowishWord();
          });
        </script>
      HTML

      return javascript_include_tag("/whowish_word_js").sub('.js', '').html_safe + \
              stylesheet_link_tag("/whowish_word_css").sub('.css', '').html_safe + \
              script_text.html_safe
    end

    alias_method :previous_t, :t

    # Translations that are plain-text and outside HTML attributes
    def t(uid, *variables)
      return previous_t(uid, *variables) unless whowish_word_active?

      translation = previous_t uid

      if translation.is_a?(String)
        s = PREFIX + \
             SEPARATOR + \
             scope_key_by_partial(uid.to_s) + \
             SEPARATOR + \
             translation
        return "<dfn>#{s}</dfn>".html_safe
      else
        return previous_t(uid, *variables)
      end
    end

    # Translations that may contain HTML tags and are outside HTML attributes
    def th(uid, *variables)
      return t(uid, *variables).html_safe
    end

    # Translations that are inside HTML attributes (must be plain-text by their definitions)
    def ta(uid, *variables)
      return previous_t(uid, *variables) unless whowish_word_active?

      translation = previous_t uid

      if translation.is_a?(String)
        s = PREFIX + \
             SEPARATOR + \
             scope_key_by_partial(uid.to_s) + \
             SEPARATOR + \
             previous_t(uid)
        return s.html_safe
      else
        return previous_t(uid, *variables)
      end
    end
  end
end
