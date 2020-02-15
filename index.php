<?php
	//connect DB
	$conn = mysqli_connect('localhost', 'icsd12207', 'M*3fmzjq', 'car_sales');
	//check connection
	if(!$conn){
		echo 'Connection Error: '. mysqli_connect_error();
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>CarDB</title>
		<meta charset="UTF-8">
		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Car DataBase for ICSD">
		<meta name="keywords" content="car, industry, database, icsd">
		<meta name="author" content="Matthaios Chouliaras">
		<style>
			* {box-sizing: border-box;}
			body {font-family: courier-new;}
			header {background-color: #666;padding: 30px;text-align: center;font-size: 35px;color: white;}
			nav {float: left;width: 30%;height: 300px;background: #ccc;padding: 20px;}
			nav ul {list-style-type: none;padding: 0;}
			article {float: left;padding: 20px;width: 70%;background-color: #f1f1f1;}
			section:after {content: "";display: table;clear: both;}
			footer {background-color: #e5e5e5;padding: 10px;text-align: center;color: #777;}
			@media (max-width: 600px) {nav, article {width: 100%;height: auto;}}
			table {font-family: courier-new;background-color: #f1f1c1;color:#2e2e4d;text-align: center;texborder-collapse: collapse;width: 100%;padding:5px;}
			td, th {border: 1px solid black;text-align: center;padding: 15px;}
			tr:nth-child(odd) {background-color: #fff;}
			tr:nth-child(even) {background-color: #eee;}
		</style>
	</head>
	<body style="color:#aaaaaa;">
		<div style="background-color:#e5e5e5;padding:15px;text-align:center;"><h1>CarDB</h1></div>
		<h3 style="text-align:center;">Buy A Car<h3/>
		<table id="cartable" style="width:75%;text-align:center;"><link rel="stylesheet" href="style.css">
			<thead><th>ID</th><th>ΜΑΡΚΑ</th><th>ΜΕΓΕΘΟΣ</th><th>ΧΡΩΜΑ</th><th>ΤΙΜΗ ΠΩΛΗΣΗΣ</th></thead>
			<tbody>
				<?php
					$results = mysqli_query($conn,"SELECT * FROM autokinhta");
					$cnt = 0;
					while($row = mysqli_fetch_assoc($results)) {
				?>
						<tr><td><?php echo '<a href="'.$row['idautokinhta'].'">'.$row['idautokinhta'].'</a>'?></td><td><?php echo $row['kataskeuasths']?></td><td><?php echo $row['megethos']?></td><td><?php echo $row['xrwma']?></td><td><?php echo $row['timh_pwlhshs']?></td></tr>
				<?php
					}
				?>
			</tbody>
		</table>
		<h5 style="text-align:center;">
			<footer>
				<p title=About style="text-align:center;">Τμήμα <a href="https://www.icsd.aegean.gr/icsd/" target="_blank">Μηχανικών Πληροφοριακών και Επικοινωνιακών Συστημάτων</a> Πανεπιστημείου Αιγαίου.</p>
				<p><a href="mailto:cmatthaios@yahoo.com">Επικονωνία</a><br></p>
			<footer>
		</h5>
	</body>
	<script>
		$(document).ready(function() {
			$('#cartable tr').click(function() {
				//var carprice = $row['timh_pwlhshs'];
				var carid = $(this).find("a").attr("href");
				if(carid) {$(location).attr('href', "agora.php?id="+carid);}
			});
		});
	</script>
</html>