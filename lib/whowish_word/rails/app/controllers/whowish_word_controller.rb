class WhowishWordController < ActionController::Base
  
  def css
    
    text = ""
    
    Dir[File.expand_path("../../../public/stylesheets/*.css", __FILE__)].each { |f| 
      text += IO.read(f)
      text += "\n\n"
    }
    
    response.headers["Content-Type"] = "text/css; charset=utf-8"
    render :text=>text
    
  end
  
  def js
 
    text = ""
    
    all_files = Dir[File.expand_path("../../../public/javascripts/*.js", __FILE__)]
    all_files.sort! { |a, b| a <=> b}
    
    all_files.each { |file|
      text += IO.read(file)
      text += "\n\n"
    }
    
    response.headers["Content-Type"] = "text/javascript; charset=utf-8"
    render :text=>text
    
  end
  
  before_filter :authenticate, :only => [ :change_word ]
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
  
  private
   def authenticate
      authenticate_or_request_with_http_basic do |id, password| 
          id == WhowishWord.username && password == WhowishWord.password
      end
   end
  
end