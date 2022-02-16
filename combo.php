<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Combo Chain</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>

<?php 
$db = new mysqli('localhost','root','','chain_combo');
$div = $db->query("SELECT * FROM `division`");
?>
<body>
	<center><h2 class="mt-5">Chain Combo Method By jQuery-Ajax</h2></center><br>
<div class="container">
	<table class="table" class="style">
		<tr>
		<th>DIVISION</th>
		<th>DISTRICT</th>
		<th>UPAZILLA</th>
		</tr>
	</table>
		<table class="table table-bordered">
			<tr>
				<th>
					<select id="division" class="form-control">
						<option>Select Division</option>
						<?php while($dv=$div->fetch_assoc()) { ?>
							<option  value="<?php echo $dv['id']; ?>"><?php echo $dv['name']; ?></option> <?php } ?>
					</select>
				</th>

				<th id="district">
					<select class="form-control" disabled>
						<option>Select District</option>
					</select>
					
				</th>

				<th id="upazilla">
					<select class="form-control" disabled>
						<option>Select Upazilla</option>
					</select>
					
				</th>
			</tr>
		
	   </table>

</div>
	
</body>
 <script type="text/javascript" src="jquery-3.6.0.min.js"></script>

 <script>
 	$(document).ready(function(){
 		$('#division').change(function(){
 			var divID = $(this).val()
 			$.ajax({
 				url:"district.php",
 				type:"post",
 				data:{"id":divID},

 				success:function(data){
 					// console.log(data)
 					$('#district').html(data)
 				}
 			})
 		})

 		// $('table').on('change','#dist',function(){
 		// 	var disID = $(this).val()
 		// 	$.ajax({
 		// 		url:"upazilla.php",
 		// 		type:"post",
 		// 		data:{"id":disID},

 		// 		success:function(data){
 		// 			// console.log(data)
 		// 			$('#upazilla').html(data)
 		// 		}
 		//    })
 	 //    })



 	 		$('table').on('change','#dist',function(){
 			var disID = $(this).val()
 			$.ajax({
 				url:"get_up_by_json.php",
 				type:"post",
 				data:{"id":disID},
 				dataType:"json",
 				success:function(data){
 					//console.log(data)
 				var htup = "<select class='form-control'> <option>Select Upazilla</option>"
 					$.each(data,function(i, up_value){
 						htup+="<option value='"+up_value.id+"'>"+up_value.name+"</option>"
 					});

 					htup+="</select>"

 					$('#upazilla').html(htup)
 				}
 		   })
 	    })
 	 })


 </script>
</html>


<style>
	.style{
		align-content: center;
	}
</style>