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


CREATE TABLE IF NOT EXISTS `Veiculos_das_Vendas` (
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
-- Inserts Fabricantes --

-- COMENTARIO: TIRAR OS IDs DOS INSERTS --

insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Renner-Sipes', 'Klocko-Koch', 'Youdunjie', '170-447-9881');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Emard, Casper and Abernathy', 'Harber-Labadie', 'Singaparna', '780-982-4586');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Rempel and Sons', 'Tromp, Becker and Considine', '''s-Hertogenbosch', '829-721-1507');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Buckridge, Block and Predovic', 'Lueilwitz-Leannon', 'Tōbetsu', '113-503-3859');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Weimann, Crist and Kirlin', 'Batz Inc', 'Lwówek Śląski', '709-757-5821');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Grady Group', 'Walker LLC', 'Barrio San Luis', '311-202-3560');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('MacGyver-Schulist', 'Wolf, Schulist and Nader', 'Haokou', '955-598-2629');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Johnson-Luettgen', 'Koch, Hansen and Kozey', 'Calubcub Dos', '394-358-3644');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Herman Inc', 'Shanahan-Davis', 'Ikedachō', '537-554-6269');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Walker Group', 'Runte-Sipes', 'Chongkan', '275-664-4861');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Turcotte-Bergstrom', 'Shields-Blick', 'Longtian', '301-964-6653');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Erdman, Spinka and Hyatt', 'Hintz-Langosh', 'Mariquita', '711-867-1943');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Morar and Sons', 'DuBuque, Wehner and Mitchell', 'Mueang Nonthaburi', '552-546-2031');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Ebert, Gottlieb and Schmidt', 'Moen-Dibbert', 'Nianyushan', '632-644-0035');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Brakus Group', 'O''Connell, McKenzie and Zulauf', 'Łącko', '875-842-4758');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Watsica-Aufderhar', 'Beahan, Veum and Bashirian', 'Hengli', '619-106-1216');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Heller, Krajcik and Cremin', 'Hudson Group', 'Kilkís', '193-850-1688');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Hills Inc', 'Bednar Inc', 'T’azagyugh', '240-603-1121');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Waters and Sons', 'Kovacek Group', 'Tianchang', '470-475-7514');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Torp-Legros', 'Deckow LLC', 'Smach Mean Chey', '450-930-5610');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Skiles LLC', 'Johnson Inc', 'Cikeusal', '518-997-6495');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Fritsch-Bernier', 'Ortiz, Adams and Beier', 'Aţ Ţaybah', '523-630-6847');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Reichel-Mueller', 'Schulist Inc', 'Catende', '398-598-8482');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Torp, Stroman and Kunde', 'Wolf, Dibbert and Ondricka', 'Huskvarna', '294-716-9241');
insert into Fabricantes (id_Fabricante, NomeEmpresa, Cidade, Telefone) values ('Collins Inc', 'Kutch, Keeling and Stanton', 'Refojos de Riba de Ave', '933-838-8505');

