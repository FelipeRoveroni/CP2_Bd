CREATE OR REPLACE PROCEDURE SP_LISTAR_ESTADOS_PAIS (
    p_codigo_pais IN PAIS.ID%TYPE
) AS
    CURSOR c_estados IS
        SELECT
            cod_estado,
            nom_estado,
            cod_pais
        FROM
            ESTADO
        WHERE
            id_pais = p_codigo_pais;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Lista de Estados do País:');
    FOR estado IN c_estados LOOP
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || estado.id || 
            ' | Nome: ' || estado.nome
        );
    END LOOP;
    IF NOT c_estados%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Não há estados cadastrados para o país informado.');
    END IF;
END;
