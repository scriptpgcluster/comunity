-- Create roles and tableSpace

CREATE ROLE admin LOGIN PASSWORD 'admin' SUPERUSER NOINHERIT CREATEDB;
CREATE TABLESPACE admintable OWNER postgres LOCATION '/opt/Postgresql/admintable';
GRANT CREATE ON TABLESPACE admintable TO admin;
CREATE ROLE replicator_bbdd LOGIN REPLICATION ENCRYPTED PASSWORD 'replicator_bbdd';
GRANT pg_monitor TO replicator_bbdd;
GRANT pg_read_server_files TO replicator_bbdd;
GRANT EXECUTE ON FUNCTION pg_read_binary_file(text), pg_read_binary_file(text, bigint, bigint, boolean), pg_stat_file(text, boolean), pg_ls_dir(text, boolean, boolean) TO replicator_bbdd;
