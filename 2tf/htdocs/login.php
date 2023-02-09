<?php session_start(); ?>
<html>
<head>
	<title>Login</title>
</head>

<body>
<a href="index.php">Home</a> <br />
<?php
include("connection.php");

if(isset($_POST['submit'])) {
	$cpf = mysqli_real_escape_string($mysqli, $_POST['cpf']);
	$password = mysqli_real_escape_string($mysqli, $_POST['password']);

	if($cpf == "" || $password == "") {
		echo "Either cpfname or password field is empty.";
		echo "<br/>";
		echo "<a href='login.php'>Go back</a>";
	} else {
		$result = mysqli_query($mysqli, "SELECT * FROM usuario WHERE cpf='$cpf' AND password='$password'")
					or die("Could not execute the select query.");
		
		$row = mysqli_fetch_assoc($result);
		
		if(is_array($row) && !empty($row)) {
			$validuser = $row['cpf'];
			$_SESSION['valid'] = $validuser;
			$_SESSION['nome'] = $row['nome'];
			$_SESSION['id'] = $row['id'];
			$_SESSION['cpf'] = $row['cpf'];
		} else {
			echo "Invalid username or password.";
			echo "<br/>";
			echo "<a href='login.php'>Go back</a>";
		}

		if(isset($_SESSION['valid'])) {
			header('Location: index.php');			
		}
	}
} else {
?>
	<p><font size="+2">Login</font></p>
	<form name="form1" method="post" action="">
		<table width="75%" border="0">
			<tr> 
				<td width="10%">CPF</td>
				<td><input type="text" name="cpf"></td>
			</tr>
			<tr> 
				<td>Senha</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr> 
				<td>&nbsp;</td>
				<td><input type="submit" name="submit" value="Entrar"></td>
			</tr>
		</table>
	</form>
<?php
}
?>
</body>
</html>
