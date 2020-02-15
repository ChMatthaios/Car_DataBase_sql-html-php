<!DOCTYPE html>
<html>
	<head>
		<style>
			body {font-family: courier-new;}
		</style>
	</head>
	<body>
		<div style="text-align:center;"><b>
			<?php
				$conn = mysqli_connect('localhost', 'root', '', 'car_sales');
				$carid = htmlspecialchars($_GET["id"]);
				$sql = "SELECT * FROM autokinhta WHERE idautokinhta = ". $carid;
				$result = $conn->query($sql);
				if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()) {
						echo "id: " . $row["idautokinhta"] .", Κατασκευαστής: ". $row["kataskeuasths"] .", Μέγεθος: " . $row["megethos"] .", Χρώμα: ". $row["xrwma"] .", Τιμή Πώλησης: " . $row["timh_pwlhshs"];
						$carprice = $row["timh_pwlhshs"];
					}
				} else {echo "0 results";}
			?>
		</b></div>
		<h4 style="text-align:center;">Υποβάλετε την αγορά σας.</h4>
		<form method="post" action='action.php'>
			<fieldset>
				Username:<br><input type="text" name="usrnm" value=""><br>
				Password:<br><input type="password" name="psswrd" value=""><br><br>
				<br><input type="hidden" name="carid" value="<?php echo $carid; ?>"><br><br>
				<br><input type="hidden" name="carprice" value="<?php echo $carprice; ?>"><br><br>
				<button type="submit" value="submit">Submit</button>
			</fieldset>
		</form>
	</body>
</html>