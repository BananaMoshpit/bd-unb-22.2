<html>
<head>
	<title>Register</title>
</head>

<body>
<a href="index.php">Home</a> <br />
<?php
include("connection.php");

if(isset($_POST['submit'])) {
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

	if($email == "" || $password == "" || $cpf == "" || $rg == "" || $documento_foto == "" ) {
		echo "Por favor preencha todos campos!";
		echo "<br/>";
		echo "<a href='register.php'>Go back</a>";
	} else {
		mysqli_query($mysqli, "INSERT INTO usuario(nome, cpf, rg, email, nascimento, renda_mensal, cep, endereco, telefone, cod_banco, nmr_agencia, nmr_conta, password, documento_foto) VALUES('$nome', '$cpf', '$rg', '$email','$nascimento', '$renda_mensal', '$cep', '$endereco','$telefone', '$cod_banco', '$nmr_agencia', '$nmr_conta','$password', '$documento_foto')")
			or die("Nao foi possível realizar a insert query.");
			
		echo "Registrado com sucesso !!";
		echo "<br/>";
		echo "<a href='login.php'>Login</a>";
	}
} else {
?>
	<p><font size="+2">Registro de usuario:</font></p>
	<form name="form1" method="post" action="" enctype="multipart/file-data">
		<table width="75%" border="0">
			<tr> 
				<td width="10%">Nome Completo</td>
				<td><input type="text" name="nome"></td>
			</tr>
			<tr> 
				<td>Email</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr> 
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>			
			<tr> 
				<td>CPF</td>
				<td><input type="text" name="cpf"></td>
			</tr>
			<tr> 
				<td>Rg</td>
				<td><input type="text" name="rg"></td>
			</tr>
			<tr> 
				<td width="10%">Nascimento</td>
				<td><input type="text" name="nascimento"></td>
			</tr>
			<tr> 
				<td>Renda Mensal</td>
				<td><input type="text" name="renda_mensal"></td>
			</tr>			
			<tr> 
				<td>CEP</td>
				<td><input type="text" name="cep"></td>
			</tr>
			<tr> 
				<td>Endereço</td>
				<td><input type="text" name="endereco"></td>
			</tr>
			<tr> 
				<td width="10%">Telefone</td>
				<td><input type="text" name="telefone"></td>
			</tr>
			<tr> 
				<td>Código do banco</td>
				<td><input type="text" name="cod_banco"></td>
			</tr>			
			<tr> 
				<td>Número Agência</td>
				<td><input type="text" name="nmr_agencia"></td>
			</tr>
			<tr> 
				<td>Número da conta</td>
				<td><input type="text" name="nmr_conta"></td>
			</tr>
			<tr> 
				<td>Documento oficial (RG, carteira de motorista ou passaporte. Imagem ou PDF)</td>
				<td><input type="file" name="documento_foto" enctype="multipart/form-data"></td>
			</tr>
			<tr> 
				<td>&nbsp;</td>
				<td><input type="submit" name="submit" value="Submit"></td>
			</tr>
		</table>
	</form>


<?php
}
?>
</body>
</html>
