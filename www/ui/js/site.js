/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
(function($){
	alert("here");
    $("body")
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
   .end()
	.find(".pagination")
	.children("a",function(i,item){
	   console.log($(this).text());
		/* */
		$(item).click(function(e){
		    e.preventDefault();
		    console.log($(this).text());
		});
		/**/
	});
})(jQuery);
