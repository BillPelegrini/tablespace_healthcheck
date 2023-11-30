SET SERVEROUTPUT ON

-- Set parameters
DECLARE
    v_target_percentage NUMBER := 95; -- Desired usage percentage
    v_current_size NUMBER;
    v_free_space NUMBER;
    v_additional_space NUMBER;
    v_instance_name VARCHAR2(50); -- Replace with your instance name
BEGIN
    -- Get the instance name
    SELECT instance_name INTO v_instance_name FROM v$instance;

    -- Cursor to retrieve tablespaces with usage above 95%
    FOR ts IN (SELECT tablespace_name FROM dba_tablespaces)
    LOOP
        -- Get the current size of the tablespace
        SELECT SUM(bytes) / 1024 / 1024 / 1024
        INTO v_current_size
        FROM dba_data_files
        WHERE tablespace_name = ts.tablespace_name;

        -- Get the current free space in the tablespace
        SELECT SUM(bytes) / 1024 / 1024 / 1024
        INTO v_free_space
        FROM dba_free_space
        WHERE tablespace_name = ts.tablespace_name;

        -- Calculate the additional space required
        v_additional_space := (v_current_size * (1 - v_target_percentage / 100)) - v_free_space;

        -- Display the result only for tablespaces above 95%
        IF v_additional_space > 0 THEN
            DBMS_OUTPUT.PUT_LINE('The tablespace ' || v_instance_name || '.' || ts.tablespace_name || ' needs ' || ROUND(v_additional_space, 2) || ' GB additional to maintain ' || v_target_percentage || '% usage.');
        END IF;
    END LOOP;
END;
/

