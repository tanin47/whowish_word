var WhowishWordTextHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element_id = elem.id;
  },
  
  setContent: function(content){
  	var elem = $w('#' + this.element_id)[0];
    $w(elem).text(content);
  },
  
  getContent: function() {
  	var elem = $w('#' + this.element_id)[0];
    return $w(elem).text();
  }
  
});