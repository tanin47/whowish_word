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
  
  def change_word
    File.open(File.join(Rails.root, "config", "locales", "whowish_word", "en.yml") , 'r+', 0777) {|f|
      f.flock(File::LOCK_EX)

      data = YAML.parse(f.read).to_ruby
      
      data["en"] = {} if !data.has_key?("en")
      data["en"][params[:word_id]] = params[:content]

      f.rewind
      f.write(YAML.dump(data))
    }


    I18n.translations[:en][params[:word_id].to_sym] = params[:content]
    
    render :json=>{:ok=>true}
  end
end