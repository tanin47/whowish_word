class WhowishWordEmail
  include Mongoid::Document
  
  field :word_id,:type=>String
  field :content, :type=>String
  
  key :word_id
  index :word_id, :unique=>true

end