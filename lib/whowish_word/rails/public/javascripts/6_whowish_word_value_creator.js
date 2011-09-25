var WhowishWordValueCreator = WhowishWordCommonCreator.extend({
	
	identity: function() {
		return 'value';
	},
	
	getContent: function() {
		return $w(this.element).val();
	},
	
	setContent: function(content) {
		$w(this.element).val(content);
	},
	
	instantiateAndGetContentHandler: function() {
		return new WhowishWordValueHandler(this.element);
	}

  
});