var WhowishWordTextHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element = elem;
  },
  
  setContent: function(content){
    $w(this.element).text(content);
  },
  
  getContent: function() {
    return $w(this.element).text();
  }
  
});