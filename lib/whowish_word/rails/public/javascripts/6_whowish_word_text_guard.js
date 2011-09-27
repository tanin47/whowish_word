var WhowishWordTextGuard = {
	
	check: function(element) {
		return element.tagName.toLowerCase() == "option" 
				&& (typeof(text = $w(element).text())).toLowerCase() == "string"
				&& whowishWordHelper.match(text)
				&& ($w('#' + whowishWordHelper.makeEditIconId(element, 'text')).length == 0);
	}
  
};