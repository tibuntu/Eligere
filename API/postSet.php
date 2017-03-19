<?php
  function postSet() 
    {    
      include 'vars.php';
      $name = $_POST['name'];
      $keywords = $_POST['keywords'];
      $num = $_POST['num'];

      $input = "INSERT INTO sets (Num, name, Keywords)
                VALUES ('$num', '$name', '$keywords')";
      $connection->query($input);
    }
?>
