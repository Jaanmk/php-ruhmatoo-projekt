<?php
	require_once("functions.php");
	$page_title = "Storage Add item";
	$page_file_name = "storageadditem.php";
	$itemCreate = new itemCreate($connection);
?>

<?php
	$merchandisename_error = "";
	$merchandiseprice_error = "";
	$merchandiseweight_error = "";
	$merch_height_error = "";
	$merch_length_error = "";
	$merch_width_error = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		if (empty($_POST["merchandisename"])) {
		$merchandisename_error = "Name is required";
		} else {
		$merchandisename = test_input($_POST["merchandisename"]);
		}
		if (empty($_POST["merchandiseprice"])) {
		$merchandiseprice_error = "Price is required";
		} else {
		$merchandiseprice = test_input($_POST["merchandiseprice"]);
		}
		if (empty($_POST["merchandiseweight"])) {
		$merchandiseweight_error = "Weight is required";
		} else {
		$merchandiseweight = test_input($_POST["merchandiseweight"]);
		}
		if (empty($_POST["merch_height"])) {
		$merch_height_error = "height is required";
		} else {
		$merch_height = test_input($_POST["merch_height"]);
		}
		if (empty($_POST["merch_length"])) {
		$merch_length_error = "Length is required";
		} else {
		$merch_length = test_input($_POST["merch_length"]);
		}
		if (empty($_POST["merch_width"])) {
		$merch_width_error = "Width is required";
		} else {
		$merch_width = test_input($_POST["merch_width"]);
		}
		if ($merch_height_error == "" and $merch_length_error == "" and $merch_width_error == "" and $merchandisename_error == "" and $merchandiseprice_error == "" and $merchandiseweight_error == ""){
			$response = $itemCreate->createItem($merchandiseprice, $merchandiseweight, $merchandisename, $merch_length, $merch_height, $merch_width);
		}else{
		}
	}
?>
<?php require_once("header.php"); ?>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3">
			<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
				<label class="text">Create Storage</label>
				<?php if(isset($response->success)):	 ?>
				
				<p><?=$response->success->message;?></p>
				
				<?php	elseif(isset($response->error)): ?>
				
				<p><?=$response->error->message;?></p>
				
				<?php	endif; ?>
		
		
			<input class="form-control" name="merchandisename" type="text" placeholder="Item name" value="<?php echo $merchandisename;?>" >* <?php echo $merchandisename_error;?> 
			<div class="input-group">
				<span class="input-group-addon">€</span>
				<input class="form-control" name="merchandiseprice" type="number" placeholder="Price"">
				<span class="input-group-addon">.00</span>
			</div><?php echo $merchandiseprice;?>* <?php echo $merchandiseprice_error;?> 
			<br>
			<input class="form-control" name="merchandiseweight" type="number" placeholder="Weight" >* <?php echo $merchandiseweight_error;?>
			<input class="form-control" name="merch_height" type="number" placeholder="Height" >* <?php echo $merch_height_error;?>
			<input class="form-control" name="merch_length" type="number" placeholder="Length" >* <?php echo $merch_length_error;?>
			<input class="form-control" name="merch_width" type="number" placeholder="Width" >* <?php echo $merch_width_error;?>
			<br><br>
			<input name="create" type="submit" value="Create Item"class="btn btn-info btn-block">
			<br><br>
			</form>
		</div>
	</div>
</div>
<?php require_once("footer.php"); ?>