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
    $nome_empresa = $_POST['nome_empresa'];
	$classe = $_POST['classe'];
	$vencimento = $_POST['vencimento'];
    $taxa_remuneracao = $_POST['taxa_remuneracao'];
	$horario_limite = $_POST['horario_limite'];
	$valor = $_POST['valor'];
	
	// checking empty fields
	if(empty($classe) || empty($vencimento) || empty($valor)) {
				
		if(empty($classe)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if(empty($vencimento)) {
			echo "<font color='red'>Quantity field is empty.</font><br/>";
		}
		
		if(empty($valor)) {
			echo "<font color='red'>Price field is empty.</font><br/>";
		}		
	} else {	
		//updating the table
		$result = mysqli_query($mysqli, "UPDATE renda_fixa_variavel SET classe='$classe', vencimento='$vencimento', taxa_remuneracao='$taxa_remuneracao', horario_limite='$horario_limite', valor='$valor' WHERE id_renda_fixa_variavel=$id");
		
		//redirectig to the display page. In our case, it is view.php
		header("Location: view.php");
	}
}
?>

<?php
//getting id from url
$id = $_GET['id'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM renda_fixa_variavel WHERE id_renda_fixa_variavel=$id");

while($res = mysqli_fetch_array($result))
{
	$classe = $res['classe'];
	$vencimento = $res['vencimento'];
    $taxa_remuneracao = $res['taxa_remuneracao'];
	$horario_limite = $res['horario_limite'];
	$valor = $res['valor'];
    $nome_empresa = $res['nome_empresa'];
}
?>

<html>
<head>	
	<title>Editar Investimento em renda fixa e variavel</title>
</head>

<body>
	<a href="index.php">Página incial</a> | <a href="view.php">Meus investimentos</a>
	<br/><br/>
	
	<form name="form1" method="post" action="edit_renda.php">
		<table border="0">
			<tr> 
				<td>Nome da classe do investimento</td>
				<td><input type="text" name="classe" value="<?php echo $classe;?>"></td>
			</tr>
			<tr> 
				<td>Vencimento do investimento</td>
				<td><input type="text" name="vencimento" value="<?php echo $vencimento;?>"></td>
			</tr>
			<tr> 
				<td>Taxa de remuneração do investimento</td>
				<td><input type="text" name="taxa_remuneracao" value="<?php echo $taxa_remuneracao;?>"></td>
			</tr>
			<tr> 
				<td>Horário limite do investimento</td>
				<td><input type="text" name="horario_limite" value="<?php echo $horario_limite;?>"></td>
			</tr>
            <tr> 
				<td>Valor do investimento</td>
				<td><input type="text" name="valor" value="<?php echo $valor;?>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value=<?php echo $_GET['id'];?>></td>
				<td><input type="submit" name="update" value="Atualizar investimento"></td>
			</tr>
		</table>
	</form>
</body>
</html>
