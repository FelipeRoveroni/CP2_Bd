CREATE OR REPLACE PROCEDURE SP_DML_ENDERECO_CLIENTE(
    pr_operacao VARCHAR2,
    valor1 number,
    valor2 number,
    valor3 number,
    valor4 VARCHAR2,
    valor5 VARCHAR2,
    valor6 VARCHAR2,
    valor7 number,
    valor8 VARCHAR2,
    valor9 number,
    valor10 char,
    valor11 date,
    valor12 VARCHAR2
) AS

    v_execption EXCEPTION;

BEGIN
    CASE UPPER(pn_operacao)
    WHEN 'I' THEN
        INSERT INTO ENDERECO_CLIENTE (SEQ_ENDERECO_CLIENTE, 
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
        )
        VALUES (
        valor1, 
        valor2, 
        valor3,
        valor4,
        valor5,
        valor6,
        valor7,
        valor8,
        valor9,
        valor10,
        valor11,
        valor12 
        );
    WHEN 'U' THEN
        UPDATE ENDERECO_CLIENTE
        SET SEQ_ENDERECO_CLIENTE = valor1,
            COD_TIPO_ENDERECO = valor2,
            DES_ENDERECO = valor4,
            NUM_ENDERECO = valor5,
            DES_COMPLEMENTO = valor6,
            NUM_CEP = valor7,
            DES_BAIRRO = valor8,
            COD_CIDADE = valor9,
            STA_ATIVO = valor10,
            DAT_CADASTRO = valor11,
            DAT_CANCELAMENTO = valor12
        WHERE COD_CLIENTE = valor3;
    WHEN 'D' THEN
        DELETE FROM ENDERECO_CLIENTE WHERE COD_CLIENTE = valor3;

    END CASE;
    
EXCEPTION
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE ('ERRO ORACLE: ' || SQLCODE || SQLERRM);       
END;

exec SP_DML_ENDERECO_CLIENTE()