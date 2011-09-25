
if defined?(ActionView) and defined?(ActionView::Base)
  
  class ActionView::Template
    
    alias_method :render_original, :render
    
    def render(view, locals, buffer=nil, &block)

      view.instance_variable_set(:@whowish_word_page, @identifier)
      
      if view.controller.respond_to?(:whowish_word_edit_mode)
        view.instance_variable_set(:@whowish_word_edit_mode, view.controller.whowish_word_edit_mode)
      end
      
      return render_original(view, locals, buffer, &block)

    end
  
  end
  
end