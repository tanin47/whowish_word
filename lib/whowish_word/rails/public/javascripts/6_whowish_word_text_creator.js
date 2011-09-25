var WhowishWordTextCreator = WhowishWordCommonCreator.extend({
	
	identity: function() {
		return 'text';
	},
	
	getContent: function() {
		return $w(this.element).text();
	},
	
	setContent: function(content) {
		$w(this.element).text(content);
	},
	
	instantiateAndGetContentHandler: function() {
		return new WhowishWordTextHandler(this.element);
	}

  
});