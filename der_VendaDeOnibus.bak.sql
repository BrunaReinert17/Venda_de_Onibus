-- DROP DATABASES vendaDeOnibus IF EXISTS --
CREATE DATABASE IF NOT EXISTS vendaDeOnibus ;

USE vendaDeOnibus;

CREATE TABLE IF NOT EXISTS `Fabricantes` (
  `idFabricante` int NOT NULL AUTO_Increment,
  `NomeEmpresa` VARCHAR(45) NULL,
  `Cidade` VARCHAR(45) NULL,
  `Telefone` INT NOT NULL,
  PRIMARY KEY (`idFabricante`)
);

CREATE TABLE IF NOT EXISTS `Veiculos` (
  `id_modelo` INT NOT NULL AUTO_Increment,
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
  PRIMARY KEY (`id_modelo`),
  CONSTRAINT `fk_Veiculos_Fabricantes1` FOREIGN KEY (`Fabricantes_idFabricante`) REFERENCES `Fabricantes` (`idFabricante`)
);


CREATE TABLE IF NOT EXISTS `Enderecos` (
  `id_Cep` int NOT NULL ,
  `Numero` INT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Cep`)
);


CREATE TABLE IF NOT EXISTS `ClienteEmpresa` (
  `Cnpj` bigint NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `telefoneComercial` INT NOT NULL,
  `Enderecos_id_Cep` INT NOT NULL ,
  `Email` VARCHAR(45) NULL,
  `TelefoneCelular` VARCHAR(45) NULL,
  PRIMARY KEY (`Cnpj`),
  CONSTRAINT `fk_Clientes_Enderecos1` FOREIGN KEY (`Enderecos_id_Cep`) REFERENCES `Enderecos` (`id_Cep`)
);


CREATE TABLE IF NOT EXISTS `Funcionarios` (
  `id_CodigoVenda` INT NOT NULL AUTO_Increment,
  `NomeFuncionario` VARCHAR(45) NOT NULL,
  `FaixaComissao` INT NOT NULL,
  `CargoAtual` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_CodigoVenda`)
);


CREATE TABLE IF NOT EXISTS `Vendas_Onibus` (
	`idVendas` int not null primary key auto_increment,
  `Clientes_id_Cnpj` bigint NOT NULL,
  `Funcionarios_id_CodigoVenda` INT NOT NULL,
  `tipoPagamento` VARCHAR(45) NOT NULL,
  `Garantia` VARCHAR(45) NOT NULL,
  `ReservaVeiculo` VARCHAR(45) NULL,
`Veiculos_id_modelo` INT NOT NULL,
  `Vendas_Funcionarios_id_CodigoVenda` INT NOT NULL,
  CONSTRAINT `fk_Veiculos_has_Clientes_Clientes1` FOREIGN KEY (`Clientes_id_Cnpj`) REFERENCES `ClienteEmpresa` (`Cnpj`),
  CONSTRAINT `fk_Veiculos_has_Vendas_Veiculos1` FOREIGN KEY (`Veiculos_id_modelo`) REFERENCES `Veiculos` (`id_modelo`),
   CONSTRAINT `Vendas_Funcionarios_id_CodigoVenda` FOREIGN KEY (`Funcionarios_id_CodigoVenda`) REFERENCES `Funcionarios` (`id_CodigoVenda`));


-- Inserts Fabricantes --

INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ('TransBrasil','São Paulo', 415493762);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'BrasilBus', 'Rio de Janeiro', 575200817);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransNacional', 'Belo Horizonte', 413965067);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação Brasil', 'Curitiba', 271637818);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TurismoBrasil', 'Porto Alegre',  321702326);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação Nacional', 'Salvador', 324148001);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransSul', 'Florianópolis',  147126286);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransCarioca', 'Niterói',  745561540);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação Sudeste', 'Campinas',  564136000);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransNordeste', 'Recife', 726351221);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação Litoral', 'Fortaleza',  643216676);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransBrasília', 'Brasília',  943755622);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação Amazônia', 'Manaus',  629172687);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TurismoNatal', 'Natal',  244414756);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransVitória', 'Vitória',  83829353);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransPantanal', 'Cuiabá', 393635786);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação Goiás', 'Goiânia',  878217074);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransAmazonas', 'Belém', 125468051);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TurismoSul', 'Porto Velho',  581970940);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransMatoGrosso', 'Cuiabá', 539946163);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação Sergipe', 'Aracaju',  523617894);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ('TransMinas', 'Belo Horizonte',  45961968);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação Paranaíba', 'Campo Grande',  961847083);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransCeará', 'Fortaleza',  647321219);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ('Viação Pernambuco', 'Recife',  58189940);

