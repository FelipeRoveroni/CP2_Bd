CREATE OR REPLACE PROCEDURE SP_LISTAR_ESTADOS_PAIS (
    pn_cod_pais IN PAIS.ID%TYPE
) AS
    CURSOR c_estados IS
        SELECT
            cod_estado,
            nom_estado,
            cod_pais
        FROM
            ESTADO
        WHERE
            cod_pais = pn_cod_pais;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Lista de Estados do País:');
    FOR estado IN c_estados LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Codigo do Pais: ' || estado.cod_pais || 
            ' | Nome do Estado : ' || estado.nom_estado
        );
    END LOOP;
    IF NOT c_estados%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Não há estados cadastrados para o país informado.');
    END IF;
END;

exec SP_LISTAR_ESTADOS_PAIS()