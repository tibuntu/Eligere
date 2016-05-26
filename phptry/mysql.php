<?php
$servername = "localhost";
$username = "pnpadmin";
$password = "PnProot5806";
$dbname = "inventory_pnp";
#$table = "name";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "CREATE TABLE name (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  fullname VARCHAR(30) NOT NULL,
reg_date TIMESTAMP
)";

if ($conn->query($sql) === TRUE) {
      echo "Table name created successfully";
} else {
      echo "Error creating table: " . $conn->error;
}

$sql = "SELECT * FROM name";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
       while($row = $result->fetch_assoc()) {
       echo "Name: " . $row["*"]. "<br>";
       }
} else {
       echo "0 results";
       }
 $conn->close();
?>
