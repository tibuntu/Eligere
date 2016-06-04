<?php
  $host='localhost';
  $user='pnpadmin';
  $password='PnProot5806';
  $connection = mysql_connect($host,$user,$password);
  $fullname = $_POST['a'];
  $id = $_POST['b'];
  $reg_date = $_POST['c'];


  switch (($_GET["getpost"]))
  {
  case "postItem":
        $dbconnect = @mysql_select_db('inventory_pnp', $connection);
        $query = "INSERT INTO `inventory_pnp`.`item` (`fullname`)
                  VALUES ('$fullname');";
        mysql_query($query, $connection) or die(mysql_error());
        echo $query;
        break;
  case "getItem":
        $sql = "SELECT * FROM item";
        $result = $conn->query($sql);
        $results = array ();
        header("Content-Type: application/json; charset=utf-8");

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
        $results[] = $row;
        }
        echo json_encode($results, JSON_PRETTY_PRINT);
        }
      $conn->close();
  }
       /*
else {
,'$reg_date','$id'
, `id`, `reg_date`
             }
       */
?>
