(function($){
	/*
		Gracefully moves the HTML either left or right,
		loads the content and returns to its position
		* Home html contains the entire home snippet for
		quick reference
	*/
	$.fn.runHardcastleMove = function(options) {
	  var defaults = {
		url: '',
		req: [], 
		isForward: '',
		homeHtml: '',
		distance: $("#container").width() 
	  };
		// blend options
	  var opts = $.extend(defaults, options);
	  		// Find all divs whos id's start with "box"
			this
			.find("div[id^=box] .inner")
			.fadeOut(0)
			.end() // hide data targets and force call back for request
			.find("#container")
			.fadeTo(0,1,function(){
				$.getJSON(opts.url+"/true",function(json){
					$.each(json,function(key,value){
						var ele = $("div[id*=box"+value["index"]+"]");
						// its a pain, but consider the homepage
						if(value["id"] !== "1"){
							ele.removeClass("home")
							.find(".body")
							.html(value["body"])
							.end()
							.find(".pubDate a")
							.text(value["title"])
							.end()
							.find(".close")
							.attr("href","/day/view/"+value["id"]);	
						}else{	
							// re-draw home snippet									
							ele.addClass("home")
							.html(opts.homeHtml);
						}						
					});					
				})
			})
			.animate({left:(opts.isForward)+opts.distance},600,function(){
				$(this).css("left","0").find("div[id^=box] .inner").fadeIn(600);
			})
	  return this;
	};
})(jQuery);
/*
 * One long init function
*/
(function($){

   $("body")
	.fadeTo(0,1,function(){
		/* use fadeTo as forced link in this chain
		 * save required data
		*/ 
		// store current page digit
		$.data(document.body,"currentPage",1);
		// make data for each element
		$("#container")
		.children("div.outer")
		.each(function(i,item){
			$.data(item,"pos",{top:$(item).css("top"),left:$(item).css("left")});			
		});
		$.data(document.body,"homeHtml",$("#box1").html());		
	})
	.find(".pagination a")
	.each(function(i,item){
		$(item).click(function(e){
			e.preventDefault();
			// decide direction based on last choice
			// * forward is the addition of viewport width to contents left position
			// * backwards is minus move value of the viewport
			var click = {
				url: $(this).attr("href"),
				req: [], 
				isForward: '',
				homeHtml: $.data(document.body,"homeHtml")
			}				
			click.req = click.url.split("/").reverse();				
			click.isForward = ($.data(document.body,"currentPage") < click.req[0])?'-':'';
			// save request for decision on next click
			$.data(document.body,"currentPage",click.req[0]);	

			$("body").runHardcastleMove(click);					

			$(".paginationjs")
			.find("a")
			.removeClass("selected")
			.end()
			.find("a[href="+click.url+"]")
			.addClass("selected");
			return false;
		});
	})
	.end()
	.find(".pagination")
	.attr("class","paginationjs")
	.click(function(e){
		/*
		 no link for that .. was either first page
		 or "previous" which will always be first page
		*/
		e.preventDefault();
		var click = {
			url: "/page/view/1",
			req: [], 
			isForward: '-',
			homeHtml: $.data(document.body,"homeHtml")
		}						
		click.req = click.url.split("/").reverse();				
		// save request for decision on next click
		$.data(document.body,"currentPage",1);	
		// respond					
		$("body").runHardcastleMove(click);					
		// Update navigation selection
		$(".paginationjs")
		.find("a")
		.removeClass("selected")
		.end()
		.find("a[href="+click.url+"]")
		.addClass("selected");
		return false;
	});
})(jQuery);