-- Inserts Veiculos -- 
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (1, 'Ram 1500', 2006, 49, 'Violet', 'Porta Copos', 'Street', 'Gasolina', 59, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (2, 'Camry', 1996, 38, 'Teal', 'Ar-condicionado', 'Road', 'Diesel', 70, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (3, 'riolet', 1992, 47, 'Khaki', 'Banheiro','Drive', 'Gás', 32, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (4, 'XK Series', 1997, 10, 'Yellow', 'Frigobar', 'Crossing', 'Gasolina', 73, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (5, 'Sedona', 2011, 34, 'Violet', 'Lixeira','Plaza', 'Diesel', 84, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (6, 'Elise', 2004, 30, 'Goldenrod', 'Porta Copos', 'Park', 'Gás', 63, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (7, 'Aerio', 2002, 34, 'Blue', 'Ar-condicionado', 'Court', 'Gasolina', 66, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (8, 'Eclipse', 2007, 29, 'Maroon', 'Banheiro','Junction', 'Diesel', 29, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (9, 'Miata MX-5', 2007, 38, 'Mauv', 'Frigobar', 'Point', 'Gás',  54, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (10, 'LS', 1991, 31, 'Orange', 'Lixeira', 'Place', 'Gasolina', 41, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (11, 'Bronco', 1985, 39, 'Khaki', 'Porta Copos', 'Drive', 'Diesel', 69, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (12, 'Grand Voyager', 1992, 50, 'Maroon', 'Ar-condicionado', 'Terrace', 'Gás', 72, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (13, 'Sportage', 2000, 13, 'Mauv', 'Banheiro', 'Hill', 'Gasolina', 36, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (14, 'GranTurismo', 2009, 9, 'Orange', 'Frigobar', 'Hill', 'Diesel', 88, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (15, 'Pathfinder', 2008, 41, 'Orange', 'Lixeira', 'Court', 'Gás', 16, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (16, 'Falcon', 1966, 36, 'Goldenrod', 'Porta Copos', 'Pass', 'Gasolina', 66, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (17, '645', 2005, 20, 'Blue', 'Ar-condicionado', 'Avenue', 'Diesel', 85, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (18, 'Sorento', 2007, 17, 'Orange', 'Banheiro', 'Terrace', 'Gás', 75, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (19, 'Discovery', 2004, 35, 'Purple', 'Frigobar', 'Place', 'Gasolina', 58, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (20, 'Tucson', 2007, 29, 'Crimson', 'Lixeira', 'Parkway', 'Diesel', 33, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (21, 'LeMans', 1992, 4, 'Blue', 'Porta Copos', 'Center', 'Gás', 71, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (22, 'Rainier', 2006, 13, 'Teal', 'Ar-condicionado', 'Avenue', 'Gasolina', 36, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (23, 'Yukon XL 2500', 2003, 48, 'Puce', 'Banheiro', 'Park', 'Diesel', 49, 2);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (24, 'del Sol', 1997, 9, 'Purple', 'Frigobar', 'Court', 'Gás', 16, 1);
insert into Veiculos (Veiculos_id, Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values (25, 'Wrangler', 1993, 52, 'Pink', 'Lixeira', 'Junction', 'Gasolina', 86, 2);

-- Inserts Enderecos --
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (8.09635296, 1, 'Bloomington', 'Néa Péramos', 'Kelodan', 'Samphanthawong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (93.96922989, 2, 'Batasan', 'Ganjaran', 'Kota Kinabalu', 'Melong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (18.83448994, 3, 'Hyltebruk', 'Almelo', 'Los Angeles', 'Caicó');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (36.02280307, 4, 'Klirou', 'Hamhŭng', 'Gangu Chengguanzhen', 'Kathu');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (29.74477681, 5, 'Yaogou', 'Angra dos Reis', 'Prínos', 'Laxiong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (31.88375906, 6, 'Skatepark', 'Jablonec nad Jizerou', 'Mibu', 'Lenger');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (64.02457725, 7, 'Naschel', 'Aoshi', 'Dahu', 'Catamayo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (92.33638383, 8, 'Lišov', 'Mashi', 'Mapou', 'Vårgårda');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (49.70551522, 9, 'Grenoble', 'Sacramento', 'Baiima', 'Maradi');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (86.16987814, 10, 'Qinhe', 'Futian', 'Novi Kneževac', 'Zhongpai');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (87.35168452, 11, 'Sanxing', 'Dajanrurung', 'Sibulan', 'San Antonio de los Baños');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (98.56426513, 12, 'Gechuan', 'Gongpo', 'Staroderevyankovskaya', 'Curvelo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (45.29208355, 13, 'Trzin', 'Zbrosławice', 'Makadi Bay', 'Krajan Battal');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (95.38882444, 14, 'Gamut', 'Niamtougou', 'Grande Cache', 'Motuo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (68.65026023, 15, 'Cigadog', 'Saboyá', 'Anrong', 'Algoz');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (24.00186145, 16, 'Solna', 'Zhoutian', 'Mishkino', 'Guacarí');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (47.21305087, 17, 'Nova Olímpia', 'Hongmei', 'Volgodonsk', 'Villa Concepción del Tío');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (32.19858381, 18, 'Donglu', 'Không', 'Batouri', 'Lidingö');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (56.40057465, 19, 'Krajan Satu', 'Munde', 'Luleå', 'Ar Ramāḑīn');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (78.56220169, 20, 'Manna', 'Banisilan', 'Juncalito Abajo', 'Confey');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (41.0592041, 21, 'Oropesa', 'Doujia', 'Havre-Saint-Pierre', 'Korba');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (54.40037294, 22, 'Belfort', 'Tarascon', 'Staten Island', 'Safotulafai');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (95.77739977, 23, 'Thung Yang Daeng', 'Goiatuba', 'Sol’tsy', 'Shangde');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (24.84726951, 24, 'Ongabelen', 'Huanggong', 'Krajan', 'Santana');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (60.83474012, 25, 'Naawan', 'Ban Mai', 'Liuhe', 'Lidong');

-- Inserts Cliente Empresa -- 
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

-- Inserts Funcionario --
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (11, 'Merlina', 15, 'Strosin-Leffler');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (8, 'Rosemary', 22, 'King Group');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (8, 'Raddy', 71, 'Funk-Jacobson');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (12, 'Shawna', 52, 'Toy, Schultz and Cormier');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (9, 'Shaina', 50, 'Carter and Sons');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (13, 'Farr', 56, 'Kilback Group');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (13, 'Terrie', 84, 'Watsica, Terry and Turcotte');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (13, 'Rafi', 66, 'Vandervort-Jast');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (14, 'Robinett', 28, 'Runolfsdottir-Koss');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (8, 'Wilmar', 6, 'Morar LLC');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (12, 'Alejandrina', 38, 'Zieme-Beatty');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (11, 'Robert', 6, 'Schaefer-Harber');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (13, 'Stanford', 91, 'Pacocha Inc');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (11, 'Ralina', 50, 'Bayer-Bashirian');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (13, 'Daphene', 55, 'Nitzsche, Friesen and Wisoky');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (8, 'Keen', 23, 'Gleason-Kutch');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (13, 'Corrianne', 21, 'Mertz-Larkin');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (9, 'Craggie', 60, 'Murphy and Sons');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (12, 'Bartholemy', 87, 'Cronin and Sons');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (11, 'Arlyne', 17, 'Howell LLC');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (10, 'Kearney', 21, 'Wolff-Schroeder');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (9, 'Zea', 38, 'Stehr-Bode');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (12, 'Renae', 4, 'Gibson-Herzog');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (10, 'Alair', 8, 'Gerhold-Veum');
insert into Funcionarios (id_codigoVenda, NomeFuncionario, FaixaComissao, CargoAtual) values (10, 'Gonzales', 92, 'Leuschke, Hamill and Sauer');

-- Inserts Vendas --
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (123456789-10, 1, 'Cartão', 8, 1);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (234567890-21, 2, 'Pix', 77, 2);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (34567801-32, 3, 'Cartão', 51, 3);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (567890123-64, 4, 'Pix', 36, 4);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (456.789012-67, 5, 'Financiamento', 39, 5);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (456789012-53, 6, 'Financiamento', 20, 6);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (345678901-42, 7, 'Cartão', 81, 7);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (789012345-76, 8, 'Cartão', 66, 8);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (234567890-31, 9, 'Pix', 61, 9);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (123456789-20 , 10, 'Pix', 2, 10);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (012345678-09, 11, 'Financiamento', 38, 11);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (567890123-56, 12, 'Cartão', 11, 12);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (901234567-98, 13, 'Pix', 48, 13);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (890123456-87, 14, 'Cartão', 48, 14);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (012345678-91, 15, 'Cartão', 52, 15);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (012345678-99, 16, 'Financiamento', 52, 16);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (901234567-88, 17, 'Pix', 49, 17);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (890123456-77, 18, 'Pix', 50, 18);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (789012345-66, 19, 'Financiamento', 84, 19);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (678901234-55, 20, 'Cartão', 59, 20);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (567890123-44, 21, 'Pix', 31, 21);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (456789012-33, 22, 'Financiamento', 26, 22);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (345678901-22, 23, 'Cartão', 84, 23);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (234567890-11, 24, 'Financiamento', 49, 24);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (123456789-00, 25, 'Pix', 52, 25);

-- Inserts Veiculos das Vendas --
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Samurai', 123456789-10, 1);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('APV', 234567890-21, 2);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('TundraMax', 345678.01-32, 3);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('M-Class', 567890123-64, 4);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Sierra 1500', 567890123-64, 5);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Escalade EXT', 456789012-53, 6);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Axiom', 345678901-42, 7);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('C70', 789012345-76, 8);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Grand Cherokee',  234567890-31, 9);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('9-5', 123456789-20, 10);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Impala', 012345678-09, 11);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Maxima', 012345678-09, 12);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Sierra', 901234567-98, 13);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Montero Sport', 890123456-87, 14);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Accent', 012345678-91, 15);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('CR-Z', 012345678-99, 16);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Cavalier', 901234567-88, 17);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('CX-7', 890123456-77, 18);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Focus', 789012345-66, 19);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('SC', 678901234-55, 20);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Vision', 567890123-44, 21);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Stanza', 456789012-33, 22);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Silverado 1500', 345678901-22, 23);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('X5 M', 234567890-11, 24);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('C-Class', 123456789-00, 25);

-- Comentario: o select join fica por último, ou seja, depois dos seus selects. Sigam a ordem das tabelas (exemplo: fabricantes, veiculos etc). --

-- Select Veiculos --
SELECT COUNT(*) FROM Veiculos;
SELECT * FROM Veiculos ORDER BY Veiculos_id ASC;
-- Selects Enderecos -- 
SELECT COUNT(*) from enderecos; 
SELECT * FROM `Enderecos` ORDER BY `id_Cep`;
-- Selects Funcionario -- 
SELECT COUNT(*) from funcionario;
SELECT * FROM `Funcionario` ORDER BY ` id_CodigoVenda `;

-- Select Join de Veiculos_das_Vendas -- 
SELECT *
FROM Veiculos_das_Vendas
INNER JOIN Veiculos ON Veiculos_das_Vendas.Veiculos_id_modelo = Veiculos.id_modelo
INNER JOIN Vendas ON Veiculos_das_Vendas.Vendas_Clientes_id_Cpf = Vendas.Clientes_id_Cpf
                  AND Veiculos_das_Vendas.Vendas_Funcionarios_id_CodigoVenda = Vendas.Funcionarios_id_CodigoVenda;
-- COMENTARIO: TROCAR O ID NO SELECT JOIN


-- Updates Fabricantes --

-- COMENTARIO: COLOCAR OS VALORES DAS CHAVES PRIMÁRIAS. PODEM TIRAR DOS INSERTS. COLOCAR NOS UPDATES E DELETES --

UPDATE Fabricantes SET NomeEmpresa = 'Deltabus' WHERE idFabricante = 1;
UPDATE Fabricantes SET Cidade = 'Blumenau' WHERE idFabricante = 2;
UPDATE Fabricantes SET Telefone = 1112345678 WHERE idFabricante = 3; -- arrumar telefone
UPDATE Fabricantes SET NomeEmpresa = 'Nova Empresa 4', Cidade = 'Nova Cidade 4' WHERE idFabricante = 4;
UPDATE Fabricantes SET Telefone = 2198765432 WHERE idFabricante = 5;
UPDATE Fabricantes SET Cidade = 'Nova Cidade 6', Telefone = 555555555 WHERE idFabricante = 6;
UPDATE Fabricantes SET NomeEmpresa = 'Nova Empresa 7', Cidade = 'Nova Cidade 7', Telefone = 111111111 WHERE idFabricante = 7;
UPDATE Fabricantes SET NomeEmpresa = 'Nova Empresa 8' WHERE idFabricante = 8;
UPDATE Fabricantes SET Cidade = 'Nova Cidade 9' WHERE idFabricante = 9;
UPDATE Fabricantes SET Telefone = 4755558888 WHERE idFabricante = 10;

-- Update Veiculos --
UPDATE Veiculos SET Marca = 'Ram 1500', Ano = 2006, Lotação = 49, Cor = 'Violet', Acessorios = 'Porta Copos', TipodeFrota = 'Street', TipoCombustivel = 'Gasolina', KmVeiculo = 59, PortaVeiculo = 2 WHERE veiculos_id = 1;
UPDATE Veiculos SET Marca = 'Camry', Ano = 1996, Lotação = 38, Cor = 'Teal', Acessorios = 'Ar-condicionado', TipodeFrota = 'Road', TipoCombustivel = 'Diesel', KmVeiculo = 70, PortaVeiculo = 1 WHERE veiculos_id = 2;
UPDATE Veiculos SET Marca = 'riolet', Ano = 1992, Lotação = 47, Cor = 'Khaki', Acessorios = 'Banheiro', TipodeFrota = 'Drive', TipoCombustivel = 'Gás', KmVeiculo = 32, PortaVeiculo = 2 WHERE veiculos_id = 3;
UPDATE Veiculos SET Marca = 'XK Series', Ano = 1997, Lotação = 10, Cor = 'Yellow', Acessorios = 'Frigobar', TipodeFrota = 'Crossing', TipoCombustivel = 'Gasolina', KmVeiculo = 73, PortaVeiculo = 1 WHERE veiculos_id = 4;
UPDATE Veiculos SET Marca = 'Sedona', Ano = 2011, Lotação = 34, Cor = 'Violet', Acessorios = 'Lixeira', TipodeFrota = 'Plaza', TipoCombustivel = 'Diesel', KmVeiculo = 84, PortaVeiculo = 2 WHERE veiculos_id = 5;
UPDATE Veiculos SET Marca = 'Elise', Ano = 2004, Lotação = 30, Cor = 'Goldenroad', Acessorios = 'Porta Copos', TipodeFrota = 'Park', TipoCombustivel = 'Gás', KmVeiculo = 63, PortaVeiculo = 1 WHERE veiculos_id = 6;
UPDATE Veiculos SET Marca = 'Aerio', Ano = 2002, Lotação = 34, Cor = 'Blue', Acessorios = 'Ar-condicionado', TipodeFrota = 'Court', TipoCombustivel = 'Gasolina', KmVeiculo = 66, PortaVeiculo = 2 WHERE veiculos_id = 7;
UPDATE Veiculos SET Marca = 'Eclipse', Ano = 2007, Lotação = 29, Cor = 'Maroon', Acessorios = 'Banheiro', TipodeFrota = 'Junction', TipoCombustivel = 'Diesel', KmVeiculo = 29, PortaVeiculo = 1 WHERE veiculos_id = 8;
UPDATE Veiculos SET Marca = 'Miata MX-5', Ano = 2007, Lotação = 38, Cor = 'Mauv', Acessorios = 'Frigobar', TipodeFrota = 'Point', TipoCombustivel = 'Gás', KmVeiculo = 54, PortaVeiculo = 2 WHERE veiculos_id = 9;
UPDATE Veiculos SET Marca = 'LS', Ano = 1991, Lotação = 31, Cor = 'Orange', Acessorios = 'Lixeira', TipodeFrota = 'Place', TipoCombustivel = 'Gasolina', KmVeiculo = 41, PortaVeiculo = 1 WHERE veiculos_id = 10;
-- Continuar --

-- Update Enderços --
UPDATE Enderecos SET Numero = 123 WHERE id_Cep = 8.09635296;
UPDATE Enderecos SET Cidade = 'Blumenau' WHERE id_Cep = 93.96922989;
UPDATE Enderecos SET Bairro = 'Lagoa' WHERE id_Cep = 29.74477681;
UPDATE Enderecos SET Rua = 'Geral Poço Grande' WHERE id_Cep = 64.02457725;
UPDATE Enderecos SET Estado = 'Santa Catarina' WHERE id_Cep = 87.35168452;
UPDATE Enderecos SET Numero = 456  WHERE id_Cep = 41.0592041;
UPDATE Enderecos SET Cidade = 'Gaspar' WHERE id_Cep = 98.56426513;
UPDATE Enderecos SET Bairro = 'Colinha' WHERE id_Cep = 24.00186145;
UPDATE Enderecos SET Rua = 'maumau' WHERE id_Cep = 32.19858381;
UPDATE Enderecos SET Estado = 'Parana' WHERE id_Cep = 60.83474012;

-- Update cliente empresa -- 
UPDATE ClienteEmpresa SET Nome = 'João Oliveira' WHERE Cnpj = 12 AND Enderecos_id_Cep = 3;
UPDATE ClienteEmpresa SET telefoneComercial = 4798855919  WHERE Cnpj = 98765432100002 AND Enderecos_id_Cep = 98765432;
UPDATE ClienteEmpresa SET Email = 'joaooliveira@gmail.com' WHERE Cnpj =    666777888000010   AND Enderecos_id_Cep = 89115816;
UPDATE ClienteEmpresa SET TelefoneCelular = '4799215230' WHERE Cnpj = 444555666 AND Enderecos_id_Cep = 59786094;
UPDATE ClienteEmpresa SET Nome = 'Pedro Costa', telefoneComercial = 5596784563, Email = 'pedrocosta@gmail.com' WHERE Cnpj = 14634789674512 AND Enderecos_id_Cep = 34658790;
UPDATE ClienteEmpresa SET Nome = 'Ana Santos', TelefoneCelular = '5597554378' WHERE Cnpj = 12435768901322 AND Enderecos_id_Cep = 89671265;
UPDATE ClienteEmpresa SET telefoneComercial = 4798765544, Email = 'anaantos@gmail.com' WHERE Cnpj = 555666777 AND Enderecos_id_Cep = 66666;
UPDATE ClienteEmpresa SET Nome = 'Lucas Almeida', telefoneComercial = 5599875634, TelefoneCelular = '4740028922' WHERE Cnpj = 888999000 AND Enderecos_id_Cep = 90867543;
UPDATE ClienteEmpresa SET telefoneComercial = 5540017899 WHERE Cnpj = 333444555 AND Enderecos_id_Cep = 81711422;
UPDATE ClienteEmpresa SET Email = 'lucasalmeida@gmail.com', TelefoneCelular = '4791142205' WHERE Cnpj = 67890123456698  AND Enderecos_id_Cep = 11781624;

-- Update Funcionario -- 
UPDATE Funcionarios SET  NomeFuncionario = 'Águida'  WHERE id_CodigoVenda = 11;
UPDATE Funcionarios SET FaixaComissao = 2  WHERE id_CodigoVenda = 11;
UPDATE Funcionarios SET CargoAtual = 'Gerente' WHERE id_CodigoVenda = 13;
UPDATE Funcionarios SET NomeFuncionario = 'Maria'  WHERE id_CodigoVenda = 14;
UPDATE Funcionarios SET FaixaComissao =  3  WHERE id_CodigoVenda = 10;
UPDATE Funcionarios SET CargoAtual = 'Supervisor' WHERE id_CodigoVenda = 8;
UPDATE Funcionarios SET NomeFuncionario = 'Bruna' WHERE id_CodigoVenda = 7;
UPDATE Funcionarios SET FaixaComissao = 1 WHERE id_CodigoVenda = 8;
UPDATE Funcionarios SET CargoAtual = 'Diretor'  WHERE id_CodigoVenda = 9;
UPDATE Funcionarios SET NomeFuncionario = 'Daniel' WHERE id_CodigoVenda = 10;

-- Update Vendas --
UPDATE Vendas SET tipoPagamento = 'Dinheiro' WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 1;
UPDATE Vendas SET tipoPagamento = 'Transferência' WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 2;
UPDATE Vendas SET Garantia = 60 WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 3;
UPDATE Vendas SET tipoPagamento = 'Boleto' WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 4;
UPDATE Vendas SET ReservaVeiculo = 5 WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 5;
UPDATE Vendas SET tipoPagamento = 'Financiamento' WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 6;
UPDATE Vendas SET tipoPagamento = 'Cartão' WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 7;
UPDATE Vendas SET Garantia = 70 WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 8;
UPDATE Vendas SET tipoPagamento = 'Pix' WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 9;
UPDATE Vendas SET Garantia = 10 WHERE Clientes_id_Cpf = 12 AND Funcionarios_id_CodigoVenda = 10;

-- Update Veiculos_das_Vendas --
UPDATE Veiculos_das_Vendas SET Veiculos_id_modelo = 'TundraMax'WHERE Veiculos_id_modelo = 'Samurai' AND Vendas_Clientes_id_Cpf = '123.456.789-10' AND Vendas_Funcionarios_id_CodigoVenda = 1;
UPDATE Veiculos_das_Vendas SET Vendas_Funcionarios_id_CodigoVenda = 30 WHERE Veiculos_id_modelo = 'APV' AND Vendas_Clientes_id_Cpf = '234.567.890-21' AND Vendas_Funcionarios_id_CodigoVenda = 2;
UPDATE Veiculos_das_Vendas SET Vendas_Clientes_id_Cpf= 123456789-90 WHERE Veiculos_id_modelo = 'TundraMax' AND Vendas_Clientes_id_Cpf = '345.678.901-32' AND Vendas_Funcionarios_id_CodigoVenda = 3;
UPDATE Veiculos_das_Vendas SET Vendas_Clientes_id_Cpf= 234567890-89 WHERE Veiculos_id_modelo = 'M-Class' AND Vendas_Clientes_id_Cpf = '567.890.123-64' AND Vendas_Funcionarios_id_CodigoVenda = 4;
UPDATE Veiculos_das_Vendas SET Vendas_Funcionarios_id_CodigoVenda = 28 WHERE Veiculos_id_modelo = 'Sierra 1500' AND Vendas_Clientes_id_Cpf = '567.890.123-64' AND Vendas_Funcionarios_id_CodigoVenda = 5;
UPDATE Veiculos_das_Vendas SET Veiculos_id_modelo = 'Samurai' WHERE Veiculos_id_modelo = 'Escalade EXT' AND Vendas_Clientes_id_Cpf = '456.789.012-53' AND Vendas_Funcionarios_id_CodigoVenda = 6;
UPDATE Veiculos_das_Vendas SET Veiculos_id_modelo =  'Grand Cherokee' WHERE Veiculos_id_modelo = 'Axiom' AND Vendas_Clientes_id_Cpf = '345.678.901-42' AND Vendas_Funcionarios_id_CodigoVenda = 7;
UPDATE Veiculos_das_Vendas SET Vendas_Clientes_id_Cpf= 345678901-78 WHERE Veiculos_id_modelo = 'C70' AND Vendas_Clientes_id_Cpf = '789.012.345-76' AND Vendas_Funcionarios_id_CodigoVenda = 8;
UPDATE Veiculos_das_Vendas SET Veiculos_id_modelo ='Vision' WHERE Veiculos_id_modelo = 'Grand Cherokee' AND Vendas_Clientes_id_Cpf = '234.567.890-31' AND Vendas_Funcionarios_id_CodigoVenda = 9;
UPDATE Veiculos_das_Vendas SET Vendas_Funcionarios_id_CodigoVenda = 33 WHERE Veiculos_id_modelo = '9-5' AND Vendas_Clientes_id_Cpf = '123.456.789-20' AND Vendas_Funcionarios_id_CodigoVenda = 10;

-- Deletes Veiculos --
DELETE FROM Veiculos WHERE Veiculos_id = 1;
DELETE FROM Veiculos WHERE Veiculos_id = 2;
DELETE FROM Veiculos WHERE Veiculos_id = 3;
DELETE FROM Veiculos WHERE Veiculos_id = 4;
DELETE FROM Veiculos WHERE Veiculos_id = 5;
DELETE FROM Veiculos WHERE Veiculos_id = 6;
DELETE FROM Veiculos WHERE Veiculos_id = 7;
DELETE FROM Veiculos WHERE Veiculos_id = 8;
DELETE FROM Veiculos WHERE Veiculos_id = 9;
DELETE FROM Veiculos WHERE Veiculos_id = 10;

DELETE FROM Veiculos WHERE Veiculos_id = 1;
DELETE FROM Veiculos WHERE Veiculos_id = 2;
DELETE FROM Veiculos WHERE Veiculos_id = 3;
DELETE FROM Veiculos WHERE Veiculos_id = 4;
DELETE FROM Veiculos WHERE Veiculos_id = 5;

-- Deletes Enderecos -- 
DELETE FROM Enderecos WHERE id_Cep = 13.9938494 ;
DELETE FROM Enderecos WHERE id_Cep = 34.083839737;
DELETE FROM Enderecos WHERE id_Cep = 45.473637463 ;
DELETE FROM Enderecos WHERE id_Cep = 52.4637362839 ;
DELETE FROM Enderecos WHERE id_Cep = 99.5859494848 ;

-- Deletes Funcionario -- 
DELETE FROM Funcionarios WHERE id_CodigoVenda = 11;
DELETE FROM Funcionarios WHERE id_CodigoVenda = 12;
DELETE FROM Funcionarios WHERE id_CodigoVenda = 13;
DELETE FROM Funcionarios WHERE id_CodigoVenda = 14;
DELETE FROM Funcionarios WHERE id_CodigoVenda = 10;


-- Comentário: sigam a ordem das tabelas (exemplo: fabricantes, veiculos etc) e a ordem dos Deletes (10 e dps 5) --







