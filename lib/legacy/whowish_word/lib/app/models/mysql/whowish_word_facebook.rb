class WhowishWordFacebook < ActiveRecord::Base

  def word_for(field,*p)

     content = self[field].to_s

     if p.length > 0
        p = p[0]

        p.each_pair { |key,val|
          content.gsub!("{"+key.to_s+"}",val.to_s)
        }
      end

    content
  end

end