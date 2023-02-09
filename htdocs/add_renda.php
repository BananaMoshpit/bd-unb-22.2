<?php session_start(); ?>

<?php
if(!isset($_SESSION['valid'])) {
	header('Location: login.php');
}
?>

<html>
<head>
	<title>Adiconar investimento em Renda fixa e variavel:</title>
</head>

<body>
<?php
//including the database connection file
include_once("connection.php");

if(isset($_POST['Submit'])) {	
	$classe = $_POST['classe'];
	$vencimento = $_POST['vencimento'];
	$taxa_remuneracao = $_POST['taxa_remuneracao'];
    $horario_limite = $_POST['horario_limite'];
    $valor = $_POST['valor'];
    $nome_empresa = $_POST['nome_empresa'];
	
		
	// checking empty fields
	if(empty($vencimento) || empty($classe) || empty($valor)) {
				
		if(empty($vencimento)) {
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

		$result = mysqli_query($mysqli, "INSERT INTO renda_fixa_variavel(classe, vencimento, taxa_remuneracao, horario_limite, valor, nome_empresa) VALUES('$classe','$vencimento', '$taxa_remuneracao', '$horario_limite', '$valor', '$nome_empresa')");
		$id = $mysqli->insert_id;
		$id2 = $_SESSION['id'];
		$resul2 = mysqli_query($mysqli, "INSERT INTO usuario_has_renda_fixa_variavel (renda_fixa_variavel_id_renda_fixa_variavel, usuario_id) VALUES ('$id', '$id2')");
		
		//display success message
		echo "<font color='green'>Fundo de investimento criado com sucesso !!";
		echo "<br/><a href='view.php'>Veja seus investimentos</a>";
	}
}
?>
</body>
</html>
