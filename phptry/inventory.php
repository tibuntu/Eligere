<?php
$servername = "localhost";
$username = "pnpadmin";
$password = "PnProot5806";
$dbname = "inventory_pnp";
$tablename = "item";

$conn = new mysqli($servername, $username, $password, $dbname);


$sql = "SELECT * FROM item";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
  while($row = $result->fetch_assoc()) {
  echo "ID: " . $row["id"].  " - Name: " . $row["fullname"]. "<br>";
  }
} else {
  header("Content-Type: application/json");
  echo json_encode($result);
 }
$conn->close();
?>
