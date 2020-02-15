<?php
	$path = 'C:\xampp\htdocs\data.txt';
	if (isset($_POST['usrnm']) && isset($_POST['psswrd'])) {
		$fh = fopen($path,"w+");
		$string = $_POST['usrnm']. PHP_EOL;
		$string .= $_POST['psswrd']. PHP_EOL;
		fwrite($fh,$string); // Write information to the file
		fclose($fh); // Close the file
	}
?>
<!DOCTYPE html>
<html>
	<body>
		<h2>Η Αγορά πραγματοποιήθηκε.</h2>
		<?php 
		/**
		 *	Auto pou thelw na ginetai ousiastika edw einai na travaei to idautokinhta kai timh_pwlhshs
		 *	kai na ta pernaei ston pinaka opws fainetai parakatw.
		 *	dhladh na travaw apo ta prohgoumena get kai post ta dedomena kai na ta pernaw ston pinaka
		 *	synallagh.
		 *  idsynallagh	idxr	idauto
		 */
		
			$conn = mysqli_connect('localhost', 'icsd12207', 'M*3fmzjq', 'car_sales');
			$cnt1 = 5;
			$carid = htmlspecialchars($_POST['carid']);
			$carprice = htmlspecialchars($_POST['carprice']);
			$passwrd = mysqli_real_escape_string($conn, $_POST['psswrd']);
			$usernm = mysqli_real_escape_string($conn, $_POST['usrnm']);

			$sql = "INSERT INTO xrhsths  (`kwdikos`, `poso`, `idautokinhta`, `username`) VALUES('". $passwrd. "', ". $carprice .", ". $carid .", '". $usernm ."')";
			//vazw to antikeimeno ston pinaka synallagh

			if ($conn->query($sql) === TRUE) {
				echo "New user created successfully";
			} else {
				echo "Error: " . $sql . "<br>" . $conn->error;
			}
			
			
			$sql = "INSERT INTO synallagh (`username`, `idauto`) VALUES('". $usernm ."' , " . $carid . ")";
			//aukshsh counters gia thn dhmiourgeia tou id
			$cnt1++;

			if ($conn->query($sql) === TRUE) {
				echo "New synallagi created successfully";
			} else {
				echo "Error: " . $sql . "<br>" . $conn->error;
			}


			$conn->close();
		?>
	</body>
</html>