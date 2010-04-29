<div class="left">
    <h5><?php echo (strlen($comment->author)>0)?"@".$comment->author:""; ?></h5>
    <span><?php echo date("jS M H:i",$comment->created); ?></span>
</div>
<div class="right">   
    <div class="strQ">"</div>
        <p><?php echo $comment->body; ?></p>
    <div class="endQ">"</div>    
</div>
<br/>
