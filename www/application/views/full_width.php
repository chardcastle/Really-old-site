<p class="pagination">
    <?php if($id < $paginationLimit){ ?>
    <a href="/day/view/<?php echo $id+1;?>" class="forwards">forwards&nbsp;&raquo;</a>
    <?php } ?>
    <?php if($id > 2){?>
        <a href="/day/view/<?php echo $id-1;?>">&laquo;&nbsp;backwards</a>
    <?php } ?>
</p>
<h1><?php echo $date; ?></h1>
<?php foreach($post as $key=>$value){
    echo $value;
} ?>
<h2 class="comment-title"></h2>
<div id="profileControls">
    <div id="twitter-connect-placeholder"></div>
    <div id="twitter-connect-logout"></div>
</div>

<div id="comment" style="display:none;">
    <form method="post" action="/comment/create">
        <h4>Submit a comment to my site</h4>
        <input type="hidden" name="author" id="author" value=""/>
        <input type="hidden" name="token" value="<?php echo $token; ?>"/>
        <textarea rows="6" cols="30" name="comment" id="comment"></textarea>
        <button type="submit">Publish</button>
    </form>
</div>
<script type="text/javascript">
    twttr.anywhere(function (T) {
        // Only offer comment feature if js is available.
        $(".comment-title").text("Comment with your Twitter account:");
        // connect with twitter
        var currentUser,
            screenName,
            profileImage,
            profileImageTag;

        if (T.isConnected()) {
          currentUser = T.currentUser;
          screenName = currentUser.data('screen_name');
          profileImage = currentUser.data('profile_image_url');
          profileImageTag = "<img src='" + profileImage + "'/>";
          $('#author').val(screenName);
          $('#twitter-connect-placeholder').append("Logged in as " + profileImageTag + " " + screenName);
          $("#twitter-connect-placeholder").append('<button id="signout" type="button">Sign out of Twitter</button>');
          $("#signout").bind("click", function () {
              twttr.anywhere.signOut();
            });
           $("#comment").show(0);
        } else {
          T("#twitter-connect-placeholder").connectButton();
        };
    });
</script>