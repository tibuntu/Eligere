<?php
$headers = apache_request_headers();
$head = $_SERVER['HTTP_X_REQUESTED_WITH'];

echo ($head);

foreach ($headers as $header => $value) {
    echo "$header: $value <br />\n";
}
?>
