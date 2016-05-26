<?php
  $host='localhost';
  $user='AdminGuy';
    $password='administrator';
    
    $connection = mysql_connect($host,$user,$password);
      
      $usernmae = $_POST['a'];
      $pass = $_POST['b'];
        $info = $_POST['c'];
        $num = $_POST['d'];
          
          if(!$connection){
                die('Connection Failed');
                  }
          else{
                $dbconnect = @mysql_select_db('YoutubeTutorialDB', $connection);
                    
                    if(!$dbconnect){
                            die('Could not connect to Database');
                                }
                    else{
                            $query = "INSERT INTO `YoutubeTutorialDB`.`Users` (`Username`, `Password`, `Info`, `FavoriteNumber`)
                                      VALUES ('$username','$pass','$info','$num');";
                                  mysql_query($query, $connection) or die(mysql_error());
                                  
                                  echo 'Successfully added.';
                                        echo $query;
                                      }
                  }
?>