-- para delete 
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação SC', 'Aracaju',  523617894);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ('TransMinas gerais', 'Belo Horizonte',  45961968);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'Viação santos', 'Campo Grande',  961847083);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ( 'TransAlagoa', 'Fortaleza',  647321219);
INSERT INTO Fabricantes ( NomeEmpresa, Cidade, Telefone) VALUES ('Viação Rio grande ', 'Recife',  58189940);

-- Inserts Veiculos -- 
-- Primeiros 5 inserts
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2021, 'Ar condicionado', '40 passageiros', 'Branco', 'Urbana', 1, '10.000 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo Buses', 2020, 'TV, Wi-Fi', '50 passageiros', 'Prata', 'Interurbana', 2, '15.500 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2019, 'Ar condicionado, Banheiro', '30 passageiros', 'Azul', 'Rodoviária', 3, '20.200 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2022, 'Ar condicionado, GPS', '55 passageiros', 'Vermelho', 'Turística', 1, '5.000 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo Buses', 2021, 'TV, Wi-Fi', '40 passageiros', 'Preto', 'Urbana', 2, '12.100 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2020, 'Ar condicionado', '30 passageiros', 'Branco', 'Rodoviária', 3, '18.500 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2023, 'Ar condicionado, Banheiro', '45 passageiros', 'Prata', 'Interurbana', 1, '2.500 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo Buses', 2022, 'TV, Wi-Fi', '50 passageiros', 'Azul', 'Rodoviária', 2, '14.800 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2021, 'Ar condicionado, GPS', '35 passageiros', 'Vermelho', 'Turística', 3, '7.600 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2020, 'Ar condicionado', '40 passageiros', 'Preto', 'Urbana', 1, '10.200 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo Buses', 2019, 'TV, Wi-Fi', '30 passageiros', 'Branco', 'Interurbana', 2, '17.000 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2022, 'Ar condicionado, Banheiro', '55 passageiros', 'Prata', 'Rodoviária', 3, '3.800 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2021, 'Ar condicionado', '30 passageiros', 'Azul', 'Turística', 1, '12.500 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo Buses', 2020, 'TV, Wi-Fi', '40 passageiros', 'Vermelho', 'Urbana', 2, '9.700 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2019, 'Ar condicionado, GPS', '50 passageiros', 'Preto', 'Interurbana', 3, '15.300 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2022, 'Ar condicionado', '45 passageiros', 'Branco', 'Rodoviária', 1, '7.400 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo Buses', 2021, 'TV, Wi-Fi', '35 passageiros', 'Prata', 'Turística', 2, '11.600 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2020, 'Ar condicionado, Banheiro', '40 passageiros', 'Azul', 'Urbana', 3, '14.900 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2023, 'Ar condicionado', '55 passageiros', 'Vermelho', 'Interurbana', 1, '5.200 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo Buses', 2022, 'TV, Wi-Fi', '30 passageiros', 'Preto', 'Rodoviária', 2, '12.800 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2021, 'Ar condicionado, GPS', '50 passageiros', 'Branco', 'Turística', 3, '8.900 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2020, 'Ar condicionado', '40 passageiros', 'Prata', 'Urbana', 1, '11.400 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo Buses', 2019, 'TV, Wi-Fi', '35 passageiros', 'Azul', 'Interurbana', 2, '16.100 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2022, 'Ar condicionado, Banheiro', '45 passageiros', 'Vermelho', 'Rodoviária', 3, '4.600 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Marcopolo', 2021, 'Ar condicionado', '30 passageiros', 'Preto', 'Turística', 1, '10.900 km', '2 portas', 'Diesel');
-- veiculos para delete
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Ford', 2021, 'Ar condicionado', '40 passageiros', 'Branco', 'Urbana', 1, '10.000 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Iveco', 2020, 'TV, Wi-Fi', '50 passageiros', 'Prata', 'Interurbana', 2, '15.500 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Fiat', 2019, 'Ar condicionado, Banheiro', '30 passageiros', 'Azul', 'Rodoviária', 3, '20.200 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Buscar', 2022, 'Ar condicionado, GPS', '55 passageiros', 'Vermelho', 'Turística', 1, '5.000 km', '3 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Volvo ', 2021, 'TV, Wi-Fi', '40 passageiros', 'Preto', 'Urbana', 2, '12.100 km', '2 portas', 'Diesel');
INSERT INTO Veiculos (Marca, Ano, Acessorios, Lotação, Cor, TipodeFrota, Fabricantes_idFabricante, KmVeiculo, Portaveiculo, TipoCombustivel) VALUES ('Daimler Buses', 2020, 'Ar condicionado', '30 passageiros', 'Branco', 'Rodoviária', 3, '18.500 km', '2 portas', 'Diesel');


