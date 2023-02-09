-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31-Jan-2023 às 16:28
-- Versão do servidor: 8.0.32
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mydb`
--
drop database if exists mydb;
create database mydb;
use mydb;
-- --------------------------------------------------------

--
-- Estrutura da tabela `fundo_investimento`
--

CREATE TABLE `fundo_investimento` (
  `id_fundo_investimento` int NOT NULL,
  `nome_produto` varchar(450) DEFAULT NULL,
  `data_resgate` varchar(45) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `classe` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `renda_fixa_variavel`
--

CREATE TABLE `renda_fixa_variavel` (
  `id_renda_fixa_variavel` int NOT NULL,
  `classe` varchar(45) DEFAULT NULL,
  `vencimento` varchar(45) DEFAULT NULL,
  `taxa_remuneracao` varchar(45) DEFAULT NULL,
  `horario_limite` varchar(45) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `nome_empresa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tesouro_direto`
--

CREATE TABLE `tesouro_direto` (
  `id_tesouro_direto` int NOT NULL,
  `nome` varchar(450) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `juro_mensal` varchar(45) DEFAULT NULL,
  `juro_anual` varchar(45) DEFAULT NULL,
  `valor_unitario` varchar(45) DEFAULT NULL,
  `indexador_tes_dir` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nome` varchar(450) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `nascimento` varchar(45) DEFAULT NULL,
  `renda_mensal` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `cod_banco` varchar(45) DEFAULT NULL,
  `nmr_agencia` varchar(45) DEFAULT NULL,
  `nmr_conta` varchar(45) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_has_fundo_investimento`
--

CREATE TABLE `usuario_has_fundo_investimento` (
  `usuario_id` int NOT NULL,
  `fundo_investimento_id_fundo_investimento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_has_renda_fixa_variavel`
--

CREATE TABLE `usuario_has_renda_fixa_variavel` (
  `usuario_id` int NOT NULL,
  `renda_fixa_variavel_id_renda_fixa_variavel` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_has_tesouro_direto`
--

CREATE TABLE `usuario_has_tesouro_direto` (
  `usuario_id` int NOT NULL,
  `tesouro_direto_id_tesouro_direto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `fundo_investimento`
--
ALTER TABLE `fundo_investimento`
  ADD PRIMARY KEY (`id_fundo_investimento`);

--
-- Índices para tabela `renda_fixa_variavel`
--
ALTER TABLE `renda_fixa_variavel`
  ADD PRIMARY KEY (`id_renda_fixa_variavel`);

--
-- Índices para tabela `tesouro_direto`
--
ALTER TABLE `tesouro_direto`
  ADD PRIMARY KEY (`id_tesouro_direto`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario_has_fundo_investimento`
--
ALTER TABLE `usuario_has_fundo_investimento`
  ADD PRIMARY KEY (`usuario_id`,`fundo_investimento_id_fundo_investimento`),
  ADD KEY `fk_usuario_has_fundo_investimento_fundo_investimento1_idx` (`fundo_investimento_id_fundo_investimento`),
  ADD KEY `fk_usuario_has_fundo_investimento_usuario1_idx` (`usuario_id`);

--
-- Índices para tabela `usuario_has_renda_fixa_variavel`
--
ALTER TABLE `usuario_has_renda_fixa_variavel`
  ADD PRIMARY KEY (`usuario_id`,`renda_fixa_variavel_id_renda_fixa_variavel`),
  ADD KEY `fk_usuario_has_renda_fixa_variavel_renda_fixa_variavel1_idx` (`renda_fixa_variavel_id_renda_fixa_variavel`),
  ADD KEY `fk_usuario_has_renda_fixa_variavel_usuario1_idx` (`usuario_id`);

--
-- Índices para tabela `usuario_has_tesouro_direto`
--
ALTER TABLE `usuario_has_tesouro_direto`
  ADD PRIMARY KEY (`usuario_id`,`tesouro_direto_id_tesouro_direto`),
  ADD KEY `fk_usuario_has_tesouro_direto_tesouro_direto1_idx` (`tesouro_direto_id_tesouro_direto`),
  ADD KEY `fk_usuario_has_tesouro_direto_usuario1_idx` (`usuario_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fundo_investimento`
--
ALTER TABLE `fundo_investimento`
  MODIFY `id_fundo_investimento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `renda_fixa_variavel`
--
ALTER TABLE `renda_fixa_variavel`
  MODIFY `id_renda_fixa_variavel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tesouro_direto`
--
ALTER TABLE `tesouro_direto`
  MODIFY `id_tesouro_direto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `usuario_has_fundo_investimento`
--
ALTER TABLE `usuario_has_fundo_investimento`
  ADD CONSTRAINT `fk_usuario_has_fundo_investimento_fundo_investimento1` FOREIGN KEY (`fundo_investimento_id_fundo_investimento`) REFERENCES `fundo_investimento` (`id_fundo_investimento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_has_fundo_investimento_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `usuario_has_renda_fixa_variavel`
--
ALTER TABLE `usuario_has_renda_fixa_variavel`
  ADD CONSTRAINT `fk_usuario_has_renda_fixa_variavel_renda_fixa_variavel1` FOREIGN KEY (`renda_fixa_variavel_id_renda_fixa_variavel`) REFERENCES `renda_fixa_variavel` (`id_renda_fixa_variavel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_has_renda_fixa_variavel_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `usuario_has_tesouro_direto`
--
ALTER TABLE `usuario_has_tesouro_direto`
  ADD CONSTRAINT `fk_usuario_has_tesouro_direto_tesouro_direto1` FOREIGN KEY (`tesouro_direto_id_tesouro_direto`) REFERENCES `tesouro_direto` (`id_tesouro_direto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_has_tesouro_direto_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
