## define schema for words

begin 
  ActiveRecord::Schema.define do
  
    create_table "whowish_words", :force => false do |t|
      t.string "word_id", :null => false
      t.text  "content", :null => false
    end
    
  end

  ActiveRecord::Base.connection.execute("ALTER TABLE `whowish_words` ADD UNIQUE (`word_id`)")
  
  add_index :whowish_word_emails, :word_id

rescue Exception=>e
  puts "Create whowish_words failed: #{e}"
end

## define schema for emails
begin
  ActiveRecord::Schema.define do

    create_table "whowish_word_emails", :force => false do |t|
      t.string "word_id", :null => false
      t.text  "content", :null => false
    end

end

  ActiveRecord::Base.connection.execute("ALTER TABLE `whowish_word_emails` ADD UNIQUE (`word_id`)")

  add_index :whowish_word_emails, :word_id

rescue Exception=>e
  puts "Create whowish_words failed: #{e}"
end

## define schema for facebooks
begin
  ActiveRecord::Schema.define do

    create_table "whowish_word_facebooks", :force => false do |t|
      t.string "publish_id",     :null => false
      t.string  "message", :null => false
      t.string  "name", :null => false
      t.string  "caption", :null => false
      t.text  "description", :null => false
    end

  end

  ActiveRecord::Base.connection.execute("ALTER TABLE `whowish_word_facebooks` ADD UNIQUE (`publish_id`)")

  add_index :whowish_word_facebooks, :publish_id

rescue Exception=>e
  puts "Create whowish_words failed: #{e}"
end