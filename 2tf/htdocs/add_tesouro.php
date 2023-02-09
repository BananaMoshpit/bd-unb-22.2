<?php session_start(); ?>

<?php
if(!isset($_SESSION['valid'])) {
	header('Location: login.php');
}
?>

<html>
<head>
	<title>Adiconar investimento em tesouro direto:</title>
</head>

<body>
<?php
//including the database connection file
include_once("connection.php");

if(isset($_POST['Submit'])) {
    $indexador = $_POST['indexador_tes_dir'];
	$nome = $_POST['nome'];
	$vencimento = $_POST['vencimento'];
    $juro_mensal = $_POST['juro_mensal'];
	$juro_anual = $_POST['juro_anual'];
	$valor = $_POST['valor'];
	
		
	// checking empty fields
	if(empty($nome) || empty($vencimento) || empty($valor)) {
				
		if(empty($nome)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if(empty($vencimento)) {
			echo "<font color='red'>Quantity field is empty.</font><br/>";
		}
		
		if(empty($valor)) {
			echo "<font color='red'>Price field is empty.</font><br/>";
		}
		
		//link to the previous page
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		// if all the fields are filled (not empty) 
			
		//insert data to database	
	
        $result = mysqli_query($mysqli, "INSERT INTO tesouro_direto(nome, vencimento, juro_mensal, juro_anual, valor_unitario, indexador_tes_dir) VALUES('$nome','$vencimento','$juro_mensal', '$juro_anual', '$valor', '$indexador')");
		$id = $mysqli->insert_id;
		$id2 = $_SESSION['id'];
		$resul2 = mysqli_query($mysqli, "INSERT INTO usuario_has_tesouro_direto (tesouro_direto_id_tesouro_direto, usuario_id) VALUES ('$id', '$id2')");
		//display success message
		echo "<font color='green'>Investimento em Tesouro Direto criado com sucesso !!";
		echo "<br/><a href='view.php'>Veja seus investimentos</a>";
	}
}
?>
</body>
</html>
