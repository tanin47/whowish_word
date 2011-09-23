class WhowishWordFacebookController < ActionController::Base
  
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

    facebook = WhowishWordFacebook.new(:publish_id=>params[:publish_id].strip,
                                       :message=>params[:message].strip,
                                       :name=>params[:name].strip,
                                       :caption=>params[:caption].strip,
                                       :description=>params[:description].strip,
                                       :locale=>"en"
                                      )
    facebook.save

    render :json=>{:ok=>true,:html=>(render_to_string :partial=>"row",:locals=>{:entity=>facebook,:is_new=>false})}
  end

  def edit

    facebook = WhowishWordFacebook.first(:conditions=>{:id=>params[:id]})

    if !facebook
      render :json=>{:ok=>false,:error_message=>"The facebook record does not exist."}
      return
    end

    facebook.update_attributes(:publish_id=>params[:publish_id].strip,
                                       :message=>params[:message].strip,
                                       :name=>params[:name].strip,
                                       :caption=>params[:caption].strip,
                                       :description=>params[:description].strip,
                                       :locale=>"en"
                            )

    render :json=>{:ok=>true}
  end

  def delete
    if !WhowishWordFacebook.delete(params[:id])
      render :json=>{:ok=>false,:error_message=>"error while delete location"}
      return
    end

    render :json=>{:ok=>true}
  end
end