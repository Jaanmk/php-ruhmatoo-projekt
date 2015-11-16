<?php 
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
require_once("../config_global.php");
require_once("user.class.create.php");
session_start();

	$connection = new mysqli($servername, $server_username, $server_password, $dbname);
	
	$User = new User($connection);
	?>