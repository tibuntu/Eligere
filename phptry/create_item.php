<?php
  $host='localhost';
  $user='pnpadmin';
    $password='PnProot5806';
    
    $connection = mysql_connect($host,$user,$password);
      
      $fullname = $_POST['a'];
      $id = $_POST['b'];
        $reg_date = $_POST['c'];
          
          if(!$connection){
                die('Connection Failed');
                  }
          else{
                $dbconnect = @mysql_select_db('inventory_pnp', $connection);
                    
                    if(!$dbconnect){
                            die('Could not connect to Database');
                                }
                    else{
                            $query = "INSERT INTO `inventory_pnp`.`item` (`fullname`, `id`, `reg_date`)
                                      VALUES ('$fullname', '$id', '$reg_date');";
                                  mysql_query($query, $connection) or die(mysql_error());
                                  
                                  echo 'Successfully added.';
                                        echo $query;
                                      }
                  }
?>
