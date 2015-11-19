<h3> Menu </h3>
<ul>
<?php
	if($page_file_name != "index.php") {
	echo "<li><a href='index.php'> Avaleht </a></li>";
	} else {
	echo "<li> Avaleht </li>";
	}
	if($page_file_name != "storage.php") {
	echo "<li><a href='storage.php'> Lisa ladu </a></li>";
	} else {
	echo "<li> Lisa ladu </li>";
	 }
	/*if($page_file_name != "table.php") {
	echo "<li><a href='table.php'> Tabel </a></li>";
	} else {
	echo "<li> Tabel </li>";
	}*/
	if(!isset($_SESSION['logged_in_user_id'])){
		if($page_file_name != "login.php") { 
		echo "<li><a href='login.php'> Log In </a></li>";
		} else { 
		echo "<li>Log In</li>";
		}
		if($page_file_name != "create.php") {
		echo "<li><a href='create.php'> Register </a></li>";
		} else {
		echo "<li>Creation</li>";
		}
}
?>
</ul>