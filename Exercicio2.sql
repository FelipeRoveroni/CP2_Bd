insert into estado(cod_estado, nom_estado, cod_pais) values ('SP', 'Sao Paulo', '11');
insert into pais(cod_pais, nom_pais) values ('11', 'Brasil');
insert into cidade(cod_cidade, nom_cidade, cod_estado) values ('55', 'Sao Paulo', 'SP');
insert into cliente(COD_CLIENTE, nom_cliente, des_razao_social, tip_pessoa, num_cpf_cnpj, dat_cadastro, dat_cancelamento, sta_ativo) values ('01', 'FIAP', 'Faculdade Fiap', 'j', '51539211827', sysdate, null, 'a');
insert into tipo_endereco(cod_tipo_endereco, des_tipo_endereco) values ('2', 'Teste');

CREATE or replace TRIGGER TRG_AUDITORIA_ENDERECO_CLIENTE
AFTER INSERT ON ENDERECO_CLIENTE
FOR EACH ROW
BEGIN
    INSERT INTO AUDITORIA (DATA_HORA, USUARIO, COMANDO, TABELA)
    VALUES ((select sysdate from dual), USER(), 'INSERT', 'ENDERECO_CLIENTE');
END;

CREATE TABLE AUDITORIA (
    DATA_HORA DATE,
    USUARIO VARCHAR(50),
    COMANDO VARCHAR(10),
    TABELA VARCHAR(50)
);

INSERT INTO ENDERECO_CLIENTE (
    SEQ_ENDERECO_CLIENTE,
    COD_TIPO_ENDERECO,
    COD_CLIENTE,
    DES_ENDERECO,
    NUM_ENDERECO,
    DES_COMPLEMENTO,
    NUM_CEP,
    DES_BAIRRO,
    COD_CIDADE,
    STA_ATIVO,
    DAT_CADASTRO,
    DAT_CANCELAMENTO
) VALUES (
    1,
    2,
    01,
    'Rua das Flores',
    123,
    'Apto 101',
    '12345678',
    'Jardim Primavera',
    '55',
    'A',
    SYSDATE,
    NULL
);

commit;