-- Inserts Enderecos --
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (12345-678, 1, 'Bloomington', 'Néa Péramos', 'Kelodan', 'Samphanthawong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (98765-432, 2, 'Batasan', 'Ganjaran', 'Kota Kinabalu', 'Melong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (56789-012, 3, 'Hyltebruk', 'Almelo', 'Los Angeles', 'Caicó');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (21098-765, 4, 'Klirou', 'Hamhŭng', 'Gangu Chengguanzhen', 'Kathu');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (34567-890, 5, 'Yaogou', 'Angra dos Reis', 'Prínos', 'Laxiong');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (87654-321, 6, 'Skatepark', 'Jablonec nad Jizerou', 'Mibu', 'Lenger');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (54321-098, 7, 'Naschel', 'Aoshi', 'Dahu', 'Catamayo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (89012-345, 8, 'Lišov', 'Mashi', 'Mapou', 'Vårgårda');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (65432-109, 9, 'Grenoble', 'Sacramento', 'Baiima', 'Maradi');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (10987-654, 10, 'Qinhe', 'Futian', 'Novi Kneževac', 'Zhongpai');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (43210-987, 11, 'Sanxing', 'Dajanrurung', 'Sibulan', 'San Antonio de los Baños');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (78901-234, 12, 'Gechuan', 'Gongpo', 'Staroderevyankovskaya', 'Curvelo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (21098-766, 13, 'Trzin', 'Zbrosławice', 'Makadi Bay', 'Krajan Battal');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (34565-890, 14, 'Gamut', 'Niamtougou', 'Grande Cache', 'Motuo');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (87656-321, 15, 'Cigadog', 'Saboyá', 'Anrong', 'Algoz');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (54323-098, 16, 'Solna', 'Zhoutian', 'Mishkino', 'Guacarí');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (89013-345, 17, 'Nova Olímpia', 'Hongmei', 'Volgodonsk', 'Villa Concepción del Tío');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (65434-109, 18, 'Donglu', 'Không', 'Batouri', 'Lidingö');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (10985-654, 19, 'Krajan Satu', 'Munde', 'Luleå', 'Ar Ramāḑīn');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (43216-987, 20, 'Manna', 'Banisilan', 'Juncalito Abajo', 'Confey');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (76547-210, 21, 'Oropesa', 'Doujia', 'Havre-Saint-Pierre', 'Korba');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (21038-567, 22, 'Belfort', 'Tarascon', 'Staten Island', 'Safotulafai');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (67898-123, 23, 'Thung Yang Daeng', 'Goiatuba', 'Sol’tsy', 'Shangde');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (43219-987, 24, 'Ongabelen', 'Huanggong', 'Krajan', 'Santana');
insert into Enderecos (id_Cep, Numero, Cidade, Bairro, Rua, Estado) values (98760-432, 25, 'Naawan', 'Ban Mai', 'Liuhe', 'Lidong');

-- Inserts Cliente Empresa -- 
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('36272954551234', 'Justen', 165959341, 12345-678, 'jsturmey0@wp.com', 6514792446);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('06649113665678', 'Lucie', 812887662, 98765-432, 'lportman1@chronoengine.com', 971515028);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('24104085759876', 'Kristos', 353442427, 56789-012, 'kstanlake2@jugem.jp', 193847562);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('53047807015422', 'Igor', 156598189, 21098-765, 'icadell3@spiegel.de', 845133877);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('42744495641243', 'Skell', 715661887, 34567-890, 'smulliss4@biblegateway.com', 990719082);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('44096288875643', 'Marcellus', 546856655, 87654-321, 'mpennazzi5@google.co.jp', 531967864);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('87724616836754', 'Lishe', 723863880, 54321-098, 'lturmel6@webs.com', 103895973);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('33516866258976', 'Berenice', 370739756, 54321-098, 'bbaudy7@imdb.com', 264869101);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('42273050479087', 'Alberta', 976324084, 89012-345, 'aballeine8@is.gd', 440732051);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('28267194409773', 'Melodie', 805811531, 65432-109, 'mbrightey9@posterous.com', 525325383);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('47860134632345', 'Marice', 885709644, 10987-654, 'mtowna@github.com', 948426763);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('12007834411256', 'Tobin', 927542609, 78901-234, 'tschettinib@tripadvisor.com', 331533358);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('75523634443215', 'Seana', 578794299, 21098-765, 'struec@prnewswire.com', 744955075);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('83471682297869', 'Valenka', 837213222, 34567-890, 'vwilded@flickr.com', 803206588);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('29745217703421', 'Thedrick', 235071259, 87654-321, 'tcroncheye@google.com.au', 652119042);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('14948745635678', 'Collen', 161909503, 54321-098, 'crazzellf@sbwire.com', 297470282);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('29272750099876', 'Dermot', 468312131, 89012-345, 'dklousnerg@archive.org', 985247558);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('05326691697865', 'Clyde', 494636458, 65432-109, 'cjammeh@independent.co.uk', 452651025);
insert into ClienteEmpresa (Cnpj, Nome, telefoneComercial, Enderecos_id_Cep, Email, TelefoneCelular) values ('15278488173456', 'Bucky', 435332717, 10987-654, 'bspraggsi@weibo.com', 230432125);

-- Inserts Funcionario --
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Dore',5, 'Faxineira');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Kristina', 2, 'Motorisra');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Kimberley',3, 'Gerente');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Augustin', 4, 'Consultor de Vendas');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Forrester', 5, 'Assistente');
insert into funcionarios (NomeFuncionario, FaixaComissao, CargoAtual) values ('Herrick', 6, 'Analista');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Rosalinda', 7, 'Diretor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Karil', 8, 'Coordenador');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Nap', 9, 'Supervisor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Zarla', 10, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Bax', 11, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Wilona', 2.2, 'Executivo');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Samuel', 1, 'Analista');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Alyson', 4, 'Assistente');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Persis', 15, 'Assistente');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Mireielle', 16, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Darcy',17, 'Representante');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Ivor', 18, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('L;urette', 19, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Rockwell', 20, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Mace', 21, 'Analista');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Craig', 22, 'Analista');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Bea', 23, 'Analista');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Wilden', 24, 'Coordenador');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Cobb', 25, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Dore',5, 'Faxineira');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Kristina', 2, 'Motorisra');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Kimberley',3, 'Gerente');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Augustin', 4, 'Consultor de Vendas');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Forrester', 5, 'Assistente');
insert into funcionarios (NomeFuncionario, FaixaComissao, CargoAtual) values ('Herrick', 6, 'Analista');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Rosalinda', 7, 'Diretor');
-- delete
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Karil', 8, 'Coordenador');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Nap', 9, 'Supervisor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Zarla', 10, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Bax', 11, 'Vendedor');
insert into funcionarios ( NomeFuncionario, FaixaComissao, CargoAtual) values ('Wilona', 2.2, 'Executivo');

