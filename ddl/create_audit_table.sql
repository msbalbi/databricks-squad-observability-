CREATE SCHEMA IF NOT EXISTS hive_metastore.finance_governance;

CREATE TABLE IF NOT EXISTS hive_metastore.finance_governance.log_observabilidade_erros (
    timestamp_evento TIMESTAMP,
    job_name STRING,
    run_id STRING,
    squad STRING,
    status_execucao STRING,
    tipo_incidente STRING,
    mensagem STRING,
    duracao_segundos DOUBLE,
    link_databricks STRING
) USING DELTA;
