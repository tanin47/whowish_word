
var WhowishWordCreator = Class.extend({
	
  init: function(elem){
  	
    this.element = elem;
	
	if (this.element.tagName.toLowerCase() == "option") {
		this.editIconPanel = (new WhowishWordSelectCreator($(this.element).parent()[0])).editIconPanel;
	} else {
		this.editIconPanel = this.createAndGetEditIconPanel();
	}
	
	this.element.editIconPanel = this.editIconPanel;
	
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

	if (this.element.editIconPanel != undefined)
		return this.element.editIconPanel;
  	
	var editIconPanel = document.createElement('span');
	
	editIconPanel.whowishWord = {};
	editIconPanel.whowishWord.editIconPanel = editIconPanel;
	editIconPanel.whowishWord.element = this.element;
	editIconPanel.whowishWord.reposition = whowishWordHelper.editIconPanelRepositioning;
	
	$(editIconPanel).attr('id', this.generateEditIconPanelId())
					.addClass('whowishWordEditIconPanel');
					
	editIconPanel.whowishWord.reposition();
					
					
	$(this.element).after(editIconPanel);
	
	return editIconPanel;
  },
  
  
  generateEditIconPanelId: function() {
  	return this.element.id + "EditPanel" + (whowishWordVariables.idRunner++);
  }
  
  
});
