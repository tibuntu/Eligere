<?php
  function postItem() 
    {    
      include 'vars.php';
      $fullname = $_POST['a'];
      $id = $_POST['b'];
      $reg_date = $_POST['c'];

      $query = "INSERT INTO `inventory_pnp`.`item` (`fullname`)
                VALUES ('$fullname');";
      mysqli_query($query, $connection) or die(mysqli_error());
    }
?>
