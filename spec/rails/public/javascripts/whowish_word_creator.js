var WhowishWordCreator = Class.extend({
	
  init: function(elem){
  	
    this.element = elem;
	
	if (this.element.tagName.toLowerCase() == "option") {
		this.editIconPanel = this.createAndGetEditIconPanelOfSelect();
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
  
  
  createAndGetEditIconPanelOfSelect: function() {
  	
	var selectCreator = new WhowishWordSelectCreator($(this.element).parent()[0]);
	return selectCreator.editIconPanel;
	
  },
  
  
  createAndGetEditIconPanel: function() {
  	
	var editIconPanels = $('#' + $.escape(this.getEditIconPanelId()));
	
	if (editIconPanels.length > 0)
		return editIconPanels[0];
  	
	var editIconPanel = document.createElement('span');
	
	editIconPanel.whowishWord = {};
	editIconPanel.whowishWord.editIconPanel = editIconPanel;
	editIconPanel.whowishWord.element = this.element;
	editIconPanel.whowishWord.reposition = whowishWordHelper.editIconPanelRepositioning;
	
	$(editIconPanel).attr('id', this.getEditIconPanelId())
					.addClass('whowishWordEditIconPanel');
					
	editIconPanel.whowishWord.reposition();
					
					
	$(this.element).after(editIconPanel);
	
	return editIconPanel;
  },
  
  
  getEditIconPanelId: function() {
  	return this.element.id + "EditPanel";
  }
  
  
});
