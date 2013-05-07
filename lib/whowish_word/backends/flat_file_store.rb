module WhowishWord
  module Backends
    class FlatFileStore
      def set(key, value)
        keys = key.split(".")
        uid = keys.pop
        filename = "#{I18n.locale}.yml"

        if keys.length > 1
          filename = "#{keys[1..-1].join("_")}_#{filename}"
        end

        paths = [ WhowishWord.config_file_dir ]
        Rails.logger.debug WhowishWord.config_file_dir
        paths.push(keys[0]) if keys.length > 0
        paths.push(filename)

        locale_file = File.join(*paths)
        FileUtils.mkdir_p(File.join(*paths[0..-2]))

        translation_keys = I18n.normalize_keys(I18n.locale, key, nil, ".")

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

          direct[translation_keys.last.to_s] = value

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
        direct[translation_keys.last] = value

        true
      end

      def get(*args)
        I18n.t *args
      end
    end
  end
end
