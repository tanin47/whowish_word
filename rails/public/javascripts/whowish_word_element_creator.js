var WhowishWordElementCreator = WhowishWordCreator.extend({
  
	makeEditIcon: function(){
		
		var attrs = this.getRelevantAttributes();
		
		for (var i=0;i<attrs.length;i++) {
			
			var editIcon = document.createElement('span');
			$(editIcon).addClass('whowishWordEditIcon');
			$(editIcon).attr('id', this.getEditIconId(attrs[i]));
			$(editIcon).attr('title', attrs[i]);
			
			var whowishWordIdPackage = whowishWordHelper.extractWhowishWordIdFromText(this.element[attrs[i]]);
			var idPackage = whowishWordHelper.parseWhowishWordIdPackage(whowishWordIdPackage);
			
			editIcon.whowishWord = {};
			editIcon.whowishWord.contentHandler = new WhowishWordAttributeHandler(this.element, attrs[i]);
			
			editIcon.whowishWord.id = idPackage.id;
			editIcon.whowishWord.variables = idPackage.variables;
			editIcon.whowishWord.attributeName = attrs[i];
			
			this.addEditIcon(editIcon);
		}
		
	},
  
  
	sanitize: function(){
		
		var attrs = this.getRelevantAttributes();
		
		for (var i=0;i<attrs.length;i++) {
			var newValue = this.element[attrs[i]].replace(whowishWordVariables.attributeValuePattern,"$2");
			this.element.attributes[attrs[i]].value = newValue;
			this.element[attrs[i]] = newValue;
		}
	
	},
	
	getEditIconId: function(attributeName) {
	
		return this.element.id + 
				whowishWordVariables.separator + 
				attributeName;
	},
	

	
	getRelevantAttributes: function() {
	
		var attrs = [];
		
		for (var i = 0; i < this.element.attributes.length; i++) {
			
			if (this.element.attributes[i].name.toLowerCase() == "id") continue;
			if (this.element.attributes[i].name.toLowerCase() == "value") continue;
			
			if (this.element.attributes[i].value.match(whowishWordVariables.attributeValuePattern) != null) {
				attrs.push(this.element.attributes[i].name);
			}
		  
		}
		
		return attrs;
		
	}


  
});