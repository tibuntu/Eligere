<?php
  include 'vars.php';
  include 'function.php';
  #include 'getItem.php';
  #include 'postItem.php';
  #include 'postSet.php';
  #include 'getSet.php';
  #include '404.php'; // Does not work right now
  $uri = $_SERVER['QUERY_STRING'];
  $script = $_SERVER['SCRIPT_NAME'];
  
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
  elseif (strpos($script, 'api.php') !== false) {
    show404();
   }
?>
