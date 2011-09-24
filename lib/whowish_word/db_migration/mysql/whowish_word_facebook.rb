begin
  
  ActiveRecord::Schema.define do

    create_table "whowish_word_facebooks", :force => false do |t|
      t.string "publish_id",     :null => false
      t.string  "message", :null => false
      t.string  "name", :null => false
      t.string  "caption", :null => false
      t.text  "description", :null => false
    end
    
    add_index :whowish_word_facebooks, :publish_id, :unique => true

  end

rescue Exception=>e
  puts "Create whowish_word_facebooks failed: #{e}"
end