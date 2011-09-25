(function($){

 	$.fn.extend({ 
	
		loading_icon:function(enabled)
		{
			return this.each(function() {
				
				if (enabled == true)
				{
					if (this.loading == true) return;
					this.loading = true;
					this.save_background = $(this).css('background-image');
					$(this).css('background-image','url()');

					$(this).html('<span style="display:inline-block;width:100%;height:100%;vertical-align:top;background-image:url(\'data:image/gif;base64,R0lGODlhEAALAPQAAP///0tMSuTk5N3d3e/v709QTktMSmtsaqanpo6Pjs7OzWJjYn9/fqysq5GSkNDR0GVmZE1OTIGCge3t7OPj4/b29nJzcebm5fX19cvLyru8u9nZ2fLy8gAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCwAAACwAAAAAEAALAAAFLSAgjmRpnqSgCuLKAq5AEIM4zDVw03ve27ifDgfkEYe04kDIDC5zrtYKRa2WQgAh+QQJCwAAACwAAAAAEAALAAAFJGBhGAVgnqhpHIeRvsDawqns0qeN5+y967tYLyicBYE7EYkYAgAh+QQJCwAAACwAAAAAEAALAAAFNiAgjothLOOIJAkiGgxjpGKiKMkbz7SN6zIawJcDwIK9W/HISxGBzdHTuBNOmcJVCyoUlk7CEAAh+QQJCwAAACwAAAAAEAALAAAFNSAgjqQIRRFUAo3jNGIkSdHqPI8Tz3V55zuaDacDyIQ+YrBH+hWPzJFzOQQaeavWi7oqnVIhACH5BAkLAAAALAAAAAAQAAsAAAUyICCOZGme1rJY5kRRk7hI0mJSVUXJtF3iOl7tltsBZsNfUegjAY3I5sgFY55KqdX1GgIAIfkECQsAAAAsAAAAABAACwAABTcgII5kaZ4kcV2EqLJipmnZhWGXaOOitm2aXQ4g7P2Ct2ER4AMul00kj5g0Al8tADY2y6C+4FIIACH5BAkLAAAALAAAAAAQAAsAAAUvICCOZGme5ERRk6iy7qpyHCVStA3gNa/7txxwlwv2isSacYUc+l4tADQGQ1mvpBAAIfkECQsAAAAsAAAAABAACwAABS8gII5kaZ7kRFGTqLLuqnIcJVK0DeA1r/u3HHCXC/aKxJpxhRz6Xi0ANAZDWa+kEAA7AAAAAAAAAAAA\');background-repeat:no-repeat;" onclick="if (event.stopPropagation) event.stopPropagation();event.cancelBubble = true;return false;"></span>');
				}
				else
				{
					if (this.loading == undefined || this.loading == false) return;
					this.loading = false;
					$(this).html('');
					$(this).css('background-image',this.save_background);
				}
			
    		});
			
		},
 		
		//pass the options variable to the function
 		loading_button: function(enabled,options) {


			//Set the default values, use comma to separate the settings, example:
			var defaults = {
				image : '<img src="data:image/gif;base64,R0lGODlhEAALAPQAAP///0tMSuTk5N3d3e/v709QTktMSmtsaqanpo6Pjs7OzWJjYn9/fqysq5GSkNDR0GVmZE1OTIGCge3t7OPj4/b29nJzcebm5fX19cvLyru8u9nZ2fLy8gAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCwAAACwAAAAAEAALAAAFLSAgjmRpnqSgCuLKAq5AEIM4zDVw03ve27ifDgfkEYe04kDIDC5zrtYKRa2WQgAh+QQJCwAAACwAAAAAEAALAAAFJGBhGAVgnqhpHIeRvsDawqns0qeN5+y967tYLyicBYE7EYkYAgAh+QQJCwAAACwAAAAAEAALAAAFNiAgjothLOOIJAkiGgxjpGKiKMkbz7SN6zIawJcDwIK9W/HISxGBzdHTuBNOmcJVCyoUlk7CEAAh+QQJCwAAACwAAAAAEAALAAAFNSAgjqQIRRFUAo3jNGIkSdHqPI8Tz3V55zuaDacDyIQ+YrBH+hWPzJFzOQQaeavWi7oqnVIhACH5BAkLAAAALAAAAAAQAAsAAAUyICCOZGme1rJY5kRRk7hI0mJSVUXJtF3iOl7tltsBZsNfUegjAY3I5sgFY55KqdX1GgIAIfkECQsAAAAsAAAAABAACwAABTcgII5kaZ4kcV2EqLJipmnZhWGXaOOitm2aXQ4g7P2Ct2ER4AMul00kj5g0Al8tADY2y6C+4FIIACH5BAkLAAAALAAAAAAQAAsAAAUvICCOZGme5ERRk6iy7qpyHCVStA3gNa/7txxwlwv2isSacYUc+l4tADQGQ1mvpBAAIfkECQsAAAAsAAAAABAACwAABS8gII5kaZ7kRFGTqLLuqnIcJVK0DeA1r/u3HHCXC/aKxJpxhRz6Xi0ANAZDWa+kEAA7AAAAAAAAAAAA">',
				word: 'Loading'
			}
				
			var options =  $.extend(defaults, options);

    		return this.each(function() {
				
				if (enabled == true)
				{
					var inside_content = $(this).html();
					
					$(this).html('<span style="display:inline-block;width:100%;height:100%;" onclick="if (event.stopPropagation) event.stopPropagation();event.cancelBubble = true;return false;">'+options.image + ' ' + options.word+'</span>');
					
					$(this).append('<span class="loading_button_hidden_div" style="display: none;">'+inside_content+'</span>');
				}
				else
				{
					var hidden_div = $('.loading_button_hidden_div',this);
					
					if (hidden_div.length == 0) return;
					
					$(this).html($(hidden_div).html());
				}
			
    		});
    	}
	});
	
})(jQuery);

