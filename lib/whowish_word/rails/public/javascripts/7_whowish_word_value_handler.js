var WhowishWordValueHandler = WhowishWordContentHandler.extend({
	
  init: function(elem){
    this.element_id = elem.id;
  },
  
  setContent: function(content){
  	var elem = $w('#' + this.element_id)[0];
	
    $w(elem).val(content);

	if (elem.attributes['value'] != undefined) {
		elem.attributes['value'].value = content;
	}
	
	if (elem.value != undefined) {
		elem.value = content;
	}
	
	$w(elem).attr('value', content);
  },
  
  getContent: function(){
  	var elem = $w('#' + this.element_id)[0];
    return $w(elem).val();
  }
  
});