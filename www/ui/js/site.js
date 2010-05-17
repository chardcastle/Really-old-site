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
	  // return
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
})(jQuery);

(function($){    
	var lim = $("#container").width()-$("#container div:first").width();
	if(!originLocations){
		var originLocations = [];
		$("#container")
		.children("div")
		.each(function(i,item){
			var pos = {
				top:$(this).css("top"),
				left:$(this).css("left")
			};
			originLocations[$(item).attr("id")] = pos;
		});
	}
	var numberOfPages = 0;
    
	$("body")
	.find(".pagination a")
	.each(function(i,item){
		$(item)
			.click(function(e){
				e.preventDefault();
				$.getJSON($(this).attr("href")+"/true",function(data){
					$.each(data,function(key,value){
						var className = value["index"];
						//console.log(className);
						var top = originLocations[className].top;
						var left = originLocations[className].left;
						$("#"+value["index"])
						//.scrambel({limit:lim,animate:true,speed:300})
						.find(".body")
						.html(value["body"])
						.end()
						.find("h1")
						.html(value["title"])
						.end()
						.animate({top:top,left:left},300)
						.show();
					});
				});
			return false;
		});
	});    
	// make new navigation stucture
})(jQuery);
