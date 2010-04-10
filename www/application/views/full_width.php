<p class="pagination">
    <a href="/day/view/<?php echo $id-1;?>">&laquo;&nbsp;backwards</a>
    <a href="/day/view/<?php echo $id+1;?>">forwards&nbsp;&raquo;</a>
</p>
<h1><?php echo $date; ?></h1>
<?php foreach($post as $key=>$value){
    echo $value;
} ?>