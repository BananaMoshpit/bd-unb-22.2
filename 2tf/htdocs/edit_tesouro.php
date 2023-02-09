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
	$vencimento = $_POST['vencimento'];
    $juro_mensal = $_POST['juro_mensal'];
	$juro_anual = $_POST['juro_anual'];
	$valor = $_POST['valor_unitario'];
	
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
	} else {	
		//updating the table
		$result = mysqli_query($mysqli, "UPDATE tesouro_direto SET nome='$nome', vencimento='$vencimento', juro_mensal='$juro_mensal', juro_anual='$juro_anual', valor_unitario='$valor' WHERE id_tesouro_direto=$id");
		
		//redirectig to the display page. In our case, it is view.php
		header("Location: view.php");
	}
}
?>

<?php
//getting id from url
$id = $_GET['id'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM tesouro_direto WHERE id_tesouro_direto=$id");

while($res = mysqli_fetch_array($result))
{
	$nome = $res['nome'];
	$vencimento = $res['vencimento'];
    $juro_mensal = $res['juro_mensal'];
	$juro_anual = $res['juro_anual'];
	$valor = $res['valor_unitario'];
}
?>

<html>
<head>	
	<title>Editar Fundo de Investimento</title>
</head>

<body>
	<a href="index.php">Página incial</a> | <a href="view.php">Meus investimentos</a>
	<br/><br/>
	
	<form name="form1" method="post" action="edit_tesouro.php">
		<table border="0">
			<tr> 
				<td>Nome do investimento</td>
				<td><input type="text" name="nome" value="<?php echo $nome;?>"></td>
			</tr>
			<tr> 
				<td>Vencimento do investimento</td>
				<td><input type="text" name="vencimento" value="<?php echo $vencimento;?>"></td>
			</tr>
			<tr> 
				<td>Valor do juro mensal do investimento</td>
				<td><input type="text" name="juro_mensal" value="<?php echo $juro_mensal;?>"></td>
			</tr>
			<tr> 
				<td>Valor do juro anual do investimento</td>
				<td><input type="text" name="juro_anual" value="<?php echo $juro_anual;?>"></td>
			</tr>
            <tr> 
				<td>Valor unitario do investimento</td>
				<td><input type="text" name="valor_unitario" value="<?php echo $valor;?>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value=<?php echo $_GET['id'];?>></td>
				<td><input type="submit" name="update" value="Atualizar investimento"></td>
			</tr>
		</table>
	</form>
</body>
</html>
