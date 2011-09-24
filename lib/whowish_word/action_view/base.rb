
if defined?(ActionView) and defined?(ActionView::Base)

  class ActionView::Base

    def global_word_for(namespace, id, *variables)
      
      if @whowish_word_edit_mode == true
        return WhowishWord.word_for_in_edit_mode(namespace, id, *variables)
      else
        return WhowishWord.word_for(namespace, id, *variables)
      end
      
    end
    
    def global_word_for_attr(namespace, id, *variables)
      
      if @whowish_word_edit_mode == true
        return WhowishWord.word_for_attr_in_edit_mode(namespace, id, *variables)
      else
        return WhowishWord.word_for_attr(namespace, id, *variables)
      end
      
    end
  
    def word_for(id, *variables)
      
      namespace = get_relative_view_path(@whowish_word_page)
      global_word_for(namespace, id, *variables)
      
    end
    
    def word_for_attr(id, *variables)
      
      namespace = get_relative_view_path(@whowish_word_page)
      global_word_for_attr(namespace, id, *variables)
      
    end
    
    private
      def get_relative_view_path(full_path)
        result = @whowish_word_page.match(/[\/\\](([^\/\\]+)[\/\\]([^\/\\]+))\Z/)
        return result[1]
    end

  end

end