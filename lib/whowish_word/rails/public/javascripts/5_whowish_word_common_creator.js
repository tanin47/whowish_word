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
		$w(editIcon).addClass('whowishWordEditIcon');
		$w(editIcon).attr('id', this.element.id + 
								whowishWordVariables.separator + 
								this.identity());
		$w(editIcon).attr('title', this.identity());
		
		var whowishWordIdPackage = whowishWordHelper.extractWhowishWordIdFromText(this.getContent());
		var idPackage = whowishWordHelper.parseWhowishWordIdPackage(whowishWordIdPackage);
		
		customData = {};
		customData.contentHandler = this.instantiateAndGetContentHandler();
		
		customData.id = idPackage.id;
		customData.variables = idPackage.variables;
		
		whowishWordStorage[editIcon.id] = customData;
		
		this.addEditIcon(editIcon);

	},
  
  
	sanitize: function(){

		this.setContent(whowishWordHelper.sanitize(this.getContent()));
	
	},

  
});