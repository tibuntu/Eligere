<?php
$servername = "localhost";
$username = "pnpadmin";
$password = "PnProot5806";
$database = "inventory_pnp";

// Create connection
$conn = new mysqli($servername, $database, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>
