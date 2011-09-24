var WhowishWordTextCreator = WhowishWordCommonCreator.extend({
	
	identity: function() {
		return 'text(native)';
	},
	
	getContent: function() {
		return $(this.element).text();
	},
	
	setContent: function(content) {
		$(this.element).text(content);
	},
	
	instantiateAndGetContentHandler: function() {
		return new WhowishWordTextHandler(this.element);
	}

  
});