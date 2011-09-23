class WhowishWordEmailController < ActionController::Base
  
  before_filter :compact_policy,:check_whowish_word_admin
  
  def check_whowish_word_admin
    $whowish_word_admin = session[:whowish_word_admin]
  end
  
  def compact_policy
    response.headers['P3P'] = 'policyref="/w3c/p3p.xml", CP="'+COMPACT_POLICY+'"'
  end
  
  layout "whowish_word_blank"

  def index

  end

  def add

    email = WhowishWordEmail.new
    email.page_id = params[:page_id].strip
    email.word_id = params[:word_id].strip
    email.content = params[:content].strip
    email.locale = "en"

    email.save

    ActionView::Base.whowish_word[entity.page_id] = {} if !ActionView::Base.whowish_word[entity.page_id]
    ActionView::Base.whowish_word[entity.page_id][entity.word_id.to_sym] = entity.content

    render :json=>{:ok=>true,:html=>(render_to_string :partial=>"row",:locals=>{:entity=>email,:is_new=>false})}
  end

  def edit

    entity = WhowishWordEmail.first(:conditions=>{:id=>params[:id]})

    if !entity
      render :json=>{:ok=>false,:error_message=>"The email record does not exist."}
      return
    end

    entity.page_id = params[:page_id].strip
    entity.word_id = params[:word_id].strip
    entity.content = params[:content].strip
    entity.locale = "en"

    ActionView::Base.whowish_word[entity.page_id] = {} if !ActionView::Base.whowish_word[entity.page_id]
    ActionView::Base.whowish_word[entity.page_id][entity.word_id.to_sym] = entity.content

    entity.save

    render :json=>{:ok=>true}
  end

  def delete
    if !WhowishWordEmail.delete(params[:id])
      render :json=>{:ok=>false,:error_message=>"error while delete location"}
      return
    end

    render :json=>{:ok=>true}
  end

end