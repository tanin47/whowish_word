class WhowishWord < ActiveRecord::Base
  def self.generate_word_id(page_id,id,locale)
    "#{page_id}:#{id}(#{locale})".downcase
  end
end