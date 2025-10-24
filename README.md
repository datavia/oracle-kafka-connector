# Oracle → Kafka Connector with Monitoring
### Kafka Connect · JDBC Source · Oracle DB · Prometheus · Alertmanager · Docker Compose · Vault 

---

## 🧩 Overview

This project demonstrates how to **stream data from Oracle into Kafka** using the **Kafka Connect JDBC Source Connector**, with **Prometheus** and **Alertmanager** for monitoring and alerting.

It provides a ready-to-run Dockerized setup that shows how modern data teams can build **real-time ingestion pipelines** with observability and fault detection built in.

> This example focuses on **configuration, architecture, and monitoring**.  
> To run it fully, users must supply their own Oracle database and JDBC driver.

---

## ⚙️ Architecture

```mermaid
flowchart TD
  ORA[🗄️ Oracle DB]
  KC[⚙️ Kafka Connect Worker]
  TOP[💬 Kafka Topics]
  JMX[📊 JMX Exporter]
  PROM[📈 Prometheus]
  AM[🚨 Alertmanager]
  VAULT[🔐 Vault - Secrets and Config]
  APPS[📥 Downstream Consumers / Analytics]

  ORA -->|🔗 JDBC Source Connector| KC
  KC --> TOP
  KC --> JMX
  JMX --> PROM
  PROM --> AM
  VAULT --> KC
  TOP --> APPS

  subgraph Monitoring
    JMX --> PROM --> AM
  end

  subgraph Security
    VAULT
  end

