<?php
  function postItem() 
    {    
      include 'vars.php';
      $fullname = $_POST['a'];
      $id = $_POST['b'];
      $reg_date = $_POST['c'];

      $input = "INSERT INTO item (fullname)
                VALUES ('$fullname')";
      $connection->query($input);
    }
?>