-- Inserts Vendas --
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (36272954551234, 12, 'Cartão de crédito', '3 anos', 'Sim', 12, 12);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (06649113665678, 13, 'Boleto bancário', '1 ano', 'Não', 13, 13);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (24104085759876, 14, 'Transferência bancária', '2 anos', 'Sim', 14, 14);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (53047807015422, 15, 'Cheque', '1 ano', 'Não', 15, 15);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (42744495641243, 16, 'Cartão de débito', '2 anos', 'Sim', 16, 16);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (44096288875643, 17, 'Boleto bancário', '3 anos', 'Não', 17, 17);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (87724616836754, 18, 'Transferência bancária', '1 ano', 'Sim', 18, 18);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (33516866258976, 19, 'Cheque', '2 anos', 'Não', 19, 19);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (33516866258976, 20, 'Cartão de crédito', '3 anos', 'Sim', 20, 20);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (42273050479087, 21, 'Boleto bancário', '1 ano', 'Não', 21, 21);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (47860134632345, 23, 'Cheque', '1 ano', 'Não', 23, 23);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (47860134632345, 24, 'Cartão de débito', '2 anos', 'Sim', 24, 24);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (29745217703421, 25, 'Boleto bancário', '3 anos', 'Não', 25, 25);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (75523634443215, 1, 'Cartão de crédito', '1 ano', 'Sim', 1, 1);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (14948745635678, 2, 'Boleto bancário', '2 anos', 'Não', 2, 2);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (29272750099876, 3, 'Transferência bancária', '3 anos', 'Sim', 3, 3);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (05326691697865, 4, 'Cheque', '1 ano', 'Não', 4, 4);
INSERT INTO Vendas_Onibus (Clientes_id_Cnpj, Funcionarios_id_CodigoVenda, tipoPagamento, Garantia, ReservaVeiculo, Veiculos_id_modelo, Vendas_Funcionarios_id_CodigoVenda) VALUES (15278488173456, 5, 'Cartão de débito', '2 anos', 'Sim', 5, 5);
-- SELECTS--

