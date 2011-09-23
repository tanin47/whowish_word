var WhowishWordTextHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element = elem;
  },
  
  setContent: function(content){
    $(this.element).text(content);
  },
  
  getContent: function() {
    return $(this.element).text();
  }
  
});