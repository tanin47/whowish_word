var WhowishWordTextHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.elementId = elem.id;
  },
  
  setContent: function(content){
  	var elem = $w('#' + this.elementId)[0];
    $w(elem).text(content);
  },
  
  getContent: function() {
  	var elem = $w('#' + this.elementId)[0];
    return $w(elem).text();
  }
  
});