-- Select Fabricantes --
SELECT COUNT(*) FROM Fabricantes;
SELECT * FROM Fabricantes ORDER By idfabricante ASC;

-- Select Veiculos --
SELECT COUNT(*) FROM Veiculos;
SELECT * FROM Veiculos ORDER BY id_modelo ASC;

-- Selects Enderecos -- 
SELECT COUNT(*) FROM Enderecos; 
SELECT * FROM Enderecos ORDER BY id_Cep ASC;

-- Select Cliente Empresa --
SELECT COUNT(*) FROM ClienteEmpresa;
SELECT * FROM ClienteEmpresa ORDER BY Enderecos_id_Cep ASC;

-- Selects Funcionario -- 
SELECT COUNT(*) FROM funcionarios;
SELECT * FROM funcionarios  ORDER BY id_CodigoVenda ASC;

-- Select vendas -- 
SELECT COUNT(*) FROM vendas_onibus;
SELECT * FROM vendas_onibus ORDER BY Clientes_id_Cnpj ASC;



-- Select Join de Veiculos_das_Vendas -- 
SELECT *
FROM vendas_onibus
INNER JOIN veiculos ON veiculos.id_modelo = vendas_onibus.Veiculos_id_modelo
                  AND Veiculos.id_modelo = vendas_onibus.idVendas;

-- UPDATES --

-- Updates Fabricantes --
UPDATE Fabricantes SET  NomeEmpresa = 'TransBrasil', Cidade = 'São Paulo', Telefone = '765497628' WHERE idFabricante = 1;
UPDATE Fabricantes SET NomeEmpresa = 'BrasilBus', Cidade = 'Rio de Janeiro', Telefone = '152008117' WHERE idFabricante = 2;
UPDATE Fabricantes SET  NomeEmpresa = 'TransNacional', Cidade = 'Belo Horizonte', Telefone = '653155067' WHERE idFabricante = 3;
UPDATE Fabricantes SET NomeEmpresa = 'Viação Brasil', Cidade = 'Curitiba', Telefone = '653155067' WHERE idFabricante = 4;
UPDATE Fabricantes SET  NomeEmpresa = 'TurismoBrasil', Cidade = 'Porto Alegre', Telefone = '922102326' WHERE idFabricante = 5;
UPDATE Fabricantes SET  NomeEmpresa = 'Viação nacional', Cidade = 'Salvador', Telefone = '24114001' WHERE idFabricante = 6;
UPDATE Fabricantes SET  NomeEmpresa = 'TransSul', Cidade = 'Florianópolis', Telefone = '471246286' WHERE idFabricante = 7;
UPDATE Fabricantes SET  NomeEmpresa = 'TransCarioca', Cidade = 'Niterói', Telefone = '217455619' WHERE idFabricante = 8;
UPDATE Fabricantes SET  NomeEmpresa = 'Viação Sudeste', Cidade = 'Campinas', Telefone = '235647130' WHERE idFabricante = 9;
UPDATE Fabricantes SET  NomeEmpresa = 'TransNordeste', Cidade = 'Recife', Telefone = '263751221' WHERE idFabricante = 10;

