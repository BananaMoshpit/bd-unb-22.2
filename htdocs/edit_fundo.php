<?php session_start(); ?>

<?php
if(!isset($_SESSION['valid'])) {
	header('Location: login.php');
}
?>

<?php
// including the database connection file
include_once("connection.php");

if(isset($_POST['update']))
{	
	$id = $_POST['id'];
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
	} else {	
		//updating the table
		$result = mysqli_query($mysqli, "UPDATE fundo_investimento SET nome_produto='$nome', classe='$classe', valor='$valor', data_resgate='$data_resgate' WHERE id_fundo_investimento=$id");
		
		//redirectig to the display page. In our case, it is view.php
		header("Location: view.php");
	}
}
?>

<?php
//getting id from url
$id = $_GET['id'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM fundo_investimento WHERE id_fundo_investimento=$id");

while($res = mysqli_fetch_array($result))
{
	$nome = $res['nome_produto'];
	$classe = $res['classe'];
	$valor = $res['valor'];
	$data_resgate = $res['data_resgate'];
}
?>

<html>
<head>	
	<title>Editar Fundo de Investimento</title>
</head>

<body>
	<a href="index.php">Página incial</a> | <a href="view.php">Meus investimentos</a>
	<br/><br/>
	
	<form name="form1" method="post" action="edit_fundo.php">
		<table border="0">
			<tr> 
				<td>Nome do investimento</td>
				<td><input type="text" name="nome" value="<?php echo $nome;?>"></td>
			</tr>
			<tr> 
				<td>Classe do investimento</td>
				<td><input type="text" name="classe" value="<?php echo $classe;?>"></td>
			</tr>
			<tr> 
				<td>Valor do investimento</td>
				<td><input type="text" name="valor" value="<?php echo $valor;?>"></td>
			</tr>
			<tr> 
				<td>Data de resgate do investimento</td>
				<td><input type="text" name="data_resgate" value="<?php echo $data_resgate;?>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value=<?php echo $_GET['id'];?>></td>
				<td><input type="submit" name="update" value="Atualizar investimento"></td>
			</tr>
		</table>
	</form>
</body>
</html>
