/**
 * @author Tanin
 */
var whowishWordHelper = {};

function log(msg) {
	try {
		console.log(msg);
	} catch (e) {}
}

whowishWordHelper.repositionAllEditIconPanels = function() {
	
	var editIconPanels = $('.whowishWordEditIconPanel');
	for (var i=0;i<editIconPanels.length;i++) {
		editIconPanels[i].whowishWord.reposition();
	}
	
}


whowishWordHelper.editIconPanelRepositioning = function() {
	
	var pos = $(this.element).position();
	var marginLeft = $(this.element).margin().left;
	var marginTop = $(this.element).margin().top;
	var outdent = 10;
	
	$(this.editIconPanel).css('position', 'absolute')
						.css('left', (pos.left - outdent + marginLeft) + 'px')
						.css('top', (pos.top - outdent + marginTop) + 'px');
						
}


whowishWordHelper.editHandler = function() {

	var self = this;

	$.whowishWordDialog.open({
		
		whowishWordId: this.whowishWord.id,
		variables: this.whowishWord.variables,
		attributeName: this.whowishWord.attributeName,
		content: this.whowishWord.contentHandler.getContent(),
		success: function(html){
			
			$.whowishWordDialog.start_loading();
		
			$.ajax({
				type: "POST",
				url: '/whowish_word/edit',
				cache: false,
				headers: {
					"Connection": "close"
				},
				data: {
					"whowish_word_id": self.whowishWordId,
					"content": html
				},
				success: function(data) {
					self.whowishWordWriter.setContent(html);
					$.whowishWordDialog.stop_loading();
				},
				error: function(req, status, e){
					alert('WhowishWord cannot save the data. Please try again later.');
					$.whowishWordDialog.stop_loading();
				}
			});
			
		}
	});
	
}

	
whowishWordHelper.extractWhowishWordIdFromText = function(text) {
	var result = text.match(whowishWordVariables.attributeValuePattern);
	return result[1];
	
},


whowishWordHelper.parseWhowishWordIdPackage = function(whowishWordIdPackage){
	var result = whowishWordIdPackage.match(whowishWordVariables.whowishWordIdPattern);
	
	return {
		id: result[1],
		variables: result[3]
	};
}


/*
whowishWordHelper.parseEditIconId = function(editIconId) {
	
	var result = editIconId.match(whowishWordVariables.editIconIdPattern);
	
	var whowishWordIdPackage = result[3];
	var idPackage = whowishWordHelper.parseWhowishWordIdPackage(whowishWordIdPackage);
	
	return {
		elementId: result[1],
		attributeName: result[2],
		whowishWordId: idPackage.id,
		variables: idPackage.variables
	};
	
}
*/


/*
whowishWordHelper.findAllRelevantElements = function() {
	
	var elems = $('*');
	var selectedElems = [];
	
	for(var i=0;i<elems.length;i++) {
		
		var match = false;
		
		for (var j = 0; j < elems[i].attributes.length; j++) {
		  
		  if (elems[i].attributes[j].value.match(whowishWordVariables.attributeValuePattern) != null){
		  	match = true;
			break;
		  }
		  
		}

		if (match) selectedElems.push(elems[i]);
	}
	
	return selectedElems;
	
}

whowishWordHelper.sanitize = function(elem) {
	
	var attrs = whowishWordHelper.getRelevantAttributes(elem);
	
	for (var i=0;i<attrs.length;i++) {
		elem[attrs[i]] = elem[attrs[i]].replace(whowishWordVariables.attributeValuePattern,"$2");
	}

}


whowishWordHelper.attachEditIcon = function(elem) {
	
	var attrs = whowishWordHelper.getRelevantAttributes(elem);
	
	var pos = $(elem).position();
	var marginLeft = $(elem).margin().left;
	var marginTop = $(elem).margin().top;
	var outdent = 10;
	
	var positionStyle = 'position:absolute;' +
						'left:' + (pos.left - outdent + marginLeft) + 'px;' +
						'top:' + (pos.top - outdent + marginTop) + 'px;';

	var editIcon = '<span class="whowishWordEditIcon" id="' + 
					whowishWordHelper.createEditIconId(elem, attrs[0]) + 
					'" style="' + positionStyle + '"></span>';
	
	if (attrs.length > 1) {
		
		editIcon = '<span class="whowishWordEditIconPanel" style="'+positionStyle+'">';
		
		for (var i=0;i<attrs.length;i++) {
			editIcon += '<span class="whowishWordEditIcon" id="'+ 
						whowishWordHelper.createEditIconId(elem, attrs[i]) +
						'" title="' + attrs[i] + '"></span>';
		}
		
		editIcon += '</span>';
		
	}

	$(elem).after(editIcon);
	
}
*/
