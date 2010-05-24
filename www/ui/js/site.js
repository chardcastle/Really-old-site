(function($){
	// plugin definition
	$.fn.scrambel = function(options) {
	  var defaults = {
	    speed: 1000,
	    limit: 300,
	    animate:false
	  };
	  // Extend our default options with those provided.
	  var opts = $.extend(defaults, options);
	  // Our plugin implementation code goes here.
	  this.each(function(){
		var top = Math.floor(Math.random()*opts.limit);
		var left = Math.floor(Math.random()*opts.limit);
			//console.log(top+" "+left+" "+lim);
		if(opts.animate){
			if($(this).is(":animated")){
				$(this).stop();
			}
			$(this)
			.animate({top:top+"px",left:left+"px"},opts.speed);	
		}else{			
			$(this)
			.css("top",top+"px")
			.css("left",left+"px");	  	
		}
	  });
	  return this;
	};
	/*
	Stop animation to restart
	*/
	$.fn.stopIfAnimated = function(){
		this.each(function(){
			if($(this).is(":animated")){
				$(this).stop();
			}		
		});
		// return
		return this;	
	};
	/*
	Stop animation to restart
	*/
	$.fn.resizeIfNecessary = function(){
		this.each(function(){
			if(!$(this).is(".fullsize")){
				$(this).attr("style","");
			}		
		});
		// return
		return this;	
	};
	/*
	Stop animation to restart
	*/
	$.fn.loadOrigins = function(){
		this.each(function(){
			if(!$(this).is(".fullsize")){
				$(this).attr("style","");
			}		
		});
		// return
		return this;	
	};
})(jQuery);
/*
 * One long init function
*/
(function($){

   $("body")
	.fadeTo(0,1,function(){
		// use fadeTo as forced link in this chain
		// save required data
		var ch = {};
		$.data(ch,"lim",$("#container").width()-$("#container div:first").width());
		$.data(ch,"linkItems",$("#linkItems").text());
		// store current page digit
		$.data(document.body,"currentPage",1);
		//console.log("Result is"+$.data(ch,"linkItems"));
		// make data for each element
		$("#container")
		.children("div.outer")
		.each(function(i,item){
			//console.log("ere alright");
			$.data(item,"pos",{top:$(item).css("top"),left:$(item).css("left")});			
		});
		// TEST via console
		$("#container")
		.children("div.outer")
		.each(function(i,item){
			//console.log($.data(item,"pos").left);
		});	
	})
	.find(".pagination a")
	.each(function(i,item){
		$(item).click(function(e){
				e.preventDefault();
				// decide direction based on last choice
				// * forward is the addition of viewport width to contents left position
				// * backwards is minus move value of the viewport				
				var url = $(this).attr("href");
				var req = url.split("/").reverse();
				var isForward = ($.data(document.body,"currentPage") < req[0])?'-':'';
				// save request for decision on next click
				$.data(document.body,"currentPage",req[0]);	
				// respond			
				$("#container")
				.animate({left:(isForward)+$("#container").width()},600,function(){
					// return to original position
					$("body")
					.find("div[id^=box] .inner")
					.fadeOut(0)
					.end()
					.fadeTo(0,1,function(){
						$.getJSON(url+"/true",function(json){
							$.each(json,function(key,value){
								var ele = $("div[id*=box"+value["index"]+"]");
								// its a pain, but consider the homepage
								if(value["index"] !== 1){
									ele.removeClass("home");
								}else{
									ele.addClass("home");
								}		
								ele // update the div with new content
								.find(".body")
								.html(value["body"])
								.end()
								.find(".pubDate")
								.html(value["title"])
								.end()
								.find(".close")
								.attr("href","/day/view/"+value["id"]);							
							});
						});
					})				
					.find("#container") // Snap the container back in position 		
					.css("left",0)		// trick usr into thinking its not moved?
					.end()
					.find("div[id^=box] .inner") // Slowly fade content in ... mmm nice
					.fadeIn(600);					
				})
				// Update navigation selection
				$(".paginationjs")
				.find("a")
				.removeClass("selected")
				.end()
				.find("a[href="+url+"]")
				.addClass("selected");
			return false;
		});
	})
	.end()
	.find(".pagination")
	.attr("class","paginationjs")    
	// make new navigation stucture
})(jQuery);
