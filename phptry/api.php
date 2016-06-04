<?php
  include 'vars.php';
  include 'getItem.php';
  include 'postItem.php';
  
  switch ($method) 
  {
  case "POST":
    postItem();
    break;
  case "GET":
    getItem();
    break;          
  }
?>
