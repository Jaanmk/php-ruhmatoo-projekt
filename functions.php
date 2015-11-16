<?php 
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
require_once("../config_global.php");
require_once("user.class.create.php");
require_once("user.class.login.php");
session_start();

	$connection = new mysqli($servername, $server_username, $server_password, $dbname);
	
	$userCreate = new userCreate($connection);
	$userLogin = new userLogin($connection);
	?>