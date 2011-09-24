/**
 * @author Tanin Na Nakorn
 */
(function($){

 	$.extend({ 
 		
 		whowishWordDialog: {
			
			start_loading: function() {
				$('#whowishWordDialog').find(".saveButton").loading_button(true);
			},
			
			stop_loading: function() {
				$('#whowishWordDialog').find(".saveButton").loading_button(false);
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
				
				$.extend(options, extra_options);
				
				whowishWordDialogHelper.createOverlay();
				whowishWordDialogHelper.createDialog();
				
				
				$('#whowishWordDialog').find('.whowishWordId').html(options.whowishWordId);
				
				
				if (options.attributeName == "") {
					$('#whowishWordDialog').find('.attributeNamePanel').hide();
				}
				else {
					$('#whowishWordDialog').find('.attributeNamePanel').show();
					$('#whowishWordDialog').find('.attributeName').html(options.attributeName);
				}
				
				
				if (options.variables == "") {
					$('#whowishWordDialog').find('.variablesPanel').hide();
				}
				else {
					$('#whowishWordDialog').find('.variablesPanel').show();
					$('#whowishWordDialog').find('.variables').html(options.variables);
				}
				
				
				$('#whowishWordDialog').find('.content').val(options.content);
				whowishWordDialogHelper.saveCallback = options.success;
				
				$('#whowishWordDialog').css({
					left: (($(window).width() - $('#whowishWordDialog').width()) / 2) + 'px',
					top: (($(window).height() - $('#whowishWordDialog').height()) / 2) + 'px'
				});
				
				
				
				whowishWordDialogHelper.open();
			}
			
		}
		
	});
	
})(jQuery);



var whowishWordDialogHelper = {};


whowishWordDialogHelper.saveCallback = null;


whowishWordDialogHelper.createOverlay = function() {
	
	if ($('#whowishWordDialogOverlay').length > 0) return;
	$('body').append('<div class="whowishWordDialogOverlay" id="whowishWordDialogOverlay"></div>');
	
}


whowishWordDialogHelper.createDialog = function() {
	
	if ($('#whowishWordDialog').length > 0) return;
	
	$('body').append('<div class="whowishWordDialog" id="whowishWordDialog">' +
		'<h1><span class="whowishWordId"></span></h1>' +
		'<span class="attributeNamePanel">' +
		 	'<b>Attribute\'s name:</b> <span class="attributeName"></span>' +
		'</span>' +
		'<span class="variablesPanel">' +
		 	'<b>Variables:</b> <span class="variables"></span>' +
		'</span>' +
		'<span class="contentPanel">' +
			'<b>Content:</b><br/>' +
		 	'<textarea class="content"></textarea>' +
		'</span>' +
		'<span class="buttonPanel">' +
		 	'<span class="saveButton">Save</span>' +
			'<span class="closeButton">Close</span>' +
		'</span>' +
	'</div>');
	
	$('#whowishWordDialog').find(".saveButton").click(function() {
		whowishWordDialogHelper.saveCallback();
	});
	
	$('#whowishWordDialog').find(".closeButton").click(whowishWordDialogHelper.close);
	
}


whowishWordDialogHelper.open = function() {
	$('#whowishWordDialogOverlay').show();
	$('#whowishWordDialog').show();
}


whowishWordDialogHelper.close = function() {
	$('#whowishWordDialogOverlay').hide();
	$('#whowishWordDialog').hide();
}
