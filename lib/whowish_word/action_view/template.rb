
# if defined?(ActionView) and defined?(ActionView::Base)
  
#   class ActionView::Template
    
#     alias_method :render_original, :render
    
#     def render(view, locals, buffer=nil, &block)

#       previous_whowish_word_page = nil
      
#       if view.instance_variable_defined?(:@whowish_word_page)
#         previous_whowish_word_page = view.instance_variable_get(:@whowish_word_page)
#       end
    
#       view.instance_variable_set(:@whowish_word_page, @identifier)
      
#       if view.controller.respond_to?(:whowish_word_edit_mode)
#         view.instance_variable_set(:@whowish_word_edit_mode, view.controller.whowish_word_edit_mode)
#       end
      
#       html = render_original(view, locals, buffer, &block)
      
#       view.instance_variable_set(:@whowish_word_page, previous_whowish_word_page)

#       return html
#     end
  
#   end
  
# end