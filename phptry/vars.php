<?php
  $host='localhost';
  $user='pnpadmin';
  $password='PnProot5806';
  $dbname='inventory_pnp';
  $connection = new mysqli($host, $user, $password, $dbname);
  $method = $_SERVER['REQUEST_METHOD'];
?>
