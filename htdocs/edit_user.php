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
	$cpf = $_POST['cpf'];
	$rg = $_POST['rg'];
	$email = $_POST['email'];
	$nascimento = $_POST['nascimento'];
	$renda_mensal = $_POST['renda_mensal'];
	$cep = $_POST['cep'];
	$endereco = $_POST['endereco'];
	$telefone = $_POST['telefone'];
	$password = $_POST['password'];
	$cod_banco = $_POST['cod_banco'];
	$nmr_agencia = $_POST['nmr_agencia'];
	$nmr_conta = $_POST['nmr_conta'];
	$documento_foto = $_POST['documento_foto'];
	// checking empty fields
	if(empty($nome) || empty($rg) || empty($email)|| empty($nascimento) || empty($renda_mensal)||empty($cep) || empty($endereco) || empty($telefone) || empty($password) ||empty($cod_banco) || empty($nmr_agencia) || empty($nmr_conta)) {
				
		if(empty($nome)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if(empty($rg)) {
			echo "<font color='red'>Quantity fiel d is empty.</font><br/>";
		}
		
		if(empty($nmr_conta)) {
			echo "<font color='red'>Price field is empty.</font><br/>";
		}		
	} else {	
		//updating the table
		$result = mysqli_query($mysqli, "UPDATE usuario SET nome='$nome', cpf='$cpf', rg='$rg', email='$email', nascimento='$nascimento', renda_mensal='$renda_mensal', cep='$cep', endereco='$endereco', telefone='$telefone', password='$password', cod_banco='$cod_banco', nmr_agencia='$nmr_agencia', nmr_conta='$nmr_conta', documento_foto='$documento_foto'  WHERE id=$id");
		
		//redirectig to the display page. In our case, it is view.php
		header("Location: index.php");
	}
}
?>
<?php
//getting id from url
$id = $_SESSION['id'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM usuario WHERE id=$id");

while($res = mysqli_fetch_array($result))
		{
			$id = $res['id'];
			$nome = $res['nome'];
			$cpf = $res['cpf'];
			$rg = $res['rg'];
			$email = $res['email'];
			$nascimento = $res['nascimento'];
			$renda_mensal = $res['renda_mensal'];
			$cep = $res['cep'];
			$endereco = $res['endereco'];
			$telefone = $res['telefone'];
			$password = $res['password'];
			$cod_banco = $res['cod_banco'];
			$nmr_agencia = $res['nmr_agencia'];
			$nmr_conta = $res['nmr_conta'];
			$documento_foto = $res['documento_foto'];

		}
?>
<html>
<head>	
	<title>Edit Data</title>
</head>

<body>
	<a href="index.php">Home</a> | <a href="view.php">View Products</a> | <a href="logout.php">Logout</a>
	<br/><br/>
	<form name="form1" method="post" action="edit_user.php" enctype="multipart/file-data">
		<table width="75%" border="0">
			<tr> 
				<td width="10%">Nome Completo</td>
				<td><input type="text" name="nome" value="<?php echo $nome;?>"></td>
			</tr>
			<tr> 
				<td>Email</td>
				<td><input type="text" name="email" value="<?php echo $email;?>"></td>
			</tr>
			<tr> 
				<td>Password</td>
				<td><input type="password" name="password" value="<?php echo $password;?>"></td>
			</tr>			
			<tr> 
				<td>CPF</td>
				<td><input type="text" name="cpf" value="<?php echo $cpf;?>"></td>
			</tr>
			<tr> 
				<td>Rg</td>
				<td><input type="text" name="rg" value="<?php echo $rg;?>"></td>
			</tr>
			<tr> 
				<td width="10%">Nascimento</td>
				<td><input type="text" name="nascimento" value="<?php echo $nascimento;?>"></td>
			</tr>
			<tr> 
				<td>Renda Mensal</td>
				<td><input type="text" name="renda_mensal" value="<?php echo $renda_mensal;?>"></td>
			</tr>			
			<tr> 
				<td>CEP</td>
				<td><input type="text" name="cep" value="<?php echo $cep;?>"></td>
			</tr>
			<tr> 
				<td>Endereço</td>
				<td><input type="text" name="endereco" value="<?php echo $endereco;?>"></td>
			</tr>
			<tr> 
				<td width="10%">Telefone</td>
				<td><input type="text" name="telefone" value="<?php echo $telefone;?>"></td>
			</tr>
			<tr> 
				<td>Código do banco</td>
				<td><input type="text" name="cod_banco" value="<?php echo $cod_banco;?>"></td>
			</tr>			
			<tr> 
				<td>Número Agência</td>
				<td><input type="text" name="nmr_agencia" value="<?php echo $nmr_agencia;?>"></td>
			</tr>
			<tr> 
				<td>Número da conta</td>
				<td><input type="text" name="nmr_conta" value="<?php echo $nmr_conta;?>"></td>
				<td><input type="hidden" name="id" value=<?php echo $_SESSION['id'];?>></td>
			</tr>
			<tr> 
				<td>Documento oficial (RG, carteira de motorista ou passaporte. Imagem ou PDF)</td>
				<td><input type="file" name="documento_foto" value="<?php echo $documento_foto;?>"></td>
				<td><input type="hidden" name="id" value=<?php echo $_SESSION['id'];?>></td>
			</tr>
			<tr> 
				
				<td>&nbsp;</td>
				<td><input type="submit" name="update" value="Update"></td>
			</tr>
		</table>
	</form>
</body>
</html>
