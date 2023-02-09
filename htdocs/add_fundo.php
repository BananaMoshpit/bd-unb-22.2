<?php session_start(); ?>

<?php
if(!isset($_SESSION['valid'])) {
	header('Location: login.php');
}
?>

<html>
<head>
	<title>Adiconar investimento em fundo de investimentos:</title>
</head>

<body>
<?php
//including the database connection file
include_once("connection.php");

if(isset($_POST['Submit'])) {	
	$nome = $_POST['nome'];
	$classe = $_POST['classe'];
	$valor = $_POST['valor'];
	$data_resgate = $_POST['data_resgate'];
	
		
	// checking empty fields
	if(empty($nome) || empty($classe) || empty($valor)) {
				
		if(empty($nome)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if(empty($classe)) {
			echo "<font color='red'>Quantity field is empty.</font><br/>";
		}
		
		if(empty($valor)) {
			echo "<font color='red'>Price field is empty.</font><br/>";
		}
		
		//link to the previous page
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		//insert data to database	
		$result = mysqli_query($mysqli, "INSERT INTO fundo_investimento(nome_produto, classe, valor, data_resgate) VALUES('$nome','$classe','$valor', '$data_resgate')");
		$id = $mysqli->insert_id;
		$id2 = $_SESSION['id'];
		$resul2 = mysqli_query($mysqli, "INSERT INTO usuario_has_fundo_investimento (fundo_investimento_id_fundo_investimento, usuario_id) VALUES ('$id', '$id2')");
		
		//display success message
		echo "<font color='green'>Fundo de investimento criado com sucesso !!";
		echo "<br/><a href='view.php'>Veja seus investimentos</a>";
	}
}
?>
</body>
</html>
