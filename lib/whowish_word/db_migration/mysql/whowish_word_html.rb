begin 
  ActiveRecord::Schema.define do
  
    create_table "whowish_word_htmls", :force => false do |t|
      t.string "word_id", :null => false
      t.text  "content", :null => false
    end
    
    add_index :whowish_word_htmls, :word_id, :unique => true
    
  end

rescue Exception=>e
  puts "Create whowish_word_htmls failed: #{e}"
end