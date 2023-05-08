CREATE OR REPLACE PROCEDURE wal_produce_trend()
LANGUAGE plpgsql
AS $$
DECLARE
    wal_file_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO wal_file_count
    FROM pg_ls_dir('pg_wal') AS f(filename)
    WHERE filename ~ '^[0-9A-F]{24}$'
    AND (select modification from pg_stat_file('pg_wal/' || filename)) > (NOW()- interval '1 hour');
    INSERT INTO wal_trend (time, count) VALUES (now(),wal_file_count);
END;
$$;
