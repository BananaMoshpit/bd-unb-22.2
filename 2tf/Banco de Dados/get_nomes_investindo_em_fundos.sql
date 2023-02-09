CREATE PROCEDURE `get_nomes_investindo_em_fundos` ()
BEGIN
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
END
