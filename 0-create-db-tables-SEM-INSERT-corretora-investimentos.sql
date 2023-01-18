-- MySQL Script generated by MySQL Workbench
-- Wed 18 Jan 2023 12:34:01
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`sexo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`sexo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`sexo` (
  `idsexo` INT NOT NULL,
  `sexo` VARCHAR(45) NULL,
  PRIMARY KEY (`idsexo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estado_civil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`estado_civil` ;

CREATE TABLE IF NOT EXISTS `mydb`.`estado_civil` (
  `idestado_civil` INT NOT NULL,
  `estado_civilcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idestado_civil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`naturalidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`naturalidade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`naturalidade` (
  `idnaturalidade` INT NOT NULL,
  `naturalidadecol` VARCHAR(45) NULL,
  PRIMARY KEY (`idnaturalidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cargo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cargo` (
  `idcargo` INT NOT NULL,
  `nome` VARCHAR(450) NULL,
  PRIMARY KEY (`idcargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`filiacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`filiacao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`filiacao` (
  `idfiliacao` INT NOT NULL,
  `nome` VARCHAR(450) NULL,
  PRIMARY KEY (`idfiliacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cargo_has_filiacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cargo_has_filiacao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cargo_has_filiacao` (
  `cargo_idcargo` INT NOT NULL,
  `filiacao_idfiliacao` INT NOT NULL,
  PRIMARY KEY (`cargo_idcargo`, `filiacao_idfiliacao`),
  INDEX `fk_cargo_has_filiacao_filiacao1_idx` (`filiacao_idfiliacao` ASC) VISIBLE,
  INDEX `fk_cargo_has_filiacao_cargo1_idx` (`cargo_idcargo` ASC) VISIBLE,
  CONSTRAINT `fk_cargo_has_filiacao_cargo1`
    FOREIGN KEY (`cargo_idcargo`)
    REFERENCES `mydb`.`cargo` (`idcargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cargo_has_filiacao_filiacao1`
    FOREIGN KEY (`filiacao_idfiliacao`)
    REFERENCES `mydb`.`filiacao` (`idfiliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pais` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pais` (
  `idpais` INT NOT NULL,
  `nome` VARCHAR(450) NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UF` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UF` (
  `idUF` INT NOT NULL,
  `nome` VARCHAR(450) NOT NULL,
  `pais_idpais` INT NOT NULL,
  PRIMARY KEY (`idUF`, `pais_idpais`),
  INDEX `fk_UF_pais1_idx` (`pais_idpais` ASC) VISIBLE,
  CONSTRAINT `fk_UF_pais1`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `mydb`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cidade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cidade` (
  `idcidade` INT NOT NULL,
  `nome` VARCHAR(450) NOT NULL,
  `UF_idUF` INT NOT NULL,
  PRIMARY KEY (`idcidade`, `UF_idUF`),
  INDEX `fk_cidade_UF1_idx` (`UF_idUF` ASC) VISIBLE,
  CONSTRAINT `fk_cidade_UF1`
    FOREIGN KEY (`UF_idUF`)
    REFERENCES `mydb`.`UF` (`idUF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bairro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`bairro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`bairro` (
  `idbairro` INT NOT NULL,
  `nome` VARCHAR(450) NOT NULL,
  `cidade_idcidade` INT NOT NULL,
  PRIMARY KEY (`idbairro`, `cidade_idcidade`),
  INDEX `fk_bairro_cidade1_idx` (`cidade_idcidade` ASC) VISIBLE,
  CONSTRAINT `fk_bairro_cidade1`
    FOREIGN KEY (`cidade_idcidade`)
    REFERENCES `mydb`.`cidade` (`idcidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`endereco` ;

CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `idendereco` INT NOT NULL,
  `logradouro` VARCHAR(450) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `bairro_idbairro` INT NOT NULL,
  PRIMARY KEY (`idendereco`, `bairro_idbairro`),
  INDEX `fk_endereco_bairro1_idx` (`bairro_idbairro` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_bairro1`
    FOREIGN KEY (`bairro_idbairro`)
    REFERENCES `mydb`.`bairro` (`idbairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`escolaridade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`escolaridade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`escolaridade` (
  `idescolaridade` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(450) NULL,
  PRIMARY KEY (`idescolaridade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pessoa` (
  `idpessoa` INT NOT NULL,
  `nome` VARCHAR(450) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `rg` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nascimento` VARCHAR(45) NOT NULL,
  `renda_mensal` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `sexo_idsexo` INT NOT NULL,
  `estado_civil_idestado_civil` INT NOT NULL,
  `naturalidade_idnaturalidade` INT NOT NULL,
  `cargo_has_filiacao_cargo_idcargo` INT NOT NULL,
  `cargo_has_filiacao_filiacao_idfiliacao` INT NOT NULL,
  `endereco_idendereco` INT NOT NULL,
  `escolaridade_idescolaridade` INT NOT NULL,
  PRIMARY KEY (`idpessoa`, `sexo_idsexo`, `estado_civil_idestado_civil`, `naturalidade_idnaturalidade`, `cargo_has_filiacao_cargo_idcargo`, `cargo_has_filiacao_filiacao_idfiliacao`, `endereco_idendereco`, `escolaridade_idescolaridade`),
  UNIQUE INDEX `idpessoa_UNIQUE` (`idpessoa` ASC) VISIBLE,
  INDEX `fk_pessoa_sexo_idx` (`sexo_idsexo` ASC) VISIBLE,
  INDEX `fk_pessoa_estado_civil1_idx` (`estado_civil_idestado_civil` ASC) VISIBLE,
  INDEX `fk_pessoa_naturalidade1_idx` (`naturalidade_idnaturalidade` ASC) VISIBLE,
  INDEX `fk_pessoa_cargo_has_filiacao1_idx` (`cargo_has_filiacao_cargo_idcargo` ASC, `cargo_has_filiacao_filiacao_idfiliacao` ASC) VISIBLE,
  INDEX `fk_pessoa_endereco1_idx` (`endereco_idendereco` ASC) VISIBLE,
  INDEX `fk_pessoa_escolaridade1_idx` (`escolaridade_idescolaridade` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_sexo`
    FOREIGN KEY (`sexo_idsexo`)
    REFERENCES `mydb`.`sexo` (`idsexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_estado_civil1`
    FOREIGN KEY (`estado_civil_idestado_civil`)
    REFERENCES `mydb`.`estado_civil` (`idestado_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_naturalidade1`
    FOREIGN KEY (`naturalidade_idnaturalidade`)
    REFERENCES `mydb`.`naturalidade` (`idnaturalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_cargo_has_filiacao1`
    FOREIGN KEY (`cargo_has_filiacao_cargo_idcargo` , `cargo_has_filiacao_filiacao_idfiliacao`)
    REFERENCES `mydb`.`cargo_has_filiacao` (`cargo_idcargo` , `filiacao_idfiliacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_endereco1`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `mydb`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_escolaridade1`
    FOREIGN KEY (`escolaridade_idescolaridade`)
    REFERENCES `mydb`.`escolaridade` (`idescolaridade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`telefone` ;

CREATE TABLE IF NOT EXISTS `mydb`.`telefone` (
  `idtelefone` INT NOT NULL,
  `cod_pais` VARCHAR(45) NULL,
  `DDD` VARCHAR(45) NULL,
  `telefonecol` VARCHAR(45) NULL,
  PRIMARY KEY (`idtelefone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa_has_telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pessoa_has_telefone` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pessoa_has_telefone` (
  `pessoa_idpessoa` INT NOT NULL,
  `pessoa_sexo_idsexo` INT NOT NULL,
  `pessoa_filiacao_idfiliacao` INT NOT NULL,
  `pessoa_estado_civil_idestado_civil` INT NOT NULL,
  `pessoa_naturalidade_idnaturalidade` INT NOT NULL,
  `telefone_idtelefone` INT NOT NULL,
  PRIMARY KEY (`pessoa_idpessoa`, `pessoa_sexo_idsexo`, `pessoa_filiacao_idfiliacao`, `pessoa_estado_civil_idestado_civil`, `pessoa_naturalidade_idnaturalidade`, `telefone_idtelefone`),
  INDEX `fk_pessoa_has_telefone_telefone1_idx` (`telefone_idtelefone` ASC) VISIBLE,
  INDEX `fk_pessoa_has_telefone_pessoa1_idx` (`pessoa_idpessoa` ASC, `pessoa_sexo_idsexo` ASC, `pessoa_filiacao_idfiliacao` ASC, `pessoa_estado_civil_idestado_civil` ASC, `pessoa_naturalidade_idnaturalidade` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_has_telefone_pessoa1`
    FOREIGN KEY (`pessoa_idpessoa` , `pessoa_sexo_idsexo` , `pessoa_estado_civil_idestado_civil` , `pessoa_naturalidade_idnaturalidade`)
    REFERENCES `mydb`.`pessoa` (`idpessoa` , `sexo_idsexo` , `estado_civil_idestado_civil` , `naturalidade_idnaturalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_has_telefone_telefone1`
    FOREIGN KEY (`telefone_idtelefone`)
    REFERENCES `mydb`.`telefone` (`idtelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`indexador_t_dir`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`indexador_t_dir` ;

CREATE TABLE IF NOT EXISTS `mydb`.`indexador_t_dir` (
  `idindexador_t_dir` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idindexador_t_dir`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tesouro_direto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tesouro_direto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tesouro_direto` (
  `idtesouro_direto` INT NOT NULL,
  `nome` VARCHAR(450) NULL,
  `vencimento` DATE NULL,
  `juro_mensal` VARCHAR(45) NULL,
  `juro_anual` VARCHAR(45) NULL,
  `valor_unitario` VARCHAR(45) NULL,
  `indexador_t_dir_idindexador_t_dir` INT NOT NULL,
  PRIMARY KEY (`idtesouro_direto`, `indexador_t_dir_idindexador_t_dir`),
  INDEX `fk_tesouro_direto_indexador_t_dir1_idx` (`indexador_t_dir_idindexador_t_dir` ASC) VISIBLE,
  CONSTRAINT `fk_tesouro_direto_indexador_t_dir1`
    FOREIGN KEY (`indexador_t_dir_idindexador_t_dir`)
    REFERENCES `mydb`.`indexador_t_dir` (`idindexador_t_dir`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fundo_investimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`fundo_investimento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`fundo_investimento` (
  `idfundo_investimento` INT NOT NULL,
  `prazo_resgate` VARCHAR(45) NULL,
  `nome_produto` VARCHAR(450) NULL,
  `fundo_investimentocol` VARCHAR(45) NULL,
  `minimo_aplicavel` VARCHAR(45) NOT NULL,
  `data_resgate` VARCHAR(45) NULL,
  `fundo_investimentocol1` VARCHAR(45) NULL,
  PRIMARY KEY (`idfundo_investimento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empresa_emissora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`empresa_emissora` ;

CREATE TABLE IF NOT EXISTS `mydb`.`empresa_emissora` (
  `idempresa_emissora` INT NOT NULL,
  `nome` VARCHAR(450) NULL,
  PRIMARY KEY (`idempresa_emissora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`renda_fixa_variavel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`renda_fixa_variavel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`renda_fixa_variavel` (
  `idrenda_fixa_variavel` INT NOT NULL,
  `classe` VARCHAR(45) NULL,
  `vencimento(meses)` VARCHAR(45) NULL,
  `taxa_remuneracao` VARCHAR(45) NULL,
  `horario_limite` VARCHAR(45) NULL,
  `minimo_aplicavel` VARCHAR(45) NULL,
  `empresa_emissora_idempresa_emissora` INT NOT NULL,
  PRIMARY KEY (`idrenda_fixa_variavel`, `empresa_emissora_idempresa_emissora`),
  INDEX `fk_renda_fixa_variavel_empresa_emissora1_idx` (`empresa_emissora_idempresa_emissora` ASC) VISIBLE,
  CONSTRAINT `fk_renda_fixa_variavel_empresa_emissora1`
    FOREIGN KEY (`empresa_emissora_idempresa_emissora`)
    REFERENCES `mydb`.`empresa_emissora` (`idempresa_emissora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conta_corrente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`conta_corrente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`conta_corrente` (
  `idconta_corrente` INT NOT NULL,
  `cod_banco` VARCHAR(45) NULL,
  `cod_agencia` VARCHAR(45) NULL,
  `conta_correntecol` VARCHAR(45) NULL,
  PRIMARY KEY (`idconta_corrente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conta_corrente_aplica_fundo_investimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`conta_corrente_aplica_fundo_investimento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`conta_corrente_aplica_fundo_investimento` (
  `conta_corrente_idconta_corrente` INT NOT NULL,
  `fundo_investimento_idfundo_investimento` INT NOT NULL,
  PRIMARY KEY (`conta_corrente_idconta_corrente`, `fundo_investimento_idfundo_investimento`),
  INDEX `fk_conta_corrente_has_fundo_investimento_fundo_investimento_idx` (`fundo_investimento_idfundo_investimento` ASC) VISIBLE,
  INDEX `fk_conta_corrente_has_fundo_investimento_conta_corrente1_idx` (`conta_corrente_idconta_corrente` ASC) VISIBLE,
  CONSTRAINT `fk_conta_corrente_has_fundo_investimento_conta_corrente1`
    FOREIGN KEY (`conta_corrente_idconta_corrente`)
    REFERENCES `mydb`.`conta_corrente` (`idconta_corrente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_corrente_has_fundo_investimento_fundo_investimento1`
    FOREIGN KEY (`fundo_investimento_idfundo_investimento`)
    REFERENCES `mydb`.`fundo_investimento` (`idfundo_investimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conta_corrente_aplica_tesouro_direto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`conta_corrente_aplica_tesouro_direto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`conta_corrente_aplica_tesouro_direto` (
  `conta_corrente_idconta_corrente` INT NOT NULL,
  `tesouro_direto_idtesouro_direto` INT NOT NULL,
  `tesouro_direto_indexador_t_dir_idindexador_t_dir` INT NOT NULL,
  PRIMARY KEY (`conta_corrente_idconta_corrente`, `tesouro_direto_idtesouro_direto`, `tesouro_direto_indexador_t_dir_idindexador_t_dir`),
  INDEX `fk_conta_corrente_has_tesouro_direto_tesouro_direto1_idx` (`tesouro_direto_idtesouro_direto` ASC, `tesouro_direto_indexador_t_dir_idindexador_t_dir` ASC) VISIBLE,
  INDEX `fk_conta_corrente_has_tesouro_direto_conta_corrente1_idx` (`conta_corrente_idconta_corrente` ASC) VISIBLE,
  CONSTRAINT `fk_conta_corrente_has_tesouro_direto_conta_corrente1`
    FOREIGN KEY (`conta_corrente_idconta_corrente`)
    REFERENCES `mydb`.`conta_corrente` (`idconta_corrente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_corrente_has_tesouro_direto_tesouro_direto1`
    FOREIGN KEY (`tesouro_direto_idtesouro_direto` , `tesouro_direto_indexador_t_dir_idindexador_t_dir`)
    REFERENCES `mydb`.`tesouro_direto` (`idtesouro_direto` , `indexador_t_dir_idindexador_t_dir`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conta_corrente_aplica_renda_fixa_variavel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`conta_corrente_aplica_renda_fixa_variavel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`conta_corrente_aplica_renda_fixa_variavel` (
  `conta_corrente_idconta_corrente` INT NOT NULL,
  `renda_fixa_variavel_idrenda_fixa_variavel` INT NOT NULL,
  PRIMARY KEY (`conta_corrente_idconta_corrente`, `renda_fixa_variavel_idrenda_fixa_variavel`),
  INDEX `fk_conta_corrente_has_renda_fixa_variavel_renda_fixa_variav_idx` (`renda_fixa_variavel_idrenda_fixa_variavel` ASC) VISIBLE,
  INDEX `fk_conta_corrente_has_renda_fixa_variavel_conta_corrente1_idx` (`conta_corrente_idconta_corrente` ASC) VISIBLE,
  CONSTRAINT `fk_conta_corrente_has_renda_fixa_variavel_conta_corrente1`
    FOREIGN KEY (`conta_corrente_idconta_corrente`)
    REFERENCES `mydb`.`conta_corrente` (`idconta_corrente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_corrente_has_renda_fixa_variavel_renda_fixa_variavel1`
    FOREIGN KEY (`renda_fixa_variavel_idrenda_fixa_variavel`)
    REFERENCES `mydb`.`renda_fixa_variavel` (`idrenda_fixa_variavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa_has_conta_corrente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pessoa_has_conta_corrente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pessoa_has_conta_corrente` (
  `pessoa_idpessoa` INT NOT NULL,
  `pessoa_sexo_idsexo` INT NOT NULL,
  `pessoa_estado_civil_idestado_civil` INT NOT NULL,
  `pessoa_naturalidade_idnaturalidade` INT NOT NULL,
  `pessoa_cargo_has_filiacao_cargo_idcargo` INT NOT NULL,
  `pessoa_cargo_has_filiacao_filiacao_idfiliacao` INT NOT NULL,
  `pessoa_endereco_idendereco` INT NOT NULL,
  `pessoa_escolaridade_idescolaridade` INT NOT NULL,
  `conta_corrente_idconta_corrente` INT NOT NULL,
  PRIMARY KEY (`pessoa_idpessoa`, `pessoa_sexo_idsexo`, `pessoa_estado_civil_idestado_civil`, `pessoa_naturalidade_idnaturalidade`, `pessoa_cargo_has_filiacao_cargo_idcargo`, `pessoa_cargo_has_filiacao_filiacao_idfiliacao`, `pessoa_endereco_idendereco`, `pessoa_escolaridade_idescolaridade`, `conta_corrente_idconta_corrente`),
  INDEX `fk_pessoa_has_conta_corrente_conta_corrente1_idx` (`conta_corrente_idconta_corrente` ASC) VISIBLE,
  INDEX `fk_pessoa_has_conta_corrente_pessoa1_idx` (`pessoa_idpessoa` ASC, `pessoa_sexo_idsexo` ASC, `pessoa_estado_civil_idestado_civil` ASC, `pessoa_naturalidade_idnaturalidade` ASC, `pessoa_cargo_has_filiacao_cargo_idcargo` ASC, `pessoa_cargo_has_filiacao_filiacao_idfiliacao` ASC, `pessoa_endereco_idendereco` ASC, `pessoa_escolaridade_idescolaridade` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_has_conta_corrente_pessoa1`
    FOREIGN KEY (`pessoa_idpessoa` , `pessoa_sexo_idsexo` , `pessoa_estado_civil_idestado_civil` , `pessoa_naturalidade_idnaturalidade` , `pessoa_cargo_has_filiacao_cargo_idcargo` , `pessoa_cargo_has_filiacao_filiacao_idfiliacao` , `pessoa_endereco_idendereco` , `pessoa_escolaridade_idescolaridade`)
    REFERENCES `mydb`.`pessoa` (`idpessoa` , `sexo_idsexo` , `estado_civil_idestado_civil` , `naturalidade_idnaturalidade` , `cargo_has_filiacao_cargo_idcargo` , `cargo_has_filiacao_filiacao_idfiliacao` , `endereco_idendereco` , `escolaridade_idescolaridade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_has_conta_corrente_conta_corrente1`
    FOREIGN KEY (`conta_corrente_idconta_corrente`)
    REFERENCES `mydb`.`conta_corrente` (`idconta_corrente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;