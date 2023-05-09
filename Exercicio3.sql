CREATE OR REPLACE PROCEDURE SP_DML_ENDERECO_CLIENTE(
    p_operacao VARCHAR2,
    p_retorno OUT VARCHAR2
) AS
BEGIN
    IF (p_operacao = 'INSERT') THEN
        -- Código para realizar o INSERT na tabela ENDERECO_CLIENTE
        INSERT INTO ENDERECO_CLIENTE (coluna1, coluna2, coluna3)
        VALUES (valor1, valor2, valor3);
        
        p_retorno := 'Registro inserido com sucesso.';
    ELSIF (p_operacao = 'UPDATE') THEN
        -- Código para realizar o UPDATE na tabela ENDERECO_CLIENTE
        UPDATE ENDERECO_CLIENTE
        SET coluna1 = valor1,
            coluna2 = valor2,
            coluna3 = valor3
        WHERE id = valor_id;
        
        p_retorno := 'Registro atualizado com sucesso.';
    ELSIF (p_operacao = 'DELETE') THEN
        -- Código para realizar o DELETE na tabela ENDERECO_CLIENTE
        DELETE FROM ENDERECO_CLIENTE
        WHERE id = valor_id;
        
        p_retorno := 'Registro excluído com sucesso.';
    ELSE
        -- Se o valor de p_operacao não for válido, lança uma exceção com uma mensagem de erro
        RAISE_APPLICATION_ERROR(-20001, 'Operação inválida. Favor informar INSERT, UPDATE ou DELETE.');
    END IF;
    
    -- Se a operação for realizada com sucesso, a mensagem de retorno é definida como 'Sucesso'
    EXCEPTION
        WHEN OTHERS THEN
            p_retorno := 'Erro ao executar a operação. ' || SQLERRM;
END;

DECLARE
    v_retorno