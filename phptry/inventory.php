<?php
$servername = "localhost";
$username = "pnpadmin";
$password = "PnProot5806";
$dbname = "inventory_pnp";
$tablename = "item";

header("Content-Type: application/json; charset=utf-8");
$conn = new mysqli($servername, $username, $password, $dbname);


$sql = "SELECT * FROM item";
$result = $conn->query($sql);
$results = array ();

if ($result->num_rows > 0) {
    // output data of each row
  while($row = $result->fetch_assoc()) {
  $results[] = $row;
}
  echo json_encode($results, JSON_PRETTY_PRINT);
}
/*
 else {
echo "ID: " . $row["id"].  " - Name: " . $row["fullname"]. "<br>";
  }
}
 */
$conn->close();
?>
  
