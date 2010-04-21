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
	.find("#container")
		.children("div")
		.each(function(){
			$(this).hover(
				function(){
					$(this).delay(200).animate({backgroundColor:"#ccc"}, 500);                    
				},
				function(){
					$(this).delay(200).animate({backgroundColor:"#fff"}, 500);
				}
			).click(function(e){
				if($(this).is(".fullSize")){
					$(this).toggle("explode",null,800).removeClass("fullSize").show(500);
				}else{
					e.preventDefault();
					$(this).stopIfAnimated()
					.css("z-index","4")
					.toggleClass("fullSize",1000)
					.resizeIfNecessary();
				}
				return false;
			});
		})
		.end()
	.end()
	.find("#clearUp")
	.click(function(e){
		e.preventDefault();
		$("#container")
		.children("div")
		.each(function(i,item){
			if($(item).is(":animated")){
				$(item).stop();
			}
			var className = $(item).attr("id");
			var csstop = originLocations[className].top;
			var cssleft = originLocations[className].left;
			$(item).animate({top:csstop,left:cssleft},1000);
		});
		return false;
	})
	.end()
	.find("a#scrambel")
	.click(function(e){
		e.preventDefault();
		$("#container")
			.children("div")
			.each(function(){
				$(this).scrambel({limit:lim,animate:true});
			})
			.end()
		.end()
		return false;
	})
	.end()
	.find(".close")
	.click(function(e){
		e.preventDefault();
		$(this).parent().hide(300);
		return false;
	})
	.end()
	.find("#washAndGo")
	.click(function(e){
		e.preventDefault();
			$("#container")
				.children("div")
				.each(function(){
					if($(this).is(":animated")){
						$(this).stop();
					}
					var className = $(this).attr("id");
					var top = originLocations[className].top;
					var left = originLocations[className].left;

					$(this)
					.scrambel({limit:lim,animate:true})
					.animate({top:top,left:left},1000);
				})
				.end()
			.end();
			return false;
	})
	.end()
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
					.scrambel({limit:lim,animate:true,speed:300})
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
})(jQuery)