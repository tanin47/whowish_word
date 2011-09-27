var WhowishWordElementCreator = WhowishWordCreator.extend({
  
	makeEditIcon: function(){
		
		this.attrs = WhowishWordElementGuard.getRelevantAttributes(this.element);
		var attrs = this.attrs;
		
		for (var i=0;i<attrs.length;i++) {
			
			var editIcon = document.createElement('span');
			$w(editIcon).addClass('whowishWordEditIcon');
			$w(editIcon).attr('id', whowishWordHelper.makeEditIconId(this.element, attrs[i]));
			$w(editIcon).attr('title', attrs[i]);
			
			var whowishWordIdPackage = whowishWordHelper.extractWhowishWordIdFromText($w(this.element).attr(attrs[i]));
			var idPackage = whowishWordHelper.parseWhowishWordIdPackage(whowishWordIdPackage);
			
					
			customData = {};
			customData.contentHandler = new WhowishWordAttributeHandler(this.element, attrs[i]);
			
			customData.id = idPackage.id;
			customData.variables = idPackage.variables;
			customData.attributeName = attrs[i];
			
			whowishWordStorage[editIcon.id] = customData;
			
			this.addEditIcon(editIcon);
		}
		
	},
  
  
	sanitize: function(){
		
		var attrs = this.attrs;
		
		for (var i=0;i<attrs.length;i++) {
			
			var newValue = whowishWordHelper.sanitize($w(this.element).attr(attrs[i]));
			
			try {
				this.element[attrs[i]] = newValue;
			} catch(e) {}
			
			try {
				this.element.attributes[attrs[i]].value = newValue;
			} catch (e) {}
			
			$w(this.element).attr(attrs[i], newValue);
			
		}
	
	},


  
});