-- Update Veiculos --
UPDATE Veiculos SET Marca = 'Ram 1500', Ano = 2006, Lotação = 49, Cor = 'Violet', Acessorios = 'Porta Copos', TipodeFrota = 'Street', TipoCombustivel = 'Gasolina', KmVeiculo = 59, PortaVeiculo = 2 WHERE id_modelo = 1 ;
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
UPDATE Enderecos SET id_Cep = 12345-678, Numero = 11, Cidade = 'Gaspar', Bairro = 'Lagoa', Rua = 'Geral', Estado = 'Santa Catarina' WHERE id_Cep = 12345-678;
UPDATE Enderecos SET id_Cep = 98765-432, Numero = 2, Cidade = 'São Paulo', Bairro = 'Centro', Rua = 'Principal', Estado = 'São Paulo' WHERE id_Cep = 98765-432;
UPDATE Enderecos SET id_Cep = 98765-432, Numero = 2, Cidade = 'Batasan', Bairro = 'Ganjaran', Rua = 'Kota Kinabalu', Estado = 'Melong' WHERE id_Cep = 98765-432;
UPDATE Enderecos SET id_Cep = 56789-012, Numero = 3, Cidade = 'Hyltebruk', Bairro = 'Almelo', Rua = 'Los Angeles', Estado = 'Caicó' WHERE id_Cep = 56789-012;
UPDATE Enderecos SET id_Cep = 21098-765, Numero = 444, Cidade = 'Klirou', Bairro = 'Hamhŭng', Rua = 'Gangu Chengguanzhen', Estado = 'Kathu' WHERE id_Cep = 21098-765;
UPDATE Enderecos SET id_Cep = 34567-890,Numero = 55, Cidade = 'Yaogou', Bairro = 'Angra dos Reis', Rua = 'Prínos', Estado = 'Laxiong' WHERE id_Cep = 34567-890;
UPDATE Enderecos SET id_Cep = 87654-321,Numero = 66, Cidade = 'Skatepark', Bairro = 'Jablonec nad Jizerou', Rua = 'Mibu', Estado = 'Lenger' WHERE id_Cep = 87654-321;
UPDATE Enderecos SET id_Cep = 54321-098, Numero = 7, Cidade = 'Naschel', Bairro = 'Aoshi', Rua = 'Dahu', Estado = 'Catamayo' WHERE id_Cep = 54321-098;
UPDATE Enderecos SET id_Cep = 89012-345, Numero = 8, Cidade = 'Lišov', Bairro = 'Mashi', Rua = 'Mapou', Estado = 'Vårgårda' WHERE id_Cep = 89012-345;
UPDATE Enderecos SET id_Cep = 65432-109, Numero = 9, Cidade = 'Grenoble', Bairro = 'Sacramento', Rua = 'Baiima', Estado = 'Maradi' WHERE id_Cep = 65432-109;

