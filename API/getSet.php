<?php
  function getSet()
  {
     include 'vars.php';
     $sql = "SELECT * FROM sets";
     $result = $connection->query($sql);
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
     $connection->close();
   }
?>
  
