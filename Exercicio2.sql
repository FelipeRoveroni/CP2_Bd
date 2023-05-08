CREATE TABLE auditoria (
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  tabela VARCHAR2(50) NOT NULL,
  comando VARCHAR2(10) NOT NULL,
  data_hora DATE NOT NULL,
  usuario VARCHAR2(50) NOT NULL
);

CREATE OR REPLACE TRIGGER tr_audit_endereco_cliente
AFTER INSERT ON endereco_cliente
FOR EACH ROW
DECLARE
  v_comando VARCHAR2(10) := 'INSERT';
BEGIN
  INSERT INTO auditoria (
    tabela,
    comando,
    data_hora,
    usuario
  ) VALUES (
    'ENDERECO_CLIENTE',
    v_comando,
    SYSDATE,
    USER
  );
END;



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
    DT_CANCELAMENTO
) VALUES (
    1,
    2,
    1001,
    'Rua das Flores',
    123,
    'Apto 101',
    '12345-678',
    'Jardim Primavera',
    12345,
    '1058',
    SYSDATE,
    NULL
);


INSERT INTO CLIENTE (
    COD_CLIENTE,
    NOM_CLIENTE,
    DES_RAZAO_SOCIAL,
    TIP_PESSOA,
    NUM_CPF_CNPJ,
    DAT_CADASTRO,
    DAT_CANCELAMENTO,
    STA_ATIVO
) VALUES (
    1001,
    'João Silva',
    NULL,
    'F',
    '12345678910',
    SYSDATE,
    NULL,
    'S'
);