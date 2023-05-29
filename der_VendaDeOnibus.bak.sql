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

-- Inserts Tabelas --
Tabela Cliente Empresa
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (12, 'Packston', 9, 3, 'pcrosdill0@aboutads.info', 62);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (9, 'Clevie', 8, 4, 'czamora1@pagesperso-orange.fr', 48);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (9, 'Brendin', 8, 1, 'bwychard2@constantcontact.com', 70);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (13, 'Alla', 9, 2, 'anisen3@prlog.org', 80);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (13, 'Wolfgang', 9, 8, 'wshakle4@marketwatch.com', 6);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (13, 'Mort', 7, 3, 'mkale5@java.com', 66);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (10, 'Blanca', 8, 2, 'bdoddridge6@wikimedia.org', 40);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (4, 'Orelee', 3, 3, 'ogehring7@nsw.gov.au', 19);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (9, 'Joan', 4, 4, 'jodriscoll8@feedburner.com', 57);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (11, 'Kamila', 4, 5, 'klavallie9@ucla.edu', 95);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (5, 'Ted', 8, 7, 'tcondona@chron.com', 79);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (5, 'Myrlene', 5, 4, 'mhendricksb@ucoz.com', 86);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (10, 'Antonina', 5, 8, 'aundrillc@admin.ch', 40);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (3, 'Alleen', 9, 7, 'afoggod@npr.org', 97);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (7, 'Julia', 1, 3, 'jcordse@alexa.com', 97);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (11, 'Tammie', 5, 7, 'tlackief@cbc.ca', 54);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (6, 'Mohandis', 1, 1, 'mwicherg@cargocollective.com', 88);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (10, 'Letisha', 9, 3, 'lhebardh@51.la', 31);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (8, 'Yorgo', 2, 1, 'ygoodsoni@nationalgeographic.com', 78);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (8, 'August', 9, 5, 'arablj@google.pl', 40);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (7, 'Billy', 9, 8, 'bwaggettk@mashable.com', 32);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (2, 'Renard', 2, 7, 'rkalewel@ox.ac.uk', 58);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (13, 'Calla', 8, 2, 'cshrigleym@i2i.jp', 18);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (2, 'Matthus', 7, 1, 'malentyevn@360.cn', 7);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Endereco_id_Cep, Email, TelefoneCelular) values (11, 'Bondie', 2, 8, 'bfrimano@opensource.org', 68);

