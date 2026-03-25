CREATE SCHEMA db_default;

DO $$ 
DECLARE
    tabela TEXT;
BEGIN
    FOR tabela IN 
        SELECT tablename FROM pg_tables 
        WHERE schemaname = 'odonto'
    LOOP
        EXECUTE format('CREATE TABLE db_default.%I (LIKE odonto.%I INCLUDING ALL)', tabela, tabela);
        EXECUTE format('INSERT INTO db_default.%I SELECT * FROM odonto.%I', tabela, tabela);
    END LOOP;
END $$;

