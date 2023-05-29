-- DROP DATABASES vendaDeOnibus IF EXISTS--

CREATE DATABASE IF NOT EXISTS vendaDeOnibus ;

USE vendaDeOnibus;

CREATE TABLE IF NOT EXISTS `Fabricantes` (
  `idFabricante` INT NOT NULL,
  `NomeEmpresa` VARCHAR(45) NULL,
  `Cidade` VARCHAR(45) NULL,
  `Telefone` INT NOT NULL,
  PRIMARY KEY (`idFabricante`)
);


CREATE TABLE IF NOT EXISTS `Veiculos` (
  `id_modelo` INT NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Ano` INT NOT NULL,
  `Acessorios` VARCHAR(45) NOT NULL,
  `Lotação` VARCHAR(45) NOT NULL,
  `Cor` VARCHAR(45) NOT NULL,
  `TipodeFrota` VARCHAR(45) NOT NULL,
  `Fabricantes_idFabricante` INT NOT NULL,
  `KmVeiculo` VARCHAR(45) NOT NULL,
  `Portaveiculo` VARCHAR(45) NOT NULL,
  `TipoCombustivel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_modelo`, `Fabricantes_idFabricante`),
  CONSTRAINT `fk_Veiculos_Fabricantes1` FOREIGN KEY (`Fabricantes_idFabricante`) REFERENCES `Fabricantes` (`idFabricante`)
);


CREATE TABLE IF NOT EXISTS `Enderecos` (
  `id_Cep` INT NOT NULL,
  `Numero` INT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Cep`)
);


CREATE TABLE IF NOT EXISTS `ClienteEmpresa` (
  `Cnpj` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `telefoneComercial` INT NOT NULL,
  `Enderecos_id_Cep` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `TelefoneCelular` VARCHAR(45) NULL,
  PRIMARY KEY (`Cnpj`, `Enderecos_id_Cep`),
  CONSTRAINT `fk_Clientes_Enderecos1` FOREIGN KEY (`Enderecos_id_Cep`) REFERENCES `Enderecos` (`id_Cep`)
);


CREATE TABLE IF NOT EXISTS `Funcionarios` (
  `id_CodigoVenda` INT NOT NULL,
  `NomeFuncionario` VARCHAR(45) NOT NULL,
  `FaixaComissao` INT NOT NULL,
  `CargoAtual` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_CodigoVenda`)
);


CREATE TABLE IF NOT EXISTS `Vendas` (
  `Clientes_id_Cpf` INT NOT NULL,
  `Funcionarios_id_CodigoVenda` INT NOT NULL,
  `tipoPagamento` VARCHAR(45) NOT NULL,
  `Garantia` VARCHAR(45) NOT NULL,
  `ReservaVeiculo` VARCHAR(45) NULL,
  PRIMARY KEY (`Clientes_id_Cpf`, `Funcionarios_id_CodigoVenda`),
  CONSTRAINT `fk_Veiculos_has_Clientes_Clientes1` FOREIGN KEY (`Clientes_id_Cpf`) REFERENCES `ClienteEmpresa` (`Cnpj`),
  CONSTRAINT `fk_Vendas_Funcionarios1` FOREIGN KEY (`Funcionarios_id_CodigoVenda`) REFERENCES `Funcionarios` (`id_CodigoVenda`)
);


CREATE TABLE IF NOT EXISTS `Veiculos_has_Vendas` (
  `Veiculos_id_modelo` INT NOT NULL,
  `Vendas_Clientes_id_Cpf` INT NOT NULL,
  `Vendas_Funcionarios_id_CodigoVenda` INT NOT NULL,
  PRIMARY KEY (
    `Veiculos_id_modelo`,
    `Vendas_Clientes_id_Cpf`,
    `Vendas_Funcionarios_id_CodigoVenda`),
  CONSTRAINT `fk_Veiculos_has_Vendas_Veiculos1` FOREIGN KEY (`Veiculos_id_modelo`) REFERENCES `Veiculos` (`id_modelo`),
  CONSTRAINT `fk_Veiculos_has_Vendas_Vendas1` FOREIGN KEY (
    `Vendas_Clientes_id_Cpf`,
    `Vendas_Funcionarios_id_CodigoVenda`
  ) REFERENCES `Vendas` (
    `Clientes_id_Cpf`,
    `Funcionarios_id_CodigoVenda`)
);