<?php 
$db= new mysqli('localhost','root','','chain_combo');
$id = $_POST['id'];
$r = $db->query("SELECT * FROM upazilla WHERE district_id=$id");
?>

<select class="form-control">
	<option>Select District</option>
	<?php while($ds = $r->fetch_assoc()){ ?>
		<option value="<?php echo $ds['id'];?>"><?php echo $ds['name']; ?></option>
<?php } ?>
</select>