var WhowishWordHtmlHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element = elem;
  },
  
  setContent: function(content){
    $w(this.element).html(content);
  },
  
  getContent: function(){
    return $w(this.element).html();
  }
  
});