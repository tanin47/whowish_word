class WhowishWordController < ActionController::Base

  def change_word

    entity = WhowishWordHtml.first(:conditions=>{:word_id => params[:word_id].strip})

    entity = WhowishWordHtml.new if !entity

    entity.word_id = params[:word_id].strip
    entity.content = params[:content].strip
    
    if !entity.save
      
      error_message = "WhowishWord fails to change the word you specified.<br/>" + \
                      "Possible causes:<br/>" + \
                      "- Someone else changed the word at the very same time<br/>" + \
                      "- Database connection failed<br/>" + \
                      "By all means, please try again.<br/>"
                      
      render :json=>{:ok=>false,:error_message=>error_message}
      
    end
    
    WhowishWord.add_or_set_word(entity.word_id, entity.content)
    
    render :json=>{:ok=>true}
  end
  
  def add
    
    entity = WhowishWordHtml.new
    entity.word_id = params[:word_id].strip
    entity.content = params[:content].strip
    
    if !entity.save
      render :json => {:ok=>false, :error_message=>format_error(entity.errors)}
      return
    end
    
    render :json=>{:ok=>true ,:new_row=>render_to_string(:partial=>"row.html",:locals=>{:entity=>entity,:field_set=>SHOW_FIELDS,:is_new=>false}), :entity=> entity}
    
  end
  
  def delete

    if !WhowishWord.delete(params[:id])
      render :json=>{:ok=>false,:error_message=>"error while delete location"}
      return
    end
 
    render :json=>{:ok=>true}
  end
  
end