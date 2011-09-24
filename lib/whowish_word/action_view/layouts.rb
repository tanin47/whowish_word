
if defined?(ActionView) and defined?(ActionView::Layouts)

  module ActionView::Layouts
    
    alias_method :_render_layout_original, :_render_layout
    
    def _render_layout(layout, locals, &block)
      
      @last_template = layout
      _render_layout_original(layout, locals, &block)
      
    end
    
  end

end