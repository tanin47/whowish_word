class WhowishWordHtml
  include Mongoid::Document
  
  field :word_id,:type=>String
  field :content, :type=>String
  
  index [[ :word_id, Mongo::DESCENDING ]], :unique=>true
  
end