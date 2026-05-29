-- 1. Taxa de Sucesso vs Falha (Métrica de Disponibilidade)
SELECT status_execucao, COUNT(1) as total 
FROM hive_metastore.finance_governance.log_observabilidade_erros
GROUP BY status_execucao;

-- 2. Volumetria e Alertas de SLAs de Tempo por dia
SELECT 
    DATE(timestamp_evento) as data,
    AVG(duracao_segundos) as tempo_medio_segundos,
    COUNT(CASE WHEN status_execucao = 'FAILED' THEN 1 END) as total_incidentes
FROM hive_metastore.finance_governance.log_observabilidade_erros
GROUP BY DATE(timestamp_evento)
ORDER BY data DESC;
