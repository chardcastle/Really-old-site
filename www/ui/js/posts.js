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

$(function(){
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
		console.log("OriginLocations was not set");
	}
	var numberOfPages = 0;
	$("body")
	.find("#container")
		.children("div")
		.each(function(){
			$(this).hover(
				function(){
					$(this).delay(200).animate({backgroundColor:"#ccc"}, 800);
				},
				function(){
					$(this).delay(200).animate({backgroundColor:"#fff"}, 800);
				}
			).click(function(e){
				if($(this).is(".fullSize")){
					$(this).toggle("explode",null,800);
				}else{
					e.preventDefault();
					$(this).stopIfAnimated()
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
	})
	.end()
	.find(".close")
	.click(function(e){
		e.preventDefault();		
		$(this).parent().hide(300);
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
	.find("#navigation a")
	.each(function(i,item){		
		numberOfPages++;
		var ele = $("<li><a href=''></a></li>")
		.find("a")
		.text(numberOfPages)
		.click(function(e){			
			e.preventDefault();
			var req = (($(this).text()-1)*9);
			$.getJSON("/index.php/Posts/posts_json/P"+req,function(data){						
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
		$("#jsnav").append(ele);
	});
	// make new navigation stucture
	
});
