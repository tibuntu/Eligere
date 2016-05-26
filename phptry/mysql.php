<?php
$servername = "localhost";
$username = "pnpadmin";
$password = "PnProot5806";
$dbname = "inventory_pnp";
$table = "name";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM $table";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
       while($row = $result->fetch_assoc()) {
       echo "all: " . $row["*"]. "<br>";
       }
} else {
       echo "0 results";
       }
 $conn->close();
?>
