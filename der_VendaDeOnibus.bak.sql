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
-- Tabela Fabricantes --
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

-- Tabela Veiculos -- 
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Dodge', 'Ram 1500', 2006, 49, 'Violet', 'Street', 'PCM, Inc.', 59, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Toyota', 'Camry', 1996, 38, 'Teal', 'Road', 'FirstEnergy Corporation', 70, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Volkswagen', 'riolet', 1992, 47, 'Khaki', 'Drive', 'Kelly Services, Inc.', 32, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Jaguar', 'XK Series', 1997, 10, 'Yellow', 'Crossing', 'Retrophin, Inc.', 73, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Kia', 'Sedona', 2011, 34, 'Violet', 'Plaza', 'ShoreTel, Inc.', 84, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Lotus', 'Elise', 2004, 30, 'Goldenrod', 'Park', 'Adams Natural Resources Fund, Inc.', 63, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Suzuki', 'Aerio', 2002, 34, 'Blue', 'Court', 'First Trust Senior Loan Fund ETF', 66, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Mitsubishi', 'Eclipse', 2007, 29, 'Maroon', 'Junction', 'Clean Diesel Technologies, Inc.', 29, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Mazda', 'Miata MX-5', 2007, 38, 'Mauv', 'Point', 'Union Pacific Corporation', 54, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Lexus', 'LS', 1991, 31, 'Orange', 'Place', 'Costco Wholesale Corporation', 41, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Ford', 'Bronco', 1985, 39, 'Khaki', 'Drive', 'PennantPark Investment Corporation', 69, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Plymouth', 'Grand Voyager', 1992, 50, 'Maroon', 'Terrace', 'EV Energy Partners, L.P.', 72, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Kia', 'Sportage', 2000, 13, 'Mauv', 'Hill', 'Apollo Senior Floating Rate Fund Inc.', 36, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Maserati', 'GranTurismo', 2009, 9, 'Orange', 'Hill', 'John Hancock Preferred Income Fund', 88, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Nissan', 'Pathfinder', 2008, 41, 'Orange', 'Court', 'MagnaChip Semiconductor Corporation', 16, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Ford', 'Falcon', 1966, 36, 'Goldenrod', 'Pass', 'RH', 66, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('BMW', '645', 2005, 20, 'Blue', 'Avenue', 'Global X FinTech ETF', 85, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Kia', 'Sorento', 2007, 17, 'Orange', 'Terrace', 'First Trust Total US Market AlphaDEX ETF', 75, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Land Rover', 'Discovery', 2004, 35, 'Purple', 'Place', 'Columbia Sportswear Company', 58, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Hyundai', 'Tucson', 2007, 29, 'Crimson', 'Parkway', 'Gabelli Equity Trust, Inc. (The)', 33, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Pontiac', 'LeMans', 1992, 4, 'Blue', 'Center', 'Weingarten Realty Investors', 71, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Buick', 'Rainier', 2006, 13, 'Teal', 'Avenue', 'Achaogen, Inc.', 36, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('GMC', 'Yukon XL 2500', 2003, 48, 'Puce', 'Park', 'Brookfield Global Listed Infrastructure Income Fund', 49, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Honda', 'del Sol', 1997, 9, 'Purple', 'Court', 'Halozyme Therapeutics, Inc.', 16, 2);
insert into Veiculos (id_modelo, Marca, Ano, Lotação, Cor, TipodeFrota, Fabricantes_ifFabricante, KmVeiculo, PortaVeiculo) values ('Jeep', 'Wrangler', 1993, 52, 'Pink', 'Junction', 'Packaging Corporation of America', 86, 2);

-- Tabela Enderecos --
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

-- Tabela Cliente Empresa -- 
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





-- Tabela Funcionario --
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

