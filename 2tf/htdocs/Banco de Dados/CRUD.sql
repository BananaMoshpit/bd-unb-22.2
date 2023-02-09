USE mydb;
-------------------------------------------------------------------------------
-- mudando alguns valores numéricos para DOUBLE
ALTER TABLE `mydb`.`fundo_investimento` 
CHANGE COLUMN `valor` `valor` DOUBLE NULL DEFAULT NULL ;

ALTER TABLE `mydb`.`renda_fixa_variavel` 
CHANGE COLUMN `valor` `valor` DOUBLE NULL DEFAULT NULL ;

ALTER TABLE `mydb`.`tesouro_direto` 
CHANGE COLUMN `valor_unitario` `valor_unitario` DOUBLE NULL DEFAULT NULL ;

ALTER TABLE `mydb`.`usuario` 
CHANGE COLUMN `renda_mensal` `renda_mensal` DOUBLE NULL DEFAULT NULL ;
-- valores de renda e aplicação alterados.
------------------------------------------------------------------------------





-------------------------------------------------------------------------------
-- INSERINDO 5 USUARIOS
INSERT INTO usuario(`id`,
`nome`,
`cpf`,
`rg`,
`email`,
`nascimento`,
`renda_mensal`,
`cep`,
`endereco`,
`telefone`,
`cod_banco`,
`nmr_agencia`,
`nmr_conta`,
`password`)
VALUES
(0,
 "Sophia Vitória Daniela Fogaça",
 "041.765.818-40",
 "17.928.563-4",
 "sophia_vitoria_fogaca@yaooll.com",
 "23/01/1961",
 10580.61,
 "49007-250",
 "Rua A numero 861, Zona de Expansão (Areia Branca)- Aracaju, SE.",
 "(79) 98837-0030",
 "399",
 "6981",
 "0773690-8",
 "0");

INSERT INTO usuario(`id`,
`nome`,
`cpf`,
`rg`,
`email`,
`nascimento`,
`renda_mensal`,
`cep`,
`endereco`,
`telefone`,
`cod_banco`,
`nmr_agencia`,
`nmr_conta`,
`password`)
VALUES
(1,
 "Rafael Juan Kevin Freitas",
 "209.343.599-38",
 "10.907.021-5",
 "rafael_freitas@casabellavidros.com.br",
 "03/01/1980",
 36463.4,
 "84053-550",
 "Rua Ourinhos numero 897, Nova Rússia- Ponta Grossa, PR.",
 "(42) 98489-0156",
 "652",
 "8610",
 "14545-3",
 "1");

INSERT INTO usuario(`id`,
`nome`,
`cpf`,
`rg`,
`email`,
`nascimento`,
`renda_mensal`,
`cep`,
`endereco`,
`telefone`,
`cod_banco`,
`nmr_agencia`,
`nmr_conta`,
`password`)
VALUES
(2,
 "Maitê Jaqueline Teixeira",
 "234.940.257-62",
 "47.420.526-5",
 "maite_jaqueline_teixeira@dhl.com",
 "18/01/2000",
 2618.89,
 "22763-587",
 "Rua H numero 505, Cidade de Deus- Rio de Janeiro, RJ.",
 "(21) 98345-2619",
 "341",
 "6380",
 "0545141-8",
 "2");

INSERT INTO usuario(`id`,
`nome`,
`cpf`,
`rg`,
`email`,
`nascimento`,
`renda_mensal`,
`cep`,
`endereco`,
`telefone`,
`cod_banco`,
`nmr_agencia`,
`nmr_conta`,
`password`)
VALUES
(3,
 "Fátima Lara Barros",
 "477.724.966-21",
 "15.883.118-4",
 "fatima.lara.barros@technew.ind.br",
 "05/02/1970",
 22606.98,
 "68909-519",
 "Alameda Setima numero 256, Boné Azul- Macapá, AP.",
 "(96) 98480-1593",
 "237 ",
 "2558",
 "0768006-6",
 "3");

