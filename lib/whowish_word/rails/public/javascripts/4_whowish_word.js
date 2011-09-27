/**
 * @author Tanin Na Nakorn
 */

var whowishWordStorage = {};

(function($w){

 	$w.extend({ 
 		
 		whowishWord: function(recurring) {
			
			var elems = $w('body').find('*');
			var matchers = whowishWordVariables.matchers;
			
			for (var i=0;i<elems.length;i++) {
				
				for (var j=0;j<matchers.length;j++) {
					
					if (matchers[j].match(elems[i])) {
						matchers[j].createWhowishWord(elems[i]);
					}
				}
				
			}
			
			$w('.whowishWordEditIcon').die('click');
			whowishWordHelper.repositionAllEditIconPanels();
			$w('.whowishWordEditIcon').live('click', whowishWordHelper.editHandler);
			
			if (recurring != false) {
				setTimeout("$w.whowishWord(true);",1000);
			}
			
		}
		
	});
	
})(jQueryWhowishWord);

