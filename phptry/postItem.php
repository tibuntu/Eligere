<?php
  function postItem() 
    {    
      include 'vars.php';
      $name = $_POST['Name'];
      $str = $_POST['Strength'];
      $img = $_POST['Image'];

      $input = "INSERT INTO item (Fullname, Strength, Image)
                VALUES ('$name', '$str', '$img')";
      $connection->query($input);
    }
?>