INSERT INTO usuario(`id`,
`nome`,
`cpf`,
`rg`,
`email`,
`nascimento`,
`renda_mensal`,
`cep`,
`endereco`,
`telefone`,
`cod_banco`,
`nmr_agencia`,
`nmr_conta`,
`password`)
VALUES
(4,
 "Lavínia Lúcia Sara Barbosa",
 "799.007.021-90",
 "17.755.328-5",
 "lavinialuciabarbosa@fileno.com.br",
 "23/01/1947",
 49435.87,
 "88316-620",
 "Rua José Carlos da Silva numero 937, Itaipava- Itajaí, SC.",
 "(47) 98484-8995",
 "001",
 "1803",
 "90433-3",
 "4");
-- usuarios inseridos
-------------------------------------------------------------------------------








-------------------------------------------------------------------------------
-- código dos indexadore: IPCA-1, SELIC-2, IPG-3
-- INSERINDO 5 `tesouro_direto`
-- https://www.tesourodireto.com.br/titulos/precos-e-taxas.htm#0


-- Tesouro Prefixado 2026
INSERT INTO `mydb`.`tesouro_direto`
(`id_tesouro_direto`,
`nome`,
`vencimento`,
`juro_mensal`,
`juro_anual`,
`valor_unitario`,
`indexador_tes_dir`)
VALUES
(0,
"Tesouro Prefixado 2026",
"2026-01-01",
"1,0296%",
"13,08%",
701.09,
3);

-- Tesouro Selic 2026
INSERT INTO `mydb`.`tesouro_direto`
(`id_tesouro_direto`,
`nome`,
`vencimento`,
`juro_mensal`,
`juro_anual`,
`valor_unitario`,
`indexador_tes_dir`)
VALUES
(1,
"Tesouro Selic 2026",
"2026-03-01",
"0,0083%",
"0,10%",
12771.53,
2);

-- Tesouro Selic 2029
INSERT INTO `mydb`.`tesouro_direto`
(`id_tesouro_direto`,
`nome`,
`vencimento`,
`juro_mensal`,
`juro_anual`,
`valor_unitario`,
`indexador_tes_dir`)
VALUES
(2,
"Tesouro Selic 2029",
"2029-03-01",
"0,0150%",
"0,18%",
12673.79,
2);

-- Tesouro IPCA+ 2029
INSERT INTO `mydb`.`tesouro_direto`
(`id_tesouro_direto`,
`nome`,
`vencimento`,
`juro_mensal`,
`juro_anual`,
`valor_unitario`,
`indexador_tes_dir`)
VALUES
(3,
"Tesouro IPCA+ 2029",
"2029-05-15",
"0,5049%",
"6,23%",
2764.67,
1);

-- Tesouro Renda+ Aposentadoria Extra 2030
INSERT INTO `mydb`.`tesouro_direto`
(`id_tesouro_direto`,
`nome`,
`vencimento`,
`juro_mensal`,
`juro_anual`,
`valor_unitario`,
`indexador_tes_dir`)
VALUES
(4,
"Tesouro Renda+ Aposentadoria Extra 2030",
"2049-12-15",
"0,5183%",
"6,40%",
1510.08,
1);

-- `tesouro_direto` inseridos
-------------------------------------------------------------------------------




-------------------------------------------------------------------------------
-- relacionando `usuario` com  `tesouro_direto` (inserindo em `usuario_has_tesouro_direto`)

INSERT INTO `mydb`.`usuario_has_tesouro_direto`
(`usuario_id`,
`tesouro_direto_id_tesouro_direto`)
VALUES
(0,
4);

INSERT INTO `mydb`.`usuario_has_tesouro_direto`
(`usuario_id`,
`tesouro_direto_id_tesouro_direto`)
VALUES
(1,
3);

