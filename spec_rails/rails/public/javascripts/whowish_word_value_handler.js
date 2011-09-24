var WhowishWordValueHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element = elem;
  },
  
  setContent: function(content){
    $(this.element).val(content);

	if (this.element.attributes['value'] != undefined) {
		this.element.attributes['value'].value = content;
	}
  },
  
  getContent: function(){
    return $(this.element).val();
  }
  
});