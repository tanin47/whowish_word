var WhowishWordElementGuard = {

	check: function(element){
		return (this.getRelevantAttributes(element).length > 0)
	},
	
	getRelevantAttributes: function(element) {
	
		var attrs = [];
		
		for (var i = 0; i < element.attributes.length; i++) {
			
			var attr_name = element.attributes[i].name.toLowerCase();
			
			if (attr_name == "id") continue;
			if (attr_name == "value") continue;
			if ($w('#' + whowishWordHelper.makeEditIconId(element, attr_name)).length > 0) continue;
			
			var value = element.attributes[i].value;
			
			if (typeof(value).toLowerCase() != "string") continue;
			
			if (whowishWordHelper.match(value)) {
				attrs.push(element.attributes[i].name);
			}
		  
		}
		
		return attrs;
		
	}
};