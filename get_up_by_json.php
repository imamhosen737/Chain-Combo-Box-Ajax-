<?php 
$db = new mysqli('localhost','root','','chain_combo');
$id = $_POST['id'];
$r = $db->query("SELECT * FROM upazilla WHERE district_id=$id");

$up_data = array();
while($up = $r->fetch_assoc()){
	array_push($up_data, $up);
}
echo json_encode($up_data);