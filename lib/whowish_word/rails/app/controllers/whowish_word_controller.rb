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
    store = WhowishWord.backend.new

    if store.set params[:word_id], params[:content]
      render :json => { :ok => true }
    else
      render :json => { :ok => false }, :status => :unprocessable_entity
    end
  end

  def download
    require 'zip/zip'
    require 'zip/zipfilesystem'

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
