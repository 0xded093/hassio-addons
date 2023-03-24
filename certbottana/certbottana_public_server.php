<?php

define ('PATH', './.well-known/acme-challenge/');
define ('USERNAME', 'certbot');
define ('PASSWORD', '89cb13c2b98127e60787e453ca18d6ce2ab039f45efc41a0cab0c2107693bbc9'); 

$username = $_REQUEST['username'];
$password = hash('sha256', $_REQUEST['password']);
$filename = $_REQUEST['filename'];
$content = $_REQUEST['content'];

if (USERNAME !== $username || PASSWORD !== $password) {
    die ('Please provide valid credentials');
}
elseif (!preg_match('~^[a-zA-Z0-9_-]+$~', $filename)) {
    die ('Invalid filename');
}
elseif (!preg_match('~^[a-zA-Z0-9_\.-]+$~', $content)) {
    die ('Invalid content');
}
else {
    file_put_contents(PATH . $filename, $content);
}
?>
