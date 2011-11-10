begin 
  WhowishWordHtml.collection.drop_indexes
  WhowishWordHtml.create_indexes
rescue Exception=>e

end