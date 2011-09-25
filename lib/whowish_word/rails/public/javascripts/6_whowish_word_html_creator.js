var WhowishWordHtmlCreator = WhowishWordCommonCreator.extend({
	
	identity: function() {
		return 'html';
	},
	
	getContent: function() {
		return $w(this.element).html();
	},
	
	setContent: function(content) {
		$w(this.element).html(content);
	},
	
	instantiateAndGetContentHandler: function() {
		return new WhowishWordHtmlHandler(this.element);
	}
  
});