module ActionView::Partials
  
  alias_method :_render_partial_original, :_render_partial

  def _render_partial(options, &block) #:nodoc:
    
    @last_template ||= nil
    
    previous_template = @last_template
    prefix = self.controller_path unless options[:partial].include?(?/)
    @last_template = self.find_template(options[:partial], prefix, true)
    
    html = _render_partial_original(options, &block)
    
    @last_template = previous_template
    
    return html
    
  end
  
end