<?php
  include 'vars.php';

  function postItem()
    {
     $tablename = "item";
     $conn = new mysqli($servername, $username, $password, $dbname);
     $sql = "SELECT * FROM item";
     $result = $conn->query($sql);
     $results = array ();
     header("Content-Type: application/json; charset=utf-8");

     if ($result->num_rows > 0) 
     {
        while($row = $result->fetch_assoc()) 
        {
          $results[] = $row;
        }
       echo json_encode($results, JSON_PRETTY_PRINT);
     }
     $conn->close();
   }
?>
  
