class WhowishWordFacebook

  include Mongoid::Document
  
  field :publish_id,:type=>String
  field :message, :type=>String
  field :name, :type=>String
  field :caption, :type=>String
  field :description, :type=>String
  
  key :publish_id

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