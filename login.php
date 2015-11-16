<?php 
	$page_title = "LogIn";
	$page_file_name = "login.php";
	if(isset($_SESSION['logged_in_user_id'])){
		header("Location: index.php");
		
	}
?>
<?php require_once("header.php"); ?>

<div id="header" >

	<p style="font-size:30px";>Log In</p>
	<form action="<?php echo $_SERVER["PHP_SELF"]?> " method="post">
	
		<p>Email/Username</p>
		<input name="username" type="text" placeholder="example" value="<?php echo $username;?>" > <?php echo $username_error;?> <br>
		<p>Password</p>
		<input name="password" type="password" placeholder="Password" > <?php echo $pw_error;?>
		<br><br>
		<input name="login" type="submit" value="Log In">
	</form>	


<?php require_once("footer.php"); ?>