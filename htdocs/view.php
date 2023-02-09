<?php session_start(); ?>

<?php
if(!isset($_SESSION['valid'])) {
	header('Location: login.php');
}
?>

<?php
//including the database connection file
include_once("connection.php");

//fetching data in descending order (lastest entry first)
$result = mysqli_query($mysqli, "SELECT DISTINCT(fi.id_fundo_investimento),fi.nome_produto,fi.data_resgate,fi.valor,fi.classe FROM fundo_investimento as fi join usuario_has_fundo_investimento as fu WHERE fu.usuario_id=".$_SESSION['id']." ORDER BY fi.id_fundo_investimento ASC;");
$result2 = mysqli_query($mysqli, "SELECT DISTINCT(fi.id_tesouro_direto), fi.nome, fi.vencimento, fi.juro_mensal, fi.juro_anual, fi.valor_unitario, fi.indexador_tes_dir FROM tesouro_direto as fi join usuario_has_tesouro_direto as fu WHERE fu.usuario_id=".$_SESSION['id']." ORDER BY fi.id_tesouro_direto ASC;");
$result3 = mysqli_query($mysqli, "SELECT DISTINCT(fi.id_renda_fixa_variavel),fi.classe,fi.vencimento,fi.taxa_remuneracao,fi.horario_limite,fi.valor,fi.nome_empresa FROM renda_fixa_variavel as fi join usuario_has_renda_fixa_variavel as fu WHERE fu.usuario_id=".$_SESSION['id']." ORDER BY fi.id_renda_fixa_variavel ASC;");

// $result3 = mysqli_query($mysqli, "SELECT * FROM usuario_has_renda_fixa_variavel WHERE usuario_id=".$_SESSION['id']." ORDER BY id DESC");

?>

<html>
<head>
	<title>Nossos produtos</title>
</head>

<body>
	<a href="index.php">Voltar a pagina incial</a><br/><br/><a href="add_tesouro.html">Adiconar investimento de Tesouro Direto</a><br/><br/><a href="add_fundo.html">Adiconar investimento ao fundo de investimento</a><br/><br/><a href="add_renda.html">Adiconar investimento de Renda Fixa e variavel</a><br/><br/>
	<br/><br/>
	<h1>TABELA DE INVESTIMENTOS EM TESOURO DIRETO: </h1>
	<table width='80%' border=0>
		<tr bgcolor='#CCCCCC'>
			<td>Nome do investimento</td>
			<td>Indexador do investimento</td>
			<td>Vencimento do investimento</td>
			<td>Juro mensal do investimento</td>
			<td>Juro anual do investimento</td>
			<td>Valor unitario do investimento</td>
		</tr>
		<?php
		while($res = mysqli_fetch_array($result2)) {		
			echo "<tr>";
			echo "<td>".$res['nome']."</td>";			
			switch ($res['indexador_tes_dir']){
				case 1:
					echo "<td>"."IPCA"."</td>";
					break;
				case 2:
					echo "<td>"."SELIC"."</td>";
					break;
				case 3:
					echo "<td>"."IPG"."</td>";
					break;
			}
			echo "<td>".$res['vencimento']."</td>";
			echo "<td>".$res['juro_mensal']."</td>";
			echo "<td>".$res['juro_anual']."</td>";
			echo "<td>".$res['valor_unitario']."</td>";		
			echo "<td><a href=\"edit_tesouro.php?id=$res[id_tesouro_direto]\">Editar</a> | <a href=\"delete_tesouro.php?id=$res[id_tesouro_direto]\" onClick=\"return confirm('Você tem certeza que deseja deletar este investimento?')\">Deletar</a></td>";		
		}
		?>
	</table>	
	<h1>TABELA DE INVESTIMENTOS EM FUNDO DE INVESTIMENTO: </h1>
	<table width='80%' border=0>
		<tr bgcolor='#CCCCCC'>
			<td>Nome do investimento</td>
			<td>Classe do investimento</td>
			<td>Valor do investimento</td>
			<td>Data para resgate do investimento</td>
		</tr>
		<?php
		while($res = mysqli_fetch_array($result)) {		
			echo "<tr>";
			echo "<td>".$res['nome_produto']."</td>";
			echo "<td>".$res['classe']."</td>";
			echo "<td>".$res['valor']."</td>";
			echo "<td>".$res['data_resgate']."</td>";	
			echo "<td><a href=\"edit_fundo.php?id=$res[id_fundo_investimento]\">Editar</a> | <a href=\"delete_fundo.php?id=$res[id_fundo_investimento]\" onClick=\"return confirm('Você tem certeza que deseja deletar este investimento?')\">Deletar</a></td>";		
		}
		?>
	</table>	
	<h1>TABELA DE INVESTIMENTOS EM RENDA FIXA VARIAVEL: </h1>
	<table width='80%' border=0>
		<tr bgcolor='#CCCCCC'>
			<td>Nome Empresa</td>
			<td>Classe do investimento</td>
			<td>Vencimento do investimento</td>
			<td>Taxa de remuneração</td>
			<td>Horário limite do investimento</td>
			<td>Valor do investimento</td>
		</tr>
		<?php
		while($res = mysqli_fetch_array($result3)) {		
			echo "<tr>";
			echo "<td>".$res['nome_empresa']."</td>";
			echo "<td>".$res['classe']."</td>";
			echo "<td>".$res['vencimento']."</td>";
			echo "<td>".$res['taxa_remuneracao']."</td>";
			echo "<td>".$res['horario_limite']."</td>";
			echo "<td>".$res['valor']."</td>";		
			echo "<td><a href=\"edit_renda.php?id=$res[id_renda_fixa_variavel]\">Editar</a> | <a href=\"delete_renda.php?id=$res[id_renda_fixa_variavel]\" onClick=\"return confirm('Você tem certeza que deseja deletar este investimento?')\">Deletar</a></td>";		
		}
		?>
	</table>	
</body>
</html>
