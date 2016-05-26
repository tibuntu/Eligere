<?php
$servername = "localhost";
$username = "pnpadmin";
$password = "PnProot5806";
$dbname = "inventory_pnp";
$tablename = "item";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

function TableExists($tablename, $db) {
      
      // Get a list of tables contained within the database.
$result = mysql_list_tables($db);
$rcount = mysql_num_rows($result);
     // Check each in list for a match.
    for ($i=0;$i<$rcount;$i++) {
    if (mysql_tablename($result, $i)==$tablename) return true;
} 
 $sql = "CREATE TABLE item (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
fullname VARCHAR(30) NOT NULL,
reg_date TIMESTAMP
)";

if ($conn->query($sql) === TRUE) {
      echo "Table item created successfully";
} else {
      echo "Error creating table: " . $conn->error;
}
 
}

$sql = "SELECT * FROM item";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
       while($row = $result->fetch_assoc()) {
       echo "ID: " . $row["id"].  " - Name: " . $row["fullname"]. "<br>";
       }
} else {
       echo "0 results";
       }
 $conn->close();
?>
