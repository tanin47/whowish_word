
if defined?(ActionView) and defined?(ActionView::Base)
  
  class ActionView::Template
    
    alias_method :render_original, :render
    
    def render(view, locals, buffer=nil, &block)

      view.instance_variable_set(:@whowish_word_page, @identifier)
      view.instance_variable_set(:@whowish_word_edit_mode, view.controller.whowish_word_edit_mode)
      
      return render_original(view, locals, buffer, &block)

    end
  
  end
  
end