set SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION valida_cep(cep IN VARCHAR2) RETURN BOOLEAN IS
  v_cep_valido BOOLEAN := TRUE;
BEGIN
  -- Verifica se o CEP tem o formato correto
  IF REGEXP_LIKE(cep, '^[0-9]{5}-[0-9]{3}$') = FALSE THEN
    v_cep_valido := FALSE;
  END IF;
  
  RETURN v_cep_valido;
END;

DECLARE
  v_cep VARCHAR2(10);
BEGIN
  v_cep := '12345-678';
  
  IF valida_cep(v_cep) THEN
    DBMS_OUTPUT.PUT_LINE('CEP válido!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('CEP inválido!');
  END IF;
END;