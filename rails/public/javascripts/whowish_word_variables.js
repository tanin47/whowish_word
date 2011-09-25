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
										match: function(element) {
											
											for (var i = 0; i < element.attributes.length; i++) {
												
												if (element.attributes[i].name.toLowerCase() == "id") continue;
												if (element.attributes[i].name.toLowerCase() == "value") continue;
												
												if (element.attributes[i].value.match(whowishWordVariables.attributeValuePattern) != null) {
													
													return true;
												}
											}
											
											return false;
										},
										createWhowishWord: function(element) { new WhowishWordElementCreator(element); }
									},
									{
										match: function(element) {
											
											return (element.tagName.toLowerCase() == "dfn"
													|| element.tagName.toLowerCase() == "button"
													|| element.tagName.toLowerCase() == "label")
													 && $(element).html().match(whowishWordVariables.attributeValuePattern) != null;
													
										},
										createWhowishWord: function(element) { new WhowishWordHtmlCreator(element); }
									},
									{
										match: function(element) {
											
											return element.tagName.toLowerCase() != "select"
													&& $(element).val().match(whowishWordVariables.attributeValuePattern) != null;
													
										},
										createWhowishWord: function(element) { new WhowishWordValueCreator(element); }
									},
									{
										match: function(element) {
											
											return element.tagName.toLowerCase() == "option" &&
													$(element).text().match(whowishWordVariables.attributeValuePattern) != null;
													
										},
										createWhowishWord: function(element) { new WhowishWordTextCreator(element); }
									}
								];

//whowishWordVariables.editIconIdPattern = new RegExp("(.+)" + whowishWordVariables.separator + "(.+)" + whowishWordVariables.separator + "(.+)");

