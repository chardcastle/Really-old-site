//http://docs.jquery.com/Plugins/Authoring
(function($){
console.log("Running init");
	 $.fn.resize = function(options) {
		 var defaults = {speed:0,animation:{fontSize: '1em'}};
	 
		 var options = $.extend(defaults, options);
	 
		 this.each(function() {
		 console.log("Resize "+options.animation.fontSize);
			$(this).animate(options.animation, options.speed, function() {
				// Animation complete.
			});
		 });	 
		 return this;		 	 
	};
	   
	 $.fn.addControls = function(options) {
		 var defaults = {
		 	limit:3,
		 	values:["large","med","small"]
		 };	 
		 var options = $.extend(defaults, options);
	 	 var x = 0;
		 this.each(function() {
		 	var target = this
		   $.each(options.values,function(i,item){		   
		   		$(target)
		   		.prepend("<a class='sizer' href='#size"+i+"'>"+item+"</a>");
		   		x++;
		   });
		 });	 
		 return this;	 
	   };	   

})(jQuery);

$(function(){

 	var sizes = [
 		{"speed":300,"animation":{"fontSize":"2em"}},
		{"speed":300,"animation":{"fontSize":"1em"}},
		{"speed":300,"animation":{"fontSize":"0.5em"}}
	];
	if($.browser.msie){
		// TURN EVERYTHING OFF FOR IE6
		large.speed = 0;
		med.speed = 0;
		small.speed = 0;
	}
	
	$("body")	
	//.prepend("<div id='state'>med</div>")
	//.end()	
	.addControls()
	.end()
	.find(".sizer")
	.each(function(i, item){
		$(item)
		.click(function(e){console.log("click");
			e.preventDefault();
			var size = parseInt($(this).attr("href").replace("#size",""));
			$("body")
			.find("p")
			.each(function(i,item){		
				console.log("Resize "+size);	
				$(item)
				.resize(sizes[size]);
			})
			.end()
			.find("#state")
			.html(size)
			.end();
			return false;
		})
	})
	.end()
	.find("#dimen")
	.width($("#content").width()/2)
	.height($("#content").height()/2)
	.end()
	.find("#spaceCursor")
	.draggable({ containment: 'parent',
		start:function(event,ui){

			
		},
		stop:function(event,ui){
			var pos = false;
			if(pos = ui.position){
				console.log(pos.top);
				$("#content")
				.css("top",("-"+(pos.top*2))+"px")
				.css("left",("-"+(pos.left*2))+"px");
			}
		}
	 })
	
});
