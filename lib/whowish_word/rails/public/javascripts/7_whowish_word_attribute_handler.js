var WhowishWordAttributeHandler = WhowishWordContentHandler.extend({
	
  init: function(elem,attributeName){
    this.element_id = elem.id;
	this.attributeName = attributeName;
  },
  
  setContent: function(content){
  	
	var elem = $w('#' + this.element_id)[0];
	
	try {
		elem[this.attributeName] = content;
	} catch(e) {}
	
	try {
		elem.attributes[this.attributeName].value = content;
	} catch (e) {}
	
	$w(elem).attr(this.attributeName, content);
  },
  
  getContent: function(){
  	var elem = $w('#' + this.element_id)[0];
    return $w(elem).attr(this.attributeName);
	
  }
  
});