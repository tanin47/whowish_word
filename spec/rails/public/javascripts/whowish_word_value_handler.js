var WhowishWordValueHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element = elem;
  },
  
  setContent: function(content){
    $(this.element).val(content);
  },
  
  getContent: function(){
    return $(this.element).val();
  }
  
});