INSERT INTO `mydb`.`usuario_has_tesouro_direto`
(`usuario_id`,
`tesouro_direto_id_tesouro_direto`)
VALUES
(2,
2);

INSERT INTO `mydb`.`usuario_has_tesouro_direto`
(`usuario_id`,
`tesouro_direto_id_tesouro_direto`)
VALUES
(3,
1);

INSERT INTO `mydb`.`usuario_has_tesouro_direto`
(`usuario_id`,
`tesouro_direto_id_tesouro_direto`)
VALUES
(4,
0);


-- `usuario_has_tesouro_direto` inseridos
-------------------------------------------------------------------------------







-------------------------------------------------------------------------------
-- INSERINDO 5 `renda_fixa_variavel`
INSERT INTO `mydb`.`renda_fixa_variavel`
(`id_renda_fixa_variavel`,
`classe`,
`vencimento`,
`taxa_remuneracao`,
`horario_limite`,
`valor`,
`nome_empresa`)
VALUES
(0,
"FIIs (Fundos de Investimento Imobiliário)",
"24 meses",
"variável",
"13h:00",
"4000.99",
"Paulo Octavio ");

-- https://www.orama.com.br/renda-variavel-acoes-opcoes-oferta-publica-futuro-aluguel/
INSERT INTO `mydb`.`renda_fixa_variavel`
(`id_renda_fixa_variavel`,
`classe`,
`vencimento`,
`taxa_remuneracao`,
`horario_limite`,
`valor`,
`nome_empresa`)
VALUES
(1,
"ETFs (Exchange Traded Funds)",
"6 meses",
"variável",
"13:00",
"345.90",
"Órama investimentos");



INSERT INTO `mydb`.`renda_fixa_variavel`
(`id_renda_fixa_variavel`,
`classe`,
`vencimento`,
`taxa_remuneracao`,
`horario_limite`,
`valor`,
`nome_empresa`)
VALUES
(2,
"Debêntures",
"6 meses",
"0.05% valor de investimento",
"14:00",
"2500",
"(Sociedade Anônima Emissora)"); -- https://www.xpi.com.br/produtos/renda-fixa/

-- https://www.xpi.com.br/produtos/renda-fixa/
INSERT INTO `mydb`.`renda_fixa_variavel`
(`id_renda_fixa_variavel`,
`classe`,
`vencimento`,
`taxa_remuneracao`,
`horario_limite`,
`valor`,
`nome_empresa`)
VALUES
(3,
"Letra Financeira",
"60 meses",
"2% CDI + spread ",
"15:00",
"50000",
"Banco do Brasil");

INSERT INTO `mydb`.`renda_fixa_variavel`
(`id_renda_fixa_variavel`,
`classe`,
`vencimento`,
`taxa_remuneracao`,
`horario_limite`,
`valor`,
`nome_empresa`)
VALUES
(4,
"DPGEs (Depósito a Prazo com Garantia Especial do FGC)",
"12 meses",
"2% CDI",
"17:00",
"500",
"Visa Inc.");

-- `renda_fixa_variavel` inseridos
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- relacionando `usuario` com  `renda_fixa_variavel` (inserindo em `usuario_has_renda_fixa_variavel`)

INSERT INTO `mydb`.`usuario_has_renda_fixa_variavel`
(`usuario_id`,
`renda_fixa_variavel_id_renda_fixa_variavel`)
VALUES
(0,
  2 );

INSERT INTO `mydb`.`usuario_has_renda_fixa_variavel`
(`usuario_id`,
`renda_fixa_variavel_id_renda_fixa_variavel`)
VALUES
(1,
  3 );

INSERT INTO `mydb`.`usuario_has_renda_fixa_variavel`
(`usuario_id`,
`renda_fixa_variavel_id_renda_fixa_variavel`)
VALUES
(2,
  4 );