-- Tabela Vendas --
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 1, 'Cartão', 8, 1);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 2, 'Cartão', 77, 2);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 3, 'Cartão', 51, 3);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 4, 'Cartão', 36, 4);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 5, 'Cartão', 39, 5);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 6, 'Cartão', 20, 6);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 7, 'Cartão', 81, 7);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 8, 'Cartão', 66, 8);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 9, 'Cartão', 61, 9);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 10, 'Cartão', 2, 10);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 11, 'Cartão', 38, 11);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 12, 'Cartão', 11, 12);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 13, 'Cartão', 48, 13);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 14, 'Cartão', 48, 14);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 15, 'Cartão', 52, 15);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 16, 'Cartão', 52, 16);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 17, 'Cartão', 49, 17);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 18, 'Cartão', 50, 18);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 19, 'Cartão', 84, 19);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 20, 'Cartão', 59, 20);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 21, 'Cartão', 31, 21);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 22, 'Cartão', 26, 22);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 23, 'Cartão', 84, 23);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 24, 'Cartão', 49, 24);
insert into Vendas (Clientes_id_Cpf, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo) values (12, 25, 'Cartão', 52, 25);

-- Tabela Veiculos das Vendas --
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Samurai', 3, 1);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('APV', 1, 2);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('TundraMax', 3, 3);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('M-Class', 2, 4);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Sierra 1500', 1, 5);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Escalade EXT', 2, 6);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Axiom', 2, 7);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('C70', 1, 8);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Grand Cherokee', 1, 9);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('9-5', 3, 10);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Impala', 1, 11);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Maxima', 1, 12);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Sierra', 3, 13);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Montero Sport', 2, 14);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Accent', 3, 15);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('CR-Z', 2, 16);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Cavalier', 1, 17);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('CX-7', 1, 18);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Focus', 2, 19);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('SC', 3, 20);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Vision', 1, 21);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Stanza', 2, 22);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('Silverado 1500', 2, 23);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('X5 M', 3, 24);
insert into Veiculos_das_Vendas (Veiculos_id_modelo, Vendas_Clientes_id_Cpf, Vendas_Funcionarios_id_CodigoVenda) values ('C-Class', 3, 25);

-- selects --


-- updates Fabricantes --
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

-- update Veiculos --
UPDATE Veiculos SET id_modelo = 1, Fabricantes_idFabricante = 1 WHERE id_modelo = 1 AND Fabricantes_idFabricante = 1;
UPDATE Veiculos SET Marca = 'Mercedes' WHERE id_modelo = 2 AND Fabricantes_idFabricante = 2;
UPDATE Veiculos SET Ano = 2023 WHERE id_modelo = 3 AND Fabricantes_idFabricante = 3;
UPDATE Veiculos SET Acessorios = 'Porta copos' WHERE id_modelo = 4 AND Fabricantes_idFabricante = 4;
UPDATE Veiculos SET Lotação = '52 lugares' WHERE id_modelo = 5 AND Fabricantes_idFabricante = 5;
UPDATE Veiculos SET Cor = 'Cinza' WHERE id_modelo = 6 AND Fabricantes_idFabricante = 6;
UPDATE Veiculos SET TipodeFrota = 'Serviços Públicos' WHERE id_modelo = 7 AND Fabricantes_idFabricante = 7;
UPDATE Veiculos SET TipoCombustivel = 'Gasolina' WHERE id_modelo = 8 AND Fabricantes_idFabricante = 8;
UPDATE Veiculos SET KmVeiculo = '90km' WHERE id_modelo = 9 AND Fabricantes_idFabricante = 9;
UPDATE Veiculos SET Portaveiculo = '2 portas' WHERE id_modelo = 10 AND Fabricantes_idFabricante = 10;

-- Update Enderços --
UPDATE Enderecos SET  Numero = 123 WHERE id_Cep = 8.09635296;
UPDATE Enderecos SET Cidade = 'Blumenau' WHERE id_Cep = 93.96922989;
UPDATE Enderecos SET Bairro = 'Lagoa' WHERE id_Cep = 29.74477681;
UPDATE Enderecos SET Rua = 'Geral Poço Grande' WHERE id_Cep = 64.02457725;
UPDATE Enderecos SET Estado = 'Santa Catarina' WHERE id_Cep = 87.35168452;
UPDATE Enderecos SET Numero = 456  WHERE id_Cep = 41.0592041;
UPDATE Enderecos SET Cidade = 'Outra Cidade' WHERE id_Cep = 98.56426513;
UPDATE Enderecos SET Bairro = 'Outro Bairro' WHERE id_Cep = 24.00186145;
UPDATE Enderecos SET Rua = 'Outra Rua' WHERE id_Cep = 32.19858381;
UPDATE Enderecos SET Estado = 'Outro Estado' WHERE id_Cep = 60.83474012;





