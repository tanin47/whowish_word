/**
 * @author Tanin Na Nakorn
 */
(function($w){

 	$w.extend({ 
 		
 		whowishWordDialog: {
			
			start_loading: function() {
				$w('#whowishWordDialog').find(".saveButton").loading_button(true);
			},
			
			stop_loading: function() {
				$w('#whowishWordDialog').find(".saveButton").loading_button(false);
			},
			
			close: function() {
				whowishWordDialogHelper.close();
			},
			
			open: function(extra_options) {
			
				var options = {
					whowishWordId: "Undefined",
					variables: "",
					attributeName: "",
					content: "",
					success: function(){
						throw "success() undefined for whowishWordDialog()";
					}
				}
				
				$w.extend(options, extra_options);
				
				whowishWordDialogHelper.createOverlay();
				whowishWordDialogHelper.createDialog();
				
				
				$w('#whowishWordDialog').find('.whowishWordId').html(options.whowishWordId);
				
				
				if (options.attributeName == "") {
					$w('#whowishWordDialog').find('.attributeNamePanel').hide();
				}
				else {
					$w('#whowishWordDialog').find('.attributeNamePanel').show();
					$w('#whowishWordDialog').find('.attributeName').html(options.attributeName);
				}
				
				
				if (options.variables == "") {
					$w('#whowishWordDialog').find('.variablesPanel').hide();
				}
				else {
					$w('#whowishWordDialog').find('.variablesPanel').show();
					$w('#whowishWordDialog').find('.variables').html(options.variables);
				}
				
				
				$w('#whowishWordDialog').find('.content').val(options.content);
				whowishWordDialogHelper.saveCallback = options.success;
				
				$w('#whowishWordDialog').css({
					left: (($w(window).width() - $w('#whowishWordDialog').width()) / 2) + 'px',
					top: (($w(window).height() - $w('#whowishWordDialog').height()) / 2) + 'px'
				});
				
				
				
				whowishWordDialogHelper.open();
			}
			
		}
		
	});
	
})(jQueryWhowishWord);



var whowishWordDialogHelper = {};


whowishWordDialogHelper.saveCallback = null;


whowishWordDialogHelper.createOverlay = function() {
	
	if ($w('#whowishWordDialogOverlay').length > 0) return;
	$w('body').append('<div class="whowishWordDialogOverlay" id="whowishWordDialogOverlay"></div>');
	
};


whowishWordDialogHelper.createDialog = function() {
	
	if ($w('#whowishWordDialog').length > 0) return;
	
	$w('body').append('<div class="whowishWordDialog" id="whowishWordDialog">' +
		'<h1><span class="whowishWordId"></span></h1>' +
		'<span class="attributeNamePanel">' +
		 	'<b>Attribute\'s name:</b> <span class="attributeName"></span>' +
		'</span>' +
		'<span class="variablesPanel">' +
		 	'<b>Variables:</b> <span class="variables"></span>' +
		'</span>' +
		'<span class="contentPanel">' +
			'<b>Content:</b><br/>' +
		 	'<textarea id="whowishWordDialogContent" class="content"></textarea>' +
		'</span>' +
		'<span class="buttonPanel">' +
		 	'<span id="whowishWordDialogSaveButton" class="saveButton">Save</span>' +
			'<span id="whowishWordDialogCloseButton" class="closeButton">Close</span>' +
		'</span>' +
	'</div>');
	
	$w('#whowishWordDialog').find(".saveButton").click(function() {
		whowishWordDialogHelper.saveCallback($w('#whowishWordDialogContent').val());
	});
	
	$w('#whowishWordDialog').find(".closeButton").click(whowishWordDialogHelper.close);
	
};


whowishWordDialogHelper.open = function() {
	$w('#whowishWordDialogOverlay').show();
	$w('#whowishWordDialog').show();
};


whowishWordDialogHelper.close = function() {
	$w('#whowishWordDialogOverlay').hide();
	$w('#whowishWordDialog').hide();
};
