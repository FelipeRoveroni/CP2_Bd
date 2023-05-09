CREATE OR REPLACE PROCEDURE SP_LISTAR_ENDERECOS AS
    CURSOR c_enderecos IS
        SELECT
            e.id,
            e.logradouro,
            e.numero,
            e.complemento,
            p.nome AS pais,
            est.nome AS estado,
            c.nome AS cidade
        FROM
            ENDERECO_CLIENTE e
            JOIN PAIS p ON p.id = e.id_pais
            JOIN ESTADO est ON est.id = e.id_estado
            JOIN CIDADE c ON c.id = e.id_cidade;
BEGIN
    -- Cria uma variável para armazenar a mensagem de retorno
    DBMS_OUTPUT.PUT_LINE('Lista de Endereços:');
    
    -- Percorre o cursor e imprime os dados na saída padrão
    FOR endereco IN c_enderecos LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || endereco.id || 
            ' | Logradouro: ' || endereco.logradouro || 
            ' | Número: ' || endereco.numero ||
            ' | Complemento: ' || endereco.complemento ||
            ' | País: ' || endereco.pais ||
            ' | Estado: ' || endereco.estado ||
            ' | Cidade: ' || endereco.cidade
        );
    END LOOP;
    
    -- Se não houver registros, imprime uma mensagem informando que não há endereços cadastrados
    IF NOT c_enderecos%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Não há endereços cadastrados.');
    END IF;
END;

BEGIN
    SP_LISTAR_ENDERECOS;
END;
