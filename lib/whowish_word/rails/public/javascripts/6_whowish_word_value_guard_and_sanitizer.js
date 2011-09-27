var WhowishWordValueGuardAndSanitizer = {
	
	check: function(element) {
		
		var val;
		
		if (element.tagName.toLowerCase() != "select"
			&& (typeof(val = $w(element).val())).toLowerCase() == "string"
			&& whowishWordHelper.match(val)) {
			
			if ($w('#'+whowishWordHelper.makeEditIconId(element, "value")).length == 0) {
				return true;
			} else {
				$w(element).val(whowishWordHelper.sanitize(val));
			}
			
		}
		
		return false;
				
	}

  
};