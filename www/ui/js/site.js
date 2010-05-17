(function($){
	console.log("init"+$("body").find(".pagination").html());
    $("body")
	.find(".pagination")
	.children("a")
	.each(function(){
	//   console.log($(this).text());
		console.log("found");
		/* */
		$(item).click(function(e){
		    e.preventDefault();
		    console.log($(this).text());
		});
		/**/
	})
	.end()
    .find("#container")
    .children("div")
    .each(function(i,item){
        $(item).hover(
            function(){
                $(this).delay(200).animate({backgroundColor:"#ccc"},500);
            },
            function(){
                $(this).delay(200).animate({backgroundColor:"#fff"}, 500);
            })
    })
   .end();

})(jQuery);
