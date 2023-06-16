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

insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Morganne', 'Makīnsk', '+76 41 5493 7628');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Volvo Buses', 'Giulia', 'Invermere', '+16 57 5200 8117');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Daimler Buses', 'Lebbie', 'Sumbawa Besar', '+62 41 3962 5067');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Natal', 'Желино', '+38 27 1637 8618');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Volvo Buses', 'Blondelle', 'Amangarh', '+92 32 1170 2326');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Daimler Buses', 'Cleopatra', 'Invermere', '+17 32 4114 8001');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Alphonso', 'Ganquan', '+86 14 7124 6286');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Volvo Buses', 'Krishna', 'Bzou', '+21 74 5561 9540');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Daimler Buses', 'Hedwiga', 'Igbo Ora', '+23 56 4713 6000');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Antoinette', 'Kanḏay', '+93 72 6375 1221');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Volvo Buses', 'Val', 'Redon', '+33 64 3211 6676');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Daimler Buses', 'Gisele', 'Pakisaji', '+62 94 3758 4522');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Berkie', 'Nara-shi', '+81 62 9167 2687');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Volvo Buses', 'Isabeau', 'Kilmacanoge', '+35 24 4414 7256');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Daimler Buses', 'Mattheus', 'Janūb as Surrah', '+96 83 8294 0353');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Pegeen', 'Vostok', '+78 39 3635 9786');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Volvo Buses', 'Aidan', 'Foluo', '+86 87 8211 7074');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Daimler Buses', 'Thorny', 'Tibakisa', '+62 12 5468 6051');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Thayne', 'Muarabadak', '+62 78 8284 2849');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Volvo Buses', 'Sela', 'Tianyu', '+86 96 1884 7083');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Daimler Buses', 'Portia', 'Cahors', '+33 64 7321 2019');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Skippie', 'Guocun', '+86 58 1897 0940');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Volvo Buses', 'Mercedes', 'Saarbrücken', '+49 53 9904 6163');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Daimler Buses', 'Mona', 'Xinhua', '+86 52 3761 7894');
insert into Fabricantes (idfabricante, NomeEmpresa, Cidade, Telefone) values ('Marcopolo', 'Della', 'Tajumulco', '+50 45 3961 9685');


