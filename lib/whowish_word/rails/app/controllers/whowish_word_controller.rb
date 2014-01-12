class WhowishWordController < ApplicationController
  before_filter do
    if !whowish_word_active?
      render :text => 'Not found', :status => 404
    end
  end

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
    store = WhowishWord.backend.new

    if store.set params[:word_id], params[:content]
      render :json => { :ok => true }
    else
      render :json => { :ok => false }, :status => :unprocessable_entity
    end
  end

  def download
    raise 'Not supported'

    begin
      require 'zip'
    rescue Exception => e
      raise 'Please install the rubyzip gem (version 1.1.0) in order to download whowish_word.zip through the web interface #{e}'
    end

    zipfile = Tempfile.new("whowish_word.zip")
    Zip::File.open(zipfile.path, Zip::File::CREATE) do |zipfile|
      Dir["#{WhowishWord.config_file_dir}/**/*"].each do |file|
        zipfile.add(file.sub(directory, ''), file)
      end
    end

    send_file zipfile.path, :filename => "whowish_word.zip", :content_type => "application/zip"
    zipfile.close
  end
end
