/**
 * @author Tanin
 */
var whowishWordVariables = {
	idRunner: 0,
	separator: "_____"
};
	
whowishWordVariables.attributeValuePattern = new RegExp("^__whowishWord__" +
															whowishWordVariables.separator + 
															"(.+)" + 
															whowishWordVariables.separator + "(.+)");
										
whowishWordVariables.whowishWordIdPattern = new RegExp("([^\|]+)(\|(.*))?");
	
whowishWordVariables.matchers = [
									{
										match: function(element){ return WhowishWordElementGuard.check(element); },
										createWhowishWord: function(element) { new WhowishWordElementCreator(element); }
									},
									{
										match: function(element) { return WhowishWordHtmlGuard.check(element); },
										createWhowishWord: function(element) { new WhowishWordHtmlCreator(element); }
									},
									{
										match: function(element) { return WhowishWordValueGuardAndSanitizer.check(element); },
										createWhowishWord: function(element) { new WhowishWordValueCreator(element); }
									},
									{
										match: function(element) { return WhowishWordTextGuard.check(element); },
										createWhowishWord: function(element) { new WhowishWordTextCreator(element); }
									}
								];
