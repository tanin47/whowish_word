var WhowishWordCommonCreator = WhowishWordCreator.extend({
	
	identity: function() {
		throw 'identity() is not implemented'
	},
	
	getContent: function() {
		throw 'getContent() is not implemented'
	},
	
	setContent: function() {
		throw 'setContent() is not implemented'
	},
	
	instantiateAndGetContentHandler: function() {
		throw 'instantiateAndGetContentHandler() is not implemented'
	},
	
	makeEditIcon: function(){
		
		var editIcon = document.createElement('span');
		$(editIcon).addClass('whowishWordEditIcon');
		$(editIcon).attr('id', this.element.id + 
								whowishWordVariables.separator + 
								this.identity());
		$(editIcon).attr('title', this.identity());
		
		var whowishWordIdPackage = whowishWordHelper.extractWhowishWordIdFromText(this.getContent());
		var idPackage = whowishWordHelper.parseWhowishWordIdPackage(whowishWordIdPackage);
		
		editIcon.whowishWord = {};
		editIcon.whowishWord.contentHandler = this.instantiateAndGetContentHandler();
		
		editIcon.whowishWord.id = idPackage.id;
		editIcon.whowishWord.variables = idPackage.variables;
		
		this.addEditIcon(editIcon);

	},
  
  
	sanitize: function(){

		this.setContent(this.getContent().replace(whowishWordVariables.attributeValuePattern,"$2"));
	
	},

  
});