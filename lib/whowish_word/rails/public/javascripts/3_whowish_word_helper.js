/**
 * @author Tanin
 */
var whowishWordHelper = {};

function log(msg) {
	try {
		console.log(msg);
	} catch (e) {}
};

whowishWordHelper.repositionAllEditIconPanels = function() {
	
	var editIconPanels = $w('.whowishWordEditIconPanel');
	for (var i=0;i<editIconPanels.length;i++) {
		editIconPanels[i].whowishWord.reposition();
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


whowishWordHelper.editHandler = function() {

	var self = this;

	$w.whowishWordDialog.open({
		
		whowishWordId: this.whowishWord.id,
		variables: this.whowishWord.variables,
		attributeName: this.whowishWord.attributeName,
		content: this.whowishWord.contentHandler.getContent(),
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
					"word_id": self.whowishWord.id,
					"content": html
				},
				success: function(data) {
					self.whowishWord.contentHandler.setContent(html);
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
	var result = text.match(whowishWordVariables.attributeValuePattern);
	return result[1];
	
};


whowishWordHelper.parseWhowishWordIdPackage = function(whowishWordIdPackage){
	var result = whowishWordIdPackage.match(whowishWordVariables.whowishWordIdPattern);
	
	return {
		id: result[1],
		variables: result[3]
	};
};
