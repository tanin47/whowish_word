if defined?(ActionView) and defined?(ActionView::Base)
  class ActionView::Base
    include WhowishWord::Constant

    def whowish_word_javascript_and_css(force = false)
      return "" if @whowish_word_config.edit_mode != true and force == false
      
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

    # def global_word_for(namespace, id, *variables)
    #   if @whowish_word_config.edit_mode == true
    #     return WhowishWord.word_for_in_edit_mode(namespace, id, @whowish_word_config.locale, *variables)
    #   else
    #     return WhowishWord.word_for(namespace, id, @whowish_word_config.locale, *variables)
    #   end
    # end


    # def global_word_for_attr(namespace, id, *variables)
    #   if @whowish_word_config.edit_mode == true
    #     return WhowishWord.word_for_attr_in_edit_mode(namespace, id, @whowish_word_config.locale, *variables)
    #   else
    #     return WhowishWord.word_for_attr(namespace, id, @whowish_word_config.locale, *variables)
    #   end
    # end

    # def word_for(id, *variables)
    #   namespace = get_relative_view_path(@whowish_word_page)
    #   global_word_for(namespace, id, *variables)
    # end

    # def word_for_attr(id, *variables)
    #   namespace = get_relative_view_path(@whowish_word_page)
    #   global_word_for_attr(namespace, id, *variables)
    # end

    alias_method :previous_t, :t
    def t(uid, *variables)
      if @whowish_word_config.edit_mode == true
        s = PREFIX + \
             SEPARATOR + \
             scope_key_by_partial(uid.to_s) + \
             SEPARATOR + \
             previous_t(uid, *variables)
        return "<dfn>#{s}</dfn>".html_safe
      else
        return previous_t(uid, *variables)
      end
    end

    def ta(uid, *variables)
      if @whowish_word_config.edit_mode == true
        s = PREFIX + \
             SEPARATOR + \
             scope_key_by_partial(uid.to_s) + \
             SEPARATOR + \
             previous_t(uid, *variables)
        return s.html_safe
      else
        return previous_t(uid, *variables)
      end
    end


    # private
    #   def get_relative_view_path(full_path)
    #     result = @whowish_word_page.match(/[\/\\](([^\/\\]+)[\/\\]([^\/\\]+))\Z/)
    #     return result[1]
    #   end
  end
end