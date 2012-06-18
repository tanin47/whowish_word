class WhowishWordController < ApplicationController
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
    locale_file = File.join(Rails.root, "config", "locales", "whowish_word", "#{I18n.locale}.yml")
    
    file = nil
    data = {}
    
    begin
      if !File.exists?(locale_file)
        file = File.open(locale_file, 'w', 0777)
        file.flock(File::LOCK_EX)
      else
        file = File.open(locale_file, 'r+', 0777)
        file.flock(File::LOCK_EX)
      end

      begin
        file.rewind
        data = YAML.parse(file.read).to_ruby
      rescue
        data = {}
      end

      data[I18n.locale.to_s] ||= {}
      data[I18n.locale.to_s][params[:word_id]] = params[:content]

      file.rewind
      file.write(YAML.dump(data))
      file.flush
      file.truncate(file.pos)
    ensure
      file.flock(File::LOCK_UN)
      file.close
    end

    I18n.translations[I18n.locale.to_sym] ||= {}
    I18n.translations[I18n.locale.to_sym][params[:word_id].to_sym] = params[:content]
    
    render :json=>{
      :ok => true
    }
  end
end