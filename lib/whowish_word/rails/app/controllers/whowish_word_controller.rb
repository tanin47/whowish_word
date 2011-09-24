class WhowishWordController < ActionController::Base
  before_filter :compact_policy,:check_whowish_word_admin, :choose_locale
  before_filter :check_whowish_word_login, :except=>[:login,:do_login]
  
  def check_whowish_word_login
    
    render :login, :layout=>nil if session[:whowish_word_login] != "true"
  end
  
  def check_whowish_word_admin
    $whowish_word_admin = session[:whowish_word_admin]
  end
  
  def compact_policy
    response.headers['P3P'] = 'policyref="/w3c/p3p.xml", CP="NOI COR PSA OUR IND OTC"'
  end
  
  layout "whowish_word_blank"

  def do_login
    if params[:password] == "whowish#456"
      session[:whowish_word_login] = "true"
      index
      render :index
    else
      @error = "The password is invalid."
      render :login, :layout=>"blank"
    end
  end
  
  def logout
    session[:whowish_word_login] = nil
    render :login, :layout=>"blank"
  end

  def activate
    if params[:enabled]=="yes"
      session[:whowish_word_admin] = true
    else
      session[:whowish_word_admin] = false
    end
    
    render :json=>{:ok=>true}
  end


  SHOW_FIELDS = [
          {:id=>"word_id",:width=>300},
          {:id=>"content",:type=>"textarea",:width=>350}]

  def index
    @fs = SHOW_FIELDS
  end
  
  def get_word
    logger.debug { "locale=#{$locale}"}
    entity = WhowishWordHtml.first(:conditions=>{:word_id => params[:word_id].strip})
    
    render :json=>{:content=>""} and return if !entity
    render :json=>{:content=>entity.content}
  end

  def change_word

    entity = nil

    if params[:id]
      entity = WhowishWordHtml.first(:conditions=>{:id => params[:id]})
    else
      entity = WhowishWordHtml.first(:conditions=>{:word_id => params[:word_id].strip})
    end
    
    if !entity
      #render :json=>{:ok=>false,:error_message=>"Cannot find "+params[:page_id]+":"+params[:word_id]} and return 
      
      entity = WhowishWordHtml.new
      entity.word_id = params[:word_id].strip
      entity.content = params[:content].strip

    end

    entity.word_id = params[:word_id].strip
    entity.content = params[:content].strip
    entity.save

    ActionView::Base.whowish_word[entity.word_id] = entity.content
    
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