# encoding: utf-8

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

    keys = params[:word_id].split(".")
    uid = keys.pop
    filename = "#{I18n.locale}.yml"

    if keys.length > 1
      filename = "#{keys[1..-1].join("_")}_#{filename}"
    end

    paths = [ WhowishWord.config_file_dir ]
    paths.push(keys[0]) if keys.length > 0
    paths.push(filename)

    locale_file = File.join(*paths)
    FileUtils.mkdir_p(File.join(*paths[0..-2]))

    translation_keys = I18n.normalize_keys(I18n.locale, params[:word_id], nil, ".")
    
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

      direct = data
      translation_keys[0..-2].each { |k|
        k = k.to_s
        direct[k] ||= {}
        direct = direct[k]
      }

      direct[translation_keys.last.to_s] = params[:content]

      file.rewind
      file.write(YAML.dump(data))
      file.flush
      file.truncate(file.pos)
    ensure
      file.flock(File::LOCK_UN)
      file.close
    end

    direct = I18n.translations
    translation_keys[0..-2].each { |k|
      direct[k] ||= {}
      direct = direct[k]
    }
    direct[translation_keys.last] = params[:content]

    render :json=>{
      :ok => true
    }
  end

  def download
    t = Tempfile.new("whowish_word.zip")
    
    Zip::ZipOutputStream.open(t.path) do |zos|
      Dir["#{WhowishWord.config_file_dir}/**/*"].each do |file|
        next if File.directory?(file)

        zos.put_next_entry("#{file.sub(WhowishWord.config_file_dir + "/", "")}")
        zos.print IO.read(file)
      end
    end

    send_file t.path, :filename => "whowish_word.zip", :content_type => "application/zip"

    t.close
  end
end