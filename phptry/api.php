<?php
  include 'vars.php';
  include 'getItem.php';
  include 'postItem.php';
  include 'postSet.php';
  include 'getSet.php';
  $uri = $_SERVER['QUERY_STRING'];

  if (strpos($uri, 'getItem') !== false) {
    getItem();
   }
  elseif (strpos($uri, 'postItem') !== false) {
    postItem();
   }
  elseif (strpos($uri, 'getSet') !== false) {
    getSet();
   }
  elseif (strpos($uri, 'postSet') !== false) {
    postSet();
   }
?>
