var WhowishWordAttributeHandler = WhowishWordContentHandler.extend({
	
  init: function(elem,attributeName){
    this.elementId = elem.id;
	this.attributeName = attributeName;
  },
  
  setContent: function(content){
  	
	var elem = $w('#' + this.elementId)[0];
	
	try {
		elem[this.attributeName] = content;
	} catch(e) {}
	
	try {
		elem.attributes[this.attributeName].value = content;
	} catch (e) {}
	
	$w(elem).attr(this.attributeName, content);
  },
  
  getContent: function(){
  	var elem = $w('#' + this.elementId)[0];
    return $w(elem).attr(this.attributeName);
	
  }
  
});