var WhowishWordHtmlHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element_id = elem.id;
  },
  
  setContent: function(content){
  	var elem = $w('#' + this.element_id)[0];
    $w(elem).html(content);
  },
  
  getContent: function(){

  	var elem = $w('#' + this.element_id)[0];
    return $w(elem).html();
  }
  
});