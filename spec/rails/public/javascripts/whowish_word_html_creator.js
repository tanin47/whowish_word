var WhowishWordHtmlCreator = WhowishWordCommonCreator.extend({
	
	identity: function() {
		return 'html';
	},
	
	getContent: function() {
		return $(this.element).html();
	},
	
	setContent: function(content) {
		$(this.element).html(content);
	},
	
	instantiateAndGetContentHandler: function() {
		return new WhowishWordHtmlHandler(this.element);
	}
  
});