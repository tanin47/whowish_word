var WhowishWordHtmlHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element = elem;
  },
  
  setContent: function(content){
    $(this.element).html(content);
  },
  
  getContent: function(){
    return $(this.element).html();
  }
  
});