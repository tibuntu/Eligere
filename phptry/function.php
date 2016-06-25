<?php
   include 'vars.php';
   function postSet()
     {
       $name = $_POST['name'];
       $keywords = $_POST['keywords'];
       $num = $_POST['num'];

       $input = "INSERT INTO sets (Num, name, Keywords)
                 VALUES ('$num', '$name', '$keywords')";
       $connection->query($input);
     }
   function postItem()
     {
       $name = $_POST['Name'];
       $str = $_POST['Strength'];

       $input = "INSERT INTO item (Fullname, Strength)
                 VALUES ('$name', '$str')";
       $connection->query($input);
     }
   function getItem()
   {
      $sql = "SELECT Fullname, Strength, Image FROM item";
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
   function getSet()
   {
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
