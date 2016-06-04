<?php
  include 'vars.php';
  include 'getItem.php';
  include 'postItem.php';
  
  switch (($_GET["getpost"])) 
  {
  case "postItem":
    postItem();
    break;
  case "getItem":
    getItem();
    break;          
  }
?>
