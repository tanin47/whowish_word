var WhowishWordAttributeHandler = WhowishWordContentHandler.extend({
	
  init: function(elem,attributeName){
    this.element = elem;
	this.attributeName = attributeName;
  },
  
  setContent: function(content){
    this.element[this.attributeName] = content;
	this.element.attributes[this.attributeName].value = content;
  },
  
  getContent: function(){
    return this.element[this.attributeName];
  }
  
});