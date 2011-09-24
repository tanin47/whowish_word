class WhowishWordHtml
  include Mongoid::Document
  
  field :word_id,:type=>String
  field :content, :type=>String
  
  key :word_id
  index :word_id, :unique=>true
  
  def self.generate_word_id(page_id,id,locale)
    "#{page_id}:#{id}(#{locale})".downcase
  end
end