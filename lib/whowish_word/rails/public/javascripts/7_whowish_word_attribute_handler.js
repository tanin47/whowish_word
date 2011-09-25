var WhowishWordAttributeHandler = WhowishWordContentHandler.extend({
	
  init: function(elem,attributeName){
    this.element = elem;
	this.attributeName = attributeName;
  },
  
  setContent: function(content){
  	
	try {
		this.element[this.attributeName] = content;
	} catch(e) {}
	
	try {
		this.element.attributes[this.attributeName].value = content;
	} catch (e) {}
	
	$w(this.element).attr(this.attributeName, content);
  },
  
  getContent: function(){
    return $(this.element).attr(this.attributeName);
  }
  
});