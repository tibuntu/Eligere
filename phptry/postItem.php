<?php
  include 'vars.php';

  function postItem() 
    {    
      $fullname = $_POST['a'];
      $id = $_POST['b'];
      $reg_date = $_POST['c'];
      $dbconnect = @mysql_select_db('inventory_pnp', $connection);

      $query = "INSERT INTO `inventory_pnp`.`item` (`fullname`)
                VALUES ('$fullname');";
      mysql_query($query, $connection) or die(mysql_error());
    }
?>