-- Update cliente empresa -- 
UPDATE ClienteEmpresa SET Cnpj = 36272954551234, Nome = 'Justen', telefoneComercial = 1657959341,Enderecos_id_Cep = 12345-678, Email = 'jsturmey0@wp.com',TelefoneCelular = 65144792446 WHERE Enderecos_id_Cep = 1;
UPDATE ClienteEmpresa SET Cnpj = 06649113665678, Nome = 'Lucie', telefoneComercial = 8128877662,Enderecos_id_Cep = 98765-432, Email = 'lportman1@chronoengine.com',TelefoneCelular = 9715415028 WHERE  Enderecos_id_Cep = 2;
UPDATE ClienteEmpresa SET Cnpj = 24104085759876, Nome = 'Kristos', telefoneComercial = 3534442427,Enderecos_id_Cep = 56789-012, Email = 'kstanlake2@jugem.jp',TelefoneCelular = 1938475602 WHERE  Enderecos_id_Cep = 3;
UPDATE ClienteEmpresa SET Cnpj = 53047807015422, Nome = 'Igor', telefoneComercial = 1565984189,Enderecos_id_Cep = 21098-765, Email = 'icadell3@spiegel.de',TelefoneCelular = 8451335877 WHERE  Enderecos_id_Cep = 4;
UPDATE ClienteEmpresa SET Cnpj = 42744495641243, Nome = 'Skell', telefoneComercial = 7156617887,Enderecos_id_Cep = 34567-890, Email = 'smulliss4@biblegateway.com',TelefoneCelular = 9903719082 WHERE  Enderecos_id_Cep = 5;
UPDATE ClienteEmpresa SET Cnpj = 44096288875643, Nome = 'Marcellus', telefoneComercial = 5406856655,Enderecos_id_Cep = 87654-321, Email = 'mpennazzi5@google.co.jp',TelefoneCelular = 5311967864 WHERE Enderecos_id_Cep = 6;
UPDATE ClienteEmpresa SET Cnpj = 87724616836754, Nome = 'Lishe', telefoneComercial = 7238638880,Enderecos_id_Cep = 54321-098, Email = 'lturmel6@webs.com',TelefoneCelular = 1038955973 WHERE  Enderecos_id_Cep = 7;
UPDATE ClienteEmpresa SET Cnpj = 33516866258976, Nome = 'Berenice', telefoneComercial = 3707439756,Enderecos_id_Cep = 54321-098, Email = 'bbaudy7@imdb.com',TelefoneCelular = 2648692101 WHERE Enderecos_id_Cep = 8;
UPDATE ClienteEmpresa SET Cnpj = 42273050479087, Nome = 'Alberta', telefoneComercial = 9763244084,Enderecos_id_Cep = 89012-345, Email = 'aballeine8@is.gd',TelefoneCelular = 4407832051 WHERE  Enderecos_id_Cep = 9;
UPDATE ClienteEmpresa SET Cnpj = 28267194409773, Nome = 'melodie', telefoneComercial = 8058101531,Enderecos_id_Cep = 65432-109, Email = 'mbrightey9@posterous.com',TelefoneCelular = 5253825383 WHERE  Enderecos_id_Cep = 10;

-- Update Funcionario -- 
UPDATE funcionarios SET NomeFuncionario = 'Lola', FaixaComissao = 1, CargoAtual = 'Faxineira' WHERE id_CodigoVenda = 1 ;
UPDATE funcionarios SET NomeFuncionario = 'Kristina', FaixaComissao = 2, CargoAtual = 'Motorista' WHERE id_CodigoVenda = 2;
UPDATE funcionarios SET NomeFuncionario = 'Kimberley', FaixaComissao = 3, CargoAtual = 'Gerente' WHERE id_CodigoVenda = 3 ;
UPDATE funcionarios SET NomeFuncionario = 'Augusto', FaixaComissao =4, CargoAtual = 'Consultor de Vendas' WHERE id_CodigoVenda = 4;
UPDATE funcionarios SET NomeFuncionario = 'Forrester', FaixaComissao = 5, CargoAtual = 'Assistente' WHERE id_CodigoVenda = 5;
UPDATE funcionarios SET NomeFuncionario = 'Herrick', FaixaComissao = 6, CargoAtual = 'Analista' WHERE id_CodigoVenda = 6;
UPDATE funcionarios SET NomeFuncionario = 'Rosalinda', FaixaComissao = 7, CargoAtual = 'Diretor' WHERE id_CodigoVenda = 7 ;
UPDATE funcionarios SET NomeFuncionario = 'Karil', FaixaComissao = 8, CargoAtual = 'Coordenador' WHERE id_CodigoVenda = 8;
UPDATE funcionarios SET NomeFuncionario = 'Nap', FaixaComissao = 9, CargoAtual = 'Supervisor' WHERE  id_CodigoVenda = 9;
UPDATE funcionarios SET NomeFuncionario = 'Zarla', FaixaComissao = 10, CargoAtual = 'Vendedor' WHERE id_CodigoVenda = 10;

-- update vendas Onibus 

-- Atualizar o tipo de pagamento da venda com idVendas = 1 para 'Cartão de crédito'
UPDATE Vendas_Onibus SET tipoPagamento = 'Cartão de crédito' WHERE idVendas = 1;

