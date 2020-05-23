# Bee-Api Helm Chart

## Introduction
This chart deploys the backend API for the Bee Project.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.x.+

## Installing via Helm Repo

1. Add Bee Repo
```console
helm repo add beeraspberry https://beeraspberry.github.io/helm-charts/
helm repo update
```

2. Install the chart
```console
helm install <release name> 
```

## Uninstalling via Helm Repo
```console
need instructions
```

## Configuration

The table below lists available parameters and their default values.

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `api.ReplicaCount`| Number of pods to run. | 1 |
| `api.image.repository` | The image repo to pull containers from.| beeraspberry/bee-api |
| `api.image.pullPolicy` | When to pull the image. | IfNotPresent |
| `api.imagePullSecrets` |  | [] |
| `api.volumes.name`     | Volume name used when Sqlite is the database. | bee-api-volume |
| `api.volumes.persistentVolumeClaim.claimName` | Claim name used in conjunction wtih volume names. | bee-api-claim |
| `api.volumeMounts.mountPath` | Mount path used by Sqlite | /data |
| `api.volumeMounts.name` | Mount name used by Sqlite | bee-api-volume |
| `api.database.enabled` | Enable Postgres or Mysql | true |
| `api.database.port` | Database port | 5432 |
| `api.database.username` | Database user name | beeapi |
| `api.database.password` | Database password | "" |
| `api.database.host` | Database host name | "" |
| `api.database.databaseName` | Database name | beeapi |
| `api.database.type` | Database type, mysql or postgresql | postgresql |
| `api.env` | "" | [ {name: DATABASE_DIR, value:"/data"}] |
| `api.nameOverride` | "" | "" |
| `api.fullnameOverride` | "" | "" |
| `api.persistence.enabled` | Enable to create Sqlite storage | true |
| `api.persistence.storageClass` | Storage class used by Sqlite persistence. | manual |
| `api.persistence.accessMode` | Access mode used by Sqlite persistence | ReadWriteOnce |
| `api.persistence.size` | Disk space to allocate for sqlite| 8Gi |
| `api.persistence.annotations` | Annotations to associate with the volune. | {} |
| `api.serviceAccount.create` | "" | true |
| `api.serviceAccount.annotations` | "" | {} |
| `api.serviceAccount.name` | "" | "" |
| `api.podSecurityContext` | "" | {} |
| `api.securityContext` | "" | {} |
| `api.service.type` | The service type to create for API service| ClusterIP |
| `api.service.ports` | Service ports to associate with the service. | [{ name: bee-api, port: 80, protocol: TCP, targetPort: 80}] |
| `api.nodeSelector` | "" | {} |
| `api.ingress` | "" | enabled: false |
