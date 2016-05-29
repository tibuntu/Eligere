<?php
  $host='localhost';
  $user='pnpadmin';
  $password='PnProot5806';
  $dbname='inventory_pnp';
  $imgData = file_get_contents($filename);
  $size = getimagesize($filename);

  mysql_connect($host, "$user", "$password");
  mysql_select_db ("$dbname");
  $sql = sprintf("INSERT INTO images 
   (image_type, image, image_size, image_name)
   VALUES
   ('%s', '%s', '%d', '%s')",
   mysql_real_escape_string($size['mime']),
   mysql_real_escape_string($imgData),
   $size[3],
   mysql_real_escape_string($_FILES['userfile']['name'])
   );
mysql_query($sql);  
?>
