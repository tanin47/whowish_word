var WhowishWordHtmlGuard = {
	
	check: function(element) {
		return (element.tagName.toLowerCase() == "dfn"
				|| element.tagName.toLowerCase() == "button"
				|| element.tagName.toLowerCase() == "label")
				&& (typeof(html = $w(element).html())).toLowerCase() == "string"
				&& whowishWordHelper.match(html)
				&& ($w('#' + whowishWordHelper.makeEditIconId(element, 'html')).length == 0);
	}
  
};