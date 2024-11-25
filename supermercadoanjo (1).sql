CREATE DATABASE supermercadoanjo;
USE supermercadoanjo;

-- Tabela de Endereços
CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(50),
    bairro VARCHAR(50),
    numero VARCHAR(20),
    cep VARCHAR(9)
);

INSERT INTO endereco (logradouro, bairro, numero, cep)
VALUES ('Rua Ciro Maia', 'Palmas', '23', '06815-650');

-- Tabela de Categorias
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(20),
    setor VARCHAR(50)
);

-- Ajuste: Inserir uma linha por vez em categorias
INSERT INTO categoria (descricao, setor) VALUES ('leite em po', 'mercearia');
INSERT INTO categoria (descricao, setor) VALUES ('bebidas', 'bebidas');
INSERT INTO categoria (descricao, setor) VALUES ('biscoitos', 'mercearia');
INSERT INTO categoria (descricao, setor) VALUES ('congelados', 'freezer');
INSERT INTO categoria (descricao, setor) VALUES ('enlatados', 'mercearia');
INSERT INTO categoria (descricao, setor) VALUES ('higiene', 'farmácia');

-- Tabela de Produtos
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    nomeproduto VARCHAR(50),
    codigodebarras VARCHAR(50),
    datadevalidade DATE,
    precoproduto FLOAT
);

-- Ajuste: Inserir dados de produtos de forma consistente
INSERT INTO produto (id_categoria, nomeproduto, codigodebarras, datadevalidade, precoproduto)
VALUES (1, 'Leite Integral', '1069010', '2024-11-10', 5.50);

-- Tabela de Clientes
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    id_endereco INT,
    FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco),
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    celular VARCHAR(11),
    email VARCHAR(50) NOT NULL
);

INSERT INTO cliente (id_endereco, cpf, nome, telefone, celular, email)
VALUES (1, '26988776869', 'Gael', '11990036345', '11990036345', 'alexandre_239@msn.com');

-- Tabela de Vendas
CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto),
    quantidade INT,
    datavenda DATE,
    precovenda FLOAT
);

INSERT INTO venda (id_cliente, id_produto, quantidade, datavenda, precovenda)
VALUES (1, 1, 10, '2024-11-11', 55.00);

-- Tabela de Colaboradores
CREATE TABLE colaborador (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    id_endereco INT,
    FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco),
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(50),
    telefone VARCHAR(11),
    celular VARCHAR(11),
    cargo VARCHAR(15),
    dataadmissao DATE
);

INSERT INTO colaborador (id_endereco, cpf, nome, telefone, celular, cargo, dataadmissao)
VALUES (1, '38449042800', 'Erika', '11950501987', '11950501987', 'Repositor', '2024-11-11');

-- Tabela de Fornecedores
CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    id_endereco INT,
    FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco),
    cnpj VARCHAR(14),
    telefone VARCHAR(11),
    email VARCHAR(50),
    razaosocial VARCHAR(50)
);

INSERT INTO fornecedor (id_endereco, cnpj, telefone, email, razaosocial)
VALUES (1, '12345678000199', '55554444', 'avaleite@avaleite.com.br', 'Avaleite LTDA');

-- Tabela de Chamados
CREATE TABLE chamado (
    id_chamado INT AUTO_INCREMENT PRIMARY KEY,
    datachamado DATE,
    protocolo VARCHAR(20),
    tipo VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO chamado (datachamado, protocolo, tipo, status)
VALUES ('2024-11-17', '1616161', 'Reclamação', 'Em andamento');

-- Tabela de Ouvidoria
CREATE TABLE ouvidoria (
    id_ouvidoria INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    id_colaborador INT,
    FOREIGN KEY (id_colaborador) REFERENCES colaborador (id_colaborador),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor),
    dataouvidoria DATE,
    protocolo VARCHAR(20)
);

INSERT INTO ouvidoria (id_cliente, id_colaborador, id_fornecedor, dataouvidoria, protocolo)
VALUES (1, 1, 1, '2024-11-18', '1717171');
