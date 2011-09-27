/**
 * @author Tanin
 */
var whowishWordHelper = {};

whowishWordHelper.sanitize = function(content) {
	return content.replace(whowishWordVariables.attributeValuePattern,"$2")
}

whowishWordHelper.match = function(content) {
	return whowishWordHelper.matchWithResult(content) != null;
}

whowishWordHelper.matchWithResult = function(content) {
	return content.match(whowishWordVariables.attributeValuePattern);
}

whowishWordHelper.makeEditIconId = function(element, name) {
	return element.id + 
			whowishWordVariables.separator + 
			name;
}

whowishWordHelper.log = function(msg) {
	try {
		console.log(msg);
	} catch (e) {}
};

whowishWordHelper.repositionAllEditIconPanels = function() {
	
	var editIconPanels = $w('.whowishWordEditIconPanel');
	for (var i=0;i<editIconPanels.length;i++) {
		whowishWordStorage[editIconPanels[i].id].reposition();
	}
	
};


whowishWordHelper.editIconPanelRepositioning = function() {
	
	var pos = $w(this.element).position();
	var marginLeft = $w(this.element).margin().left;
	var marginTop = $w(this.element).margin().top;
	var outdent = 10;
	
	$w(this.editIconPanel).css('position', 'absolute')
						.css('left', (pos.left - outdent + marginLeft) + 'px')
						.css('top', (pos.top - outdent + marginTop) + 'px');
						
};


whowishWordHelper.editHandler = function(event) {

	event.stopPropagation();
	event.preventDefault() 

	var self = this;
	var customData = whowishWordStorage[this.id]

	$w.whowishWordDialog.open({
		
		whowishWordId: customData.id,
		variables: customData.variables,
		attributeName: customData.attributeName,
		content: customData.contentHandler.getContent(),
		success: function(html){
			
			$w.whowishWordDialog.start_loading();
		
			$w.ajax({
				type: "POST",
				url: '/whowish_word/change_word',
				cache: false,
				headers: {
					"Connection": "close"
				},
				data: {
					"word_id": customData.id,
					"content": html
				},
				success: function(data) {
					customData.contentHandler.setContent(html);
					$w.whowishWordDialog.close();
					$w.whowishWordDialog.stop_loading();
				},
				error: function(req, status, e){
					alert('WhowishWord cannot save the data. The Ajax resquest is not sent. Please try again later.');
					$w.whowishWordDialog.stop_loading();
				}
			});
			
		}
	});
	
};

	
whowishWordHelper.extractWhowishWordIdFromText = function(text) {
	var result = whowishWordHelper.matchWithResult(text);
	return result[1];
	
};


whowishWordHelper.parseWhowishWordIdPackage = function(whowishWordIdPackage){
	var result = whowishWordIdPackage.match(whowishWordVariables.whowishWordIdPattern);
	
	return {
		id: result[1],
		variables: result[3]
	};
};
