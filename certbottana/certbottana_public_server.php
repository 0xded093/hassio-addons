<?php

define ('PATH', './.well-known/acme-challenge/');
define ('USERNAME', getenv("USERNAME"));
define ('PASSWORD', getenv("PASSWORD")); 

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
