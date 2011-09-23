/**
 * @author Tanin Na Nakorn
 */

(function($){

 	$.extend({ 
 		
 		whowishWord: function(recurring) {
			
			var elems = $('*');
			var matchers = whowishWordVariables.matchers;
			
			for (var i=0;i<elems.length;i++) {
				
				for (var j=0;j<matchers.length;j++) {
					
					if (matchers[j].match(elems[i])) {
						
						if (elems[i].id == "" || elems[i].id == undefined) {
							elems[i].id = "whowishWordId" + (whowishWordVariables.idRunner++);
						}
						
						matchers[j].createWhowishWord(elems[i]);
					}
					
				}
				
			}
			
			$('.whowishWordEditIcon').die('click');
			whowishWordHelper.repositionAllEditIconPanels();
			$('.whowishWordEditIcon').live('click', whowishWordHelper.editHandler);
			
			if (recurring != false) {
				setTimeout("$.whowishWord(true);",1000);
			}
			
		}
		
	});
	
})(jQuery);

