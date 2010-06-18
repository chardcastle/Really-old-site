<?php
/* 
 * This is a full width template item
 */
$photoUrl = $photo->urls["large"];
if(strlen($photoUrl)<=0){
    $photoUrl = $photo->urls["medium"];
}
if(strlen($photoUrl)<=0){
    $photoUrl = $photo->urls["small"];
}
?>
<div class="photo fullItem">
<p><?php echo $photo->title; ?></p>
<img src="<?php echo  $photoUrl; ?>" alt="Templated"/>
</div>
