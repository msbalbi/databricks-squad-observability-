# Databricks Finance Data Observability (Data-Centric Framework)

## 📌 Visão Geral do Projeto
Este projeto implementa um ecossistema de **Observabilidade de Dados Avançada** (Data Observability) focado 100% em Dados para a **Squad de Dados**, operando dentro de um cenário de **Data Mesh** e utilizando a arquitetura **Medalhão** no Databricks.

A solução substitui a dependência de APMs externos (como Datadog) centralizando a telemetria técnica e as validações de qualidade em uma **Tabela Delta de Auditoria** interna e automatizando alertas ricos diretamente no **Microsoft Teams**.

## 🏗️ Cobertura dos 5 Pilares de Observabilidade

| Pilar | Implementação Técnica neste Projeto | Status |
| :--- | :--- | :--- |
| **1. Linhagem** | Rastreamento nativo de ponta a ponta (Bronze ➡️ Silver ➡️ Gold) via **Unity Catalog**. | Nativo ✅ |
| **2. Volumetria** | Validação em tempo de execução contra anomalias ou quedas drásticas de registros. | Automatizado ✅ |
| **3. Schema Drift** | Monitoramento preventivo de quebras ou alterações de tipos de colunas de origem. | Automatizado ✅ |
| **4. Logs e Traces** | Captura do tempo de execução do Spark em segundos (`duracao_segundos`) e persistência histórica. | Centralizado ✅ |
| **5. Contrato de Dados** | Validação ativa de regras de negócio críticas financeiras antes da ingestão na camada Gold. | Automatizado ✅ |

---

## 🚀 Como Executar e Configurar

### 1. Preparação no Microsoft Teams
1. No canal desejado da Squad, configure um conector do tipo **Incoming Webhook**.
2. Copie a URL gerada e insira na variável `TEAMS_WEBHOOK_URL` do script.

### 2. Criação da Infraestrutura de Logs
Execute o script localizado em `ddl/create_audit_table.sql` no seu Databricks SQL Warehouse para provisionar a tabela Delta de monitoramento.

### 3. Integração no Databricks Workflows
1. Importe o notebook da pasta `notebooks/` para o seu workspace.
2. Adicione este notebook como uma **tarefa condicional** ao final do seu pipeline principal de finanças, ou configure os parâmetros de parametrização dinâmica (`job_name` e `run_id`) utilizando `dbutils.widgets`.

## 📊 Analytics e Dashboards (Visualização)
Consumindo a tabela `finance_governance.log_observabilidade_erros`, a squad consegue construir dashboards no **Databricks SQL Dashboard** ou **Power BI** para analisar:
* **Métrica de SLA:** Tempo médio de execução por Job.
* **Métrica de Qualidade:** Volumetria processada por dia e recorrência de quebras de contratos de negócio.
* **Métrica de Disponibilidade:** Gráfico de volumetria de sucesso vs. falhas.
