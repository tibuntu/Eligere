<?php
  function postItem() 
    {    
      include 'vars.php';
      $name = $_POST['Name'];
      $str = $_POST['Strength'];

      $input = "INSERT INTO item (Fullname, Strength)
                VALUES ('$name', '$str')";
      $connection->query($input);
    }
?>
