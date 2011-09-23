var WhowishWordValueCreator = WhowishWordCommonCreator.extend({
	
	identity: function() {
		return 'value(native)';
	},
	
	getContent: function() {
		return $(this.element).val();
	},
	
	setContent: function(content) {
		$(this.element).val(content);
	},
	
	instantiateAndGetContentHandler: function() {
		return new WhowishWordValueHandler(this.element);
	}

  
});