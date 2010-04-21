<p class="pagination">
    <a href="/day/view/<?php echo $id-1;?>">&laquo;&nbsp;backwards</a>
    <a href="/day/view/<?php echo $id+1;?>">forwards&nbsp;&raquo;</a>
</p>
<h1><?php echo $date; ?></h1>
<?php foreach($post as $key=>$value){
    echo $value;
} ?>
<div id="profileControls">
    <div id="twitter-connect-placeholder"></div>
    <div id="twitter-connect-logout"></div>
</div>
<script type="text/javascript">
    twttr.anywhere(function (T) {
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
          $('#twitter-connect-placeholder').append("Logged in as " + profileImageTag + " " + screenName);
          $("#twitter-connect-placeholder").append('<button id="signout" type="button">Sign out of Twitter</button>');
          $("#signout").bind("click", function () {
              twttr.anywhere.signOut();
            });
        } else {
          T("#twitter-connect-placeholder").connectButton();
        };
    });
</script>