-- Inserts Veiculos -- 
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Ram 1500', 2006, 49, 'Violet', 'Porta Copos', 'Street', 'Gasolina', 59, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Camry', 1996, 38, 'Teal', 'Ar-condicionado', 'Road', 'Diesel', 70, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('riolet', 1992, 47, 'Khaki', 'Banheiro','Drive', 'Gás', 32, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('XK Series', 1997, 10, 'Yellow', 'Frigobar', 'Crossing', 'Gasolina', 73, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Sedona', 2011, 34, 'Violet', 'Lixeira','Plaza', 'Diesel', 84, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Elise', 2004, 30, 'Goldenrod', 'Porta Copos', 'Park', 'Gás', 63, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Aerio', 2002, 34, 'Blue', 'Ar-condicionado', 'Court', 'Gasolina', 66, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Eclipse', 2007, 29, 'Maroon', 'Banheiro','Junction', 'Diesel', 29, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Miata MX-5', 2007, 38, 'Mauv', 'Frigobar', 'Point', 'Gás',  54, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('LS', 1991, 31, 'Orange', 'Lixeira', 'Place', 'Gasolina', 41, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Bronco', 1985, 39, 'Khaki', 'Porta Copos', 'Drive', 'Diesel', 69, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Grand Voyager', 1992, 50, 'Maroon', 'Ar-condicionado', 'Terrace', 'Gás', 72, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Sportage', 2000, 13, 'Mauv', 'Banheiro', 'Hill', 'Gasolina', 36, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('GranTurismo', 2009, 9, 'Orange', 'Frigobar', 'Hill', 'Diesel', 88, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Pathfinder', 2008, 41, 'Orange', 'Lixeira', 'Court', 'Gás', 16, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Falcon', 1966, 36, 'Goldenrod', 'Porta Copos', 'Pass', 'Gasolina', 66, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('645', 2005, 20, 'Blue', 'Ar-condicionado', 'Avenue', 'Diesel', 85, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Sorento', 2007, 17, 'Orange', 'Banheiro', 'Terrace', 'Gás', 75, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Discovery', 2004, 35, 'Purple', 'Frigobar', 'Place', 'Gasolina', 58, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Tucson', 2007, 29, 'Crimson', 'Lixeira', 'Parkway', 'Diesel', 33, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('LeMans', 1992, 4, 'Blue', 'Porta Copos', 'Center', 'Gás', 71, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Rainier', 2006, 13, 'Teal', 'Ar-condicionado', 'Avenue', 'Gasolina', 36, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Yukon XL 2500', 2003, 48, 'Puce', 'Banheiro', 'Park', 'Diesel', 49, 2);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('del Sol', 1997, 9, 'Purple', 'Frigobar', 'Court', 'Gás', 16, 1);
insert into Veiculos (Marca, Ano, Lotação, Cor, Acessorios, TipodeFrota, TipoCombustivel, KmVeiculo, PortaVeiculo) values ('Wrangler', 1993, 52, 'Pink', 'Lixeira', 'Junction', 'Gasolina', 86, 2);

-- Inserts Enderecos --
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (12345-678, 11, 'Bloomington', 'Néa Péramos', 'Kelodan', 'Samphanthawong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (98765-432, 2, 'Batasan', 'Ganjaran', 'Kota Kinabalu', 'Melong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (56789-012, 3, 'Hyltebruk', 'Almelo', 'Los Angeles', 'Caicó');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (21098-765, 444, 'Klirou', 'Hamhŭng', 'Gangu Chengguanzhen', 'Kathu');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (34567-890, 55, 'Yaogou', 'Angra dos Reis', 'Prínos', 'Laxiong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (87654-321, 66, 'Skatepark', 'Jablonec nad Jizerou', 'Mibu', 'Lenger');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (54321-098, 7, 'Naschel', 'Aoshi', 'Dahu', 'Catamayo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (89012-345, 8, 'Lišov', 'Mashi', 'Mapou', 'Vårgårda');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (65432-109, 9, 'Grenoble', 'Sacramento', 'Baiima', 'Maradi');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (10987-654, 10, 'Qinhe', 'Futian', 'Novi Kneževac', 'Zhongpai');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (43210-987, 11, 'Sanxing', 'Dajanrurung', 'Sibulan', 'San Antonio de los Baños');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (78901-234, 12, 'Gechuan', 'Gongpo', 'Staroderevyankovskaya', 'Curvelo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (21098-765, 13, 'Trzin', 'Zbrosławice', 'Makadi Bay', 'Krajan Battal');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (34567-890, 14, 'Gamut', 'Niamtougou', 'Grande Cache', 'Motuo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (87654-321, 15, 'Cigadog', 'Saboyá', 'Anrong', 'Algoz');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (54321-098, 16, 'Solna', 'Zhoutian', 'Mishkino', 'Guacarí');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (89012-345, 17, 'Nova Olímpia', 'Hongmei', 'Volgodonsk', 'Villa Concepción del Tío');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (65432-109, 18, 'Donglu', 'Không', 'Batouri', 'Lidingö');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (10987-654, 68, 'Krajan Satu', 'Munde', 'Luleå', 'Ar Ramāḑīn');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (43210-987, 21, 'Manna', 'Banisilan', 'Juncalito Abajo', 'Confey');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (76543-210, 26, 'Oropesa', 'Doujia', 'Havre-Saint-Pierre', 'Korba');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (21034-567, 22, 'Belfort', 'Tarascon', 'Staten Island', 'Safotulafai');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (67890-123, 23, 'Thung Yang Daeng', 'Goiatuba', 'Sol’tsy', 'Shangde');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (43210-987, 24, 'Ongabelen', 'Huanggong', 'Krajan', 'Santana');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (98765-432, 25, 'Naawan', 'Ban Mai', 'Liuhe', 'Lidong');

-- Inserts Cliente Empresa -- 
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('36272954551234', 'Justen', '1657959341', '12345-678', 'jsturmey0@wp.com', '6514792446');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('06649113665678', 'Lucie', '8128877662', '98765-432', 'lportman1@chronoengine.com', '9715415028');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('24104085759876', 'Kristos', '3534442427', '56789-012', 'kstanlake2@jugem.jp', '1938475602');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('53047807015422', 'Igor', '1565984189', '21098-765', 'icadell3@spiegel.de', '8451335877');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('42744495641243', 'Skell', '7156617887', '34567-890', 'smulliss4@biblegateway.com', '9903719082');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('44096288875643', 'Marcellus', '5406856655', '87654-321', 'mpennazzi5@google.co.jp', '5311967864');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('87724616836754', 'Lishe', '7238638880', '54321-098', 'lturmel6@webs.com', '1038955973');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('33516866258976', 'Berenice', '3707439756', '54321-098', 'bbaudy7@imdb.com', '2648692101');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('42273050479087', 'Alberta', '9763244084', '89012-345', 'aballeine8@is.gd', '4407832051');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('28267194409773', 'Melodie', '8058101531', '65432-109', 'mbrightey9@posterous.com', '5253825383');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('47860134632345', 'Marice', '8857090644', '10987-654', 'mtowna@github.com', '9484261763');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('12007834411256', 'Tobin', '9275472609', '78901-234', 'tschettinib@tripadvisor.com', '3315335358');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('75523634443215', 'Seana', '5787941299', '21098-765', 'struec@prnewswire.com', '7449550775');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('83471682297869', 'Valenka', '8371213222', '34567-890', 'vwilded@flickr.com', '8032060588');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('29745217703421', 'Thedrick', '2351071259', '87654-321', 'tcroncheye@google.com.au', '6529119042');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('14948745635678', 'Collen', '1619809503', '54321-098', 'crazzellf@sbwire.com', '2974702182');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('29272750099876', 'Dermot', '4683192131', '89012-345', 'dklousnerg@archive.org', '9852457558');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('05326691697865', 'Clyde', '4946366458', '65432-109', 'cjammeh@independent.co.uk', '4526251025');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('15278488173456', 'Bucky', '4353327717', '10987-654', 'bspraggsi@weibo.com', '2304321725');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('23207184432134', 'Nikolai', '1995105032', '43210-987', 'nanglissj@fda.gov', '7366609651');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('93976908176785', 'Brion', '4943617423', '76543-210', 'bbrocktonk@jimdo.com', '9641835130');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('07524728958976', 'Fayre', '5783254448', '21034-567', 'fstoadl@cafepress.com', '4596291922');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('18247580570934', 'Brigg', '1108989806', '67890-123', 'bgreenhowm@exblog.jp', '7782779892');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('86174083322134', 'Phillida', '1383368445', '43210-987', 'plillimann@istockphoto.com', '2597408002');
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('40353720804576', 'Ruttger', '7569653916', '98765-432', 'rmccreatho@newsvine.com', '7259410162');

-- Inserts Funcionario --
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Dore', '1%', 1);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Kristina', '2%', 2 );
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Kimberley', '3%', 3);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Augustin', '4%', 4);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Forrester', '5%', 5);
insert into Funcionario (NomeFuncionario, FaixaComissao, CargoAtual) values ('Herrick', '6%', 6);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Rosalinda', '7%', 7);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Karil', '8%', 8);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Nap', '9%', 9);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Zarla', '10%', 10);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Bax', '11%', 11);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Wilona', '2,2%', 12);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Samuel', '1%', 13);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Alyson', '4%', 14);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Persis', '15%', 15);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Mireielle', '16%', 16);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Darcy', '17%', 17);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Ivor', '18%', 18);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('L;urette', '19%', 19);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Rockwell', '20%', 20);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Mace', '21%', 21);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Craig', '22%', 22);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Bea', '23%', 23);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Wilden', '24%', 24);
insert into Funcionario ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Cobb', '25%', 25);


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
SELECT * FROM Veiculos ORDER BY id_modelo ASC;
-- Selects Enderecos -- 
SELECT COUNT(*) from enderecos; 
SELECT * FROM `Enderecos` ORDER BY `id_Cep`;
-- Selects Funcionario -- 
SELECT COUNT(*) from funcionario;
SELECT * FROM Funcionario  ORDER BY funcionario_id ASC;

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
UPDATE Veiculos SET Marca = 'Ram 1500', Ano = 2006, Lotação = 49, Cor = 'Violet', Acessorios = 'Porta Copos', TipodeFrota = 'Street', TipoCombustivel = 'Gasolina', KmVeiculo = 59, PortaVeiculo = 2 WHERE id_modelo = 1;
UPDATE Veiculos SET Marca = 'Camry', Ano = 1996, Lotação = 38, Cor = 'Teal', Acessorios = 'Ar-condicionado', TipodeFrota = 'Road', TipoCombustivel = 'Diesel', KmVeiculo = 70, PortaVeiculo = 1 WHERE id_modelo = 2;
UPDATE Veiculos SET Marca = 'riolet', Ano = 1992, Lotação = 47, Cor = 'Khaki', Acessorios = 'Banheiro', TipodeFrota = 'Drive', TipoCombustivel = 'Gás', KmVeiculo = 32, PortaVeiculo = 2 WHERE id_modelo = 3;
UPDATE Veiculos SET Marca = 'XK Series', Ano = 1997, Lotação = 10, Cor = 'Yellow', Acessorios = 'Frigobar', TipodeFrota = 'Crossing', TipoCombustivel = 'Gasolina', KmVeiculo = 73, PortaVeiculo = 1 WHERE id_modelo = 4;
UPDATE Veiculos SET Marca = 'Sedona', Ano = 2011, Lotação = 34, Cor = 'Violet', Acessorios = 'Lixeira', TipodeFrota = 'Plaza', TipoCombustivel = 'Diesel', KmVeiculo = 84, PortaVeiculo = 2 WHERE id_modelo = 5;
UPDATE Veiculos SET Marca = 'Elise', Ano = 2004, Lotação = 30, Cor = 'Goldenroad', Acessorios = 'Porta Copos', TipodeFrota = 'Park', TipoCombustivel = 'Gás', KmVeiculo = 63, PortaVeiculo = 1 WHERE id_modelo = 6;
UPDATE Veiculos SET Marca = 'Aerio', Ano = 2002, Lotação = 34, Cor = 'Blue', Acessorios = 'Ar-condicionado', TipodeFrota = 'Court', TipoCombustivel = 'Gasolina', KmVeiculo = 66, PortaVeiculo = 2 WHERE id_modelo = 7;
UPDATE Veiculos SET Marca = 'Eclipse', Ano = 2007, Lotação = 29, Cor = 'Maroon', Acessorios = 'Banheiro', TipodeFrota = 'Junction', TipoCombustivel = 'Diesel', KmVeiculo = 29, PortaVeiculo = 1 WHERE id_modelo = 8;
UPDATE Veiculos SET Marca = 'Miata MX-5', Ano = 2007, Lotação = 38, Cor = 'Mauv', Acessorios = 'Frigobar', TipodeFrota = 'Point', TipoCombustivel = 'Gás', KmVeiculo = 54, PortaVeiculo = 2 WHERE id_modelo = 9;
UPDATE Veiculos SET Marca = 'LS', Ano = 1991, Lotação = 31, Cor = 'Orange', Acessorios = 'Lixeira', TipodeFrota = 'Place', TipoCombustivel = 'Gasolina', KmVeiculo = 41, PortaVeiculo = 1 WHERE id_modelo = 10;

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
DELETE FROM Veiculos WHERE id_modelo = 1;
DELETE FROM Veiculos WHERE id_modelo = 2;
DELETE FROM Veiculos WHERE id_modelo = 3;
DELETE FROM Veiculos WHERE id_modelo = 4;
DELETE FROM Veiculos WHERE id_modelo = 5;

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







