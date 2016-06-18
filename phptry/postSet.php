<?php
  function postSet() 
    {    
      include 'vars.php';
      $name = $_POST['name'];

      $input = "INSERT INTO sets (name)
                VALUES ('$name')";
      $connection->query($input);
    }
?>
