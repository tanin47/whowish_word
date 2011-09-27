
var WhowishWordCreator = Class.extend({
	
  init: function(elem){
  	
    this.element = elem;
	
	if (this.element.id == "" || this.element.id == undefined) {
		this.element.id = "whowishWordId" + (whowishWordVariables.idRunner++);
	}
	
	if (this.element.tagName.toLowerCase() == "option") {
		this.editIconPanel = (new WhowishWordSelectCreator($w(this.element).parent()[0])).editIconPanel;
	} else {
		this.editIconPanel = this.createAndGetEditIconPanel();
	}
	
	
	this.makeEditIcon();
	this.sanitize();
	
  },
  
  makeEditIcon: function() {
  	throw 'makeEditIcon() is not implemented'
  },
  
  sanitize: function() {
  	throw 'sanitize() is not implemented'
  },
  
  addEditIcon: function(editIcon){
    this.editIconPanel.appendChild(editIcon);
  },
  
  createAndGetEditIconPanel: function() {

	if ($('#' + this.makeEditIconPanelId()).length > 0)
		return $('#' + this.makeEditIconPanelId())[0];
  	
	var editIconPanel = document.createElement('span');
	
	$w(editIconPanel).attr('id', this.makeEditIconPanelId())
					.addClass('whowishWordEditIconPanel');
	
	customData = {};
	customData.editIconPanelId = editIconPanel.id;
	customData.elementId = this.element.id;
	customData.reposition = whowishWordHelper.editIconPanelRepositioning;
	
	whowishWordStorage[editIconPanel.id] = customData;
	
	
					
	whowishWordStorage[editIconPanel.id].reposition();
					
					
	$w(this.element).after(editIconPanel);
	
	return editIconPanel;
  },
  
  
  makeEditIconPanelId: function() {
  	return this.element.id + "EditPanel";
  }
  
  
});
