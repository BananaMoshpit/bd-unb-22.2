
DROP VIEW IF EXISTS todos_investidores;
CREATE VIEW todos_investidores AS
select
  usuario.nome, usuario.renda_mensal,
  `tesouro_direto`.`id_tesouro_direto` ,  `tesouro_direto`.nome as `tesouro_direto_nome`,
  `tesouro_direto`.`valor_unitario` as `tesouro_valor`,
  `renda_fixa_variavel`.`id_renda_fixa_variavel` , `renda_fixa_variavel`.nome_empresa,
  `renda_fixa_variavel`.`valor` as `fixa_variavel_valor`,
  fundo_investimento.id_fundo_investimento , fundo_investimento.nome_produto,
  fundo_investimento.valor as fundo_valor,
(`tesouro_direto`.`valor_unitario` +
  `renda_fixa_variavel`.`valor` + fundo_investimento.valor ) / usuario.renda_mensal
AS pctg_renda_por_invest_total
from usuario_has_tesouro_direto 
right join  usuario
ON usuario.id = usuario_has_tesouro_direto.usuario_id
left JOIN tesouro_direto
ON tesouro_direto.id_tesouro_direto = 
usuario_has_tesouro_direto.tesouro_direto_id_tesouro_direto
join usuario_has_renda_fixa_variavel 
on usuario.id = usuario_has_renda_fixa_variavel.usuario_id
left JOIN renda_fixa_variavel
ON renda_fixa_variavel.id_renda_fixa_variavel = 
usuario_has_renda_fixa_variavel.renda_fixa_variavel_id_renda_fixa_variavel
left JOIN usuario_has_fundo_investimento 
ON usuario.id = usuario_has_fundo_investimento.usuario_id
left JOIN fundo_investimento
ON fundo_investimento.id_fundo_investimento = 
usuario_has_fundo_investimento.fundo_investimento_id_fundo_investimento
ORDER BY pctg_renda_por_invest_total DESC;


DROP VIEW if exists nomes_investindo_tesouro;
CREATE VIEW nomes_investindo_tesouro AS
select
  usuario.nome, usuario.renda_mensal,
  `tesouro_direto`.`id_tesouro_direto` ,
  `tesouro_direto`.`nome` as `tesouro_direto_nome` ,
  `tesouro_direto`.`vencimento` ,
  `tesouro_direto`.`juro_mensal` ,
  `tesouro_direto`.`juro_anual` ,
  `tesouro_direto`.`valor_unitario` ,
  `tesouro_direto`.`indexador_tes_dir` 
from usuario_has_tesouro_direto 
right join  usuario
ON usuario.id = usuario_has_tesouro_direto.usuario_id
left JOIN tesouro_direto
ON tesouro_direto.id_tesouro_direto = 
usuario_has_tesouro_direto.tesouro_direto_id_tesouro_direto;

DROP VIEW IF EXISTS nomes_investindo_fixa_var ;
CREATE VIEW nomes_investindo_fixa_var AS
select
  usuario.nome, usuario.renda_mensal,
  `renda_fixa_variavel`.`id_renda_fixa_variavel` ,
  `renda_fixa_variavel`.`classe` ,
  `renda_fixa_variavel`.`vencimento` ,
  `renda_fixa_variavel`.`taxa_remuneracao` ,
  `renda_fixa_variavel`.`horario_limite` ,
  `renda_fixa_variavel`.`valor` ,
  `renda_fixa_variavel`.`nome_empresa` 
from usuario_has_renda_fixa_variavel 
right join  usuario
ON usuario.id = usuario_has_renda_fixa_variavel.usuario_id
left JOIN renda_fixa_variavel
ON renda_fixa_variavel.id_renda_fixa_variavel = 
usuario_has_renda_fixa_variavel.renda_fixa_variavel_id_renda_fixa_variavel;

DROP VIEW IF EXISTS nomes_investindo_renda;
CREATE VIEW nomes_investindo_renda AS
select
  usuario.nome, usuario.renda_mensal,
  fundo_investimento.id_fundo_investimento,
  fundo_investimento.nome_produto,
  fundo_investimento.data_resgate,
  fundo_investimento.valor,
  fundo_investimento.classe
from usuario_has_fundo_investimento 
right join  usuario
ON usuario.id = usuario_has_fundo_investimento.usuario_id
left JOIN fundo_investimento
ON fundo_investimento.id_fundo_investimento = 
usuario_has_fundo_investimento.fundo_investimento_id_fundo_investimento;


-- PROCEDIMENTO PRA VER CLIENTES COM INVESTIMENTO PERCENTUAL RENDA_MENSAL/INVESGTIMENTOS TOTAIS ACIMA DA MÉDIA
DELIMITER $$
DROP PROCEDURE IF EXISTS `top_investidores_percentuais` ;
CREATE PROCEDURE IF NOT EXISTS `top_investidores_percentuais` ()
BEGIN
CREATE TABLE IF NOT EXISTS top_investidores_percentuais AS
select
  usuario.nome, usuario.renda_mensal,
  `tesouro_direto`.`id_tesouro_direto` ,
  `tesouro_direto`.`valor_unitario` as `tesouro_valor`,
  `renda_fixa_variavel`.`id_renda_fixa_variavel` ,
  `renda_fixa_variavel`.`valor` as `fixa_variavel_valor`,
  fundo_investimento.id_fundo_investimento ,
  fundo_investimento.valor as fundo_valor,
((`tesouro_direto`.`valor_unitario` +
  `renda_fixa_variavel`.`valor` + fundo_investimento.valor ) / usuario.renda_mensal) * 100
AS pctg_renda_por_invest_total
from usuario_has_tesouro_direto 
right join  usuario
ON usuario.id = usuario_has_tesouro_direto.usuario_id
left JOIN tesouro_direto
ON tesouro_direto.id_tesouro_direto = 
usuario_has_tesouro_direto.tesouro_direto_id_tesouro_direto
join usuario_has_renda_fixa_variavel 
on usuario.id = usuario_has_renda_fixa_variavel.usuario_id
left JOIN renda_fixa_variavel
ON renda_fixa_variavel.id_renda_fixa_variavel = 
usuario_has_renda_fixa_variavel.renda_fixa_variavel_id_renda_fixa_variavel
left JOIN usuario_has_fundo_investimento 
ON usuario.id = usuario_has_fundo_investimento.usuario_id
left JOIN fundo_investimento
ON fundo_investimento.id_fundo_investimento = 
usuario_has_fundo_investimento.fundo_investimento_id_fundo_investimento
ORDER BY pctg_renda_por_invest_total DESC;

select * FROM top_investidores_percentuais where pctg_renda_por_invest_total > (SELECT AVG(pctg_renda_por_invest_total) FROM top_investidores_percentuais);
END $$