INSERT INTO `mydb`.`usuario_has_renda_fixa_variavel`
(`usuario_id`,
`renda_fixa_variavel_id_renda_fixa_variavel`)
VALUES
(3,
  0 );

INSERT INTO `mydb`.`usuario_has_renda_fixa_variavel`
(`usuario_id`,
`renda_fixa_variavel_id_renda_fixa_variavel`)
VALUES
(4,
  1 );


-- `usuario_has_renda_fixa_variavel` inseridos
-------------------------------------------------------------------------------







-------------------------------------------------------------------------------
-- INSERINDO 5 `fundo_investimento`


-- https://www.xpi.com.br/investimentos/fundos-de-investimento/lista/#/detalhes/26cc40f4-f74b-4648-91af-8069a4428d36
INSERT INTO `mydb`.`fundo_investimento`
(`id_fundo_investimento`,
`nome_produto`,
`data_resgate`,
`valor`,
`classe`)
VALUES(
0,
"Absolute Pace Long Biased Advisory FIC FIA",
"D+30 (Dias Corridos)",
500,
"Renda Variável");


https://www2.orama.com.br/investimentos/fundos-de-investimento/Vinland-Macro-FIC-FIM
INSERT INTO `mydb`.`fundo_investimento`
(`id_fundo_investimento`,
`nome_produto`,
`data_resgate`,
`valor`,
`classe`)
VALUES(
1,
"Vinland Macro FIC FIM ",
"D+30 (dias corridos)",
1000.00,
"Multimercado");

-- https://www2.orama.com.br/investimentos/fundos-de-investimento/novus-capital-exclusive-fic-firf-lp
INSERT INTO `mydb`.`fundo_investimento`
(`id_fundo_investimento`,
`nome_produto`,
`data_resgate`,
`valor`,
`classe`)
VALUES(
2,
"Novus Capital Exclusive FIC FIRF LP",
"D+3 (dias úteis)",
1000,
"Renda Fixa");

-- https://www2.orama.com.br/investimentos/fundos-de-investimento/reach-total-return-fic-fia
INSERT INTO `mydb`.`fundo_investimento`
(`id_fundo_investimento`,
`nome_produto`,
`data_resgate`,
`valor`,
`classe`)
VALUES(
3,
"Reach Total Return FIC FIA",
"D+14 (dias corridos)",
100,
"Ações");

-- https://www2.orama.com.br/investimentos/fundos-de-investimento/absolute-vertex-ii-fic-fim
INSERT INTO `mydb`.`fundo_investimento`
(`id_fundo_investimento`,
`nome_produto`,
`data_resgate`,
`valor`,
`classe`)
VALUES(
4,
"Absolute Vertex II FIC FIM ",
"D+29 (dias corridos)",
5000,
"Multimercado"
);

-- `fundo_investimento` inseridos
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- relacionando `usuario` com  `fundo_investimento` (inserindo em `usuario_has_fundo_investimento`)

INSERT INTO `mydb`.`usuario_has_fundo_investimento`
(`usuario_id`,
`fundo_investimento_id_fundo_investimento`)
VALUES
(0,
1);

INSERT INTO `mydb`.`usuario_has_fundo_investimento`
(`usuario_id`,
`fundo_investimento_id_fundo_investimento`)
VALUES
(1,
2);

INSERT INTO `mydb`.`usuario_has_fundo_investimento`
(`usuario_id`,
`fundo_investimento_id_fundo_investimento`)
VALUES
(2,
3);

INSERT INTO `mydb`.`usuario_has_fundo_investimento`
(`usuario_id`,
`fundo_investimento_id_fundo_investimento`)
VALUES
(3,
4);

INSERT INTO `mydb`.`usuario_has_fundo_investimento`
(`usuario_id`,
`fundo_investimento_id_fundo_investimento`)
VALUES
(4,
0);

-- `usuario_has_fundo_investimento` inseridos
-------------------------------------------------------------------------------