-- Atualizar a garantia da venda com idVendas = 2 para '2 anos'
UPDATE Vendas_Onibus SET Garantia = '2 anos' WHERE idVendas = 2;

-- Atualizar a reserva de veículo da venda com idVendas = 3 para 'Sim'
UPDATE Vendas_Onibus SET ReservaVeiculo = 'Sim' WHERE idVendas = 3;

-- Atualizar o tipo de pagamento da venda com idVendas = 4 para 'Transferência bancária'
UPDATE Vendas_Onibus SET tipoPagamento = 'Transferência bancária' WHERE idVendas = 4;

-- Atualizar a garantia da venda com idVendas = 5 para '3 anos'
UPDATE Vendas_Onibus SET Garantia = '3 anos' WHERE idVendas = 5;

-- Atualizar a reserva de veículo da venda com idVendas = 6 para 'Não'
UPDATE Vendas_Onibus SET ReservaVeiculo = 'Não' WHERE idVendas = 6;

-- Atualizar o tipo de pagamento da venda com idVendas = 7 para 'Cheque'
UPDATE Vendas_Onibus SET tipoPagamento = 'Cheque' WHERE idVendas = 7;

-- Atualizar a garantia da venda com idVendas = 8 para '1 ano'
UPDATE Vendas_Onibus SET Garantia = '1 ano' WHERE idVendas = 8;

-- Atualizar a reserva de veículo da venda com idVendas = 9 para 'Sim'
UPDATE Vendas_Onibus SET ReservaVeiculo = 'Sim' WHERE idVendas = 9;

-- Atualizar o tipo de pagamento da venda com idVendas = 10 para 'Cartão de débito'
UPDATE Vendas_Onibus SET tipoPagamento = 'Cartão de débito' WHERE idVendas = 10;


-- DELETES -- 

-- Deletes Fabricantes -- 
DELETE FROM fabricantes WHERE idFabricante = 26;
DELETE FROM Fabricantes WHERE idfabricante = 27;
DELETE FROM Fabricantes WHERE idfabricante = 28;
DELETE FROM Fabricantes WHERE idfabricante= 29;
DELETE FROM Fabricantes WHERE idfabricante = 30;

-- Deletes Veiculos --
DELETE FROM Veiculos WHERE id_modelo = 26;
DELETE FROM Veiculos WHERE id_modelo = 27;
DELETE FROM Veiculos WHERE id_modelo = 28;
DELETE FROM Veiculos WHERE id_modelo = 29;
DELETE FROM Veiculos WHERE id_modelo = 30;

-- Deletes Enderecos -- 
DELETE FROM Enderecos WHERE id_Cep = 12345678;
DELETE FROM Enderecos WHERE id_Cep = 98765432;
DELETE FROM Enderecos WHERE id_Cep = 56789012 ;
DELETE FROM Enderecos WHERE id_Cep = 21098765 ;
DELETE FROM Enderecos WHERE id_Cep = 34567890 ;

-- Deletes Cliente Empresa -- 
DELETE FROM ClienteEmpresa WHERE Cnpj AND Enderecos_id_Cep = 1;
DELETE FROM ClienteEmpresa WHERE Cnpj AND Enderecos_id_Cep = 2;
DELETE FROM ClienteEmpresa WHERE Cnpj AND Enderecos_id_Cep = 3;
DELETE FROM ClienteEmpresa WHERE Cnpj AND Enderecos_id_Cep = 4;
DELETE FROM ClienteEmpresa WHERE Cnpj AND Enderecos_id_Cep = 5;

-- Deletes Funcionario -- 
DELETE FROM funcionarios WHERE id_CodigoVenda = 26;
DELETE FROM Funcionarios WHERE id_CodigoVenda = 27;
DELETE FROM Funcionarios WHERE id_CodigoVenda = 28;
DELETE FROM Funcionarios WHERE id_CodigoVenda = 29;
DELETE FROM Funcionarios WHERE id_CodigoVenda = 30;

-- Deletes Vendas -- 
DELETE FROM vendas_onibus WHERE idVendas =1;
DELETE FROM vendas_onibus WHERE idVendas = 2;
DELETE FROM vendas_onibus WHERE idVendas = 3;
DELETE FROM vendas_onibus WHERE idVendas =  4;
DELETE FROM vendas_onibus WHERE idVendas =  5;
