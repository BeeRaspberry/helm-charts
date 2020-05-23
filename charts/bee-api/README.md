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
| --- | --- | --- |
| `api.ReplicaCount`| | 1 |
| `api.image.repository` | | beeraspberry/bee-api |
| `api.image.pullPolicy` | | IfNotPresent |
| `api.imagePullSecrets` | | [] |
| `api.volumes.name`     | | bee-api-volume |
| `api.volumes.persistentVolumeClaim.claimName` |  | bee-api-claim |
| `api.volumeMounts.mountPath` | | /data |
| `api.volumeMounts.name` | | bee-api-volume |
| `api.database.enabled` | | true |
| `api.database.port` | | 5432 |
| `api.database.username` | | beeapi |
| `api.database.password` | | |
| `api.database.host` | | |
| `api.database.databaseName` | | beeapi |
| `api.database.type` | | postgresql |
| `api.env` | | [ {name: DATABASE_DIR, value:"/data"}] |
| `api.nameOverride` | | "" |
| `api.fullnameOverride` | | "" |
| `api.persistence.enabled` | | true |
| `api.persistence.storageClass` | | manual |
| `api.persistence.accessMode` | | ReadWriteOnce |
| `api.persistence.size` | | 8Gi |
| `api.persistence.annotations` | | {} |
| `api.serviceAccount.create` | | true |
| `api.serviceAccount.annotations` | | {} |
| `api.serviceAccount.name` | | "" |
| `api.podSecurityContext` | | {} |
| `api.securityContext` | | {} |
| `api.service.type` | | ClusterIP |
| `api.service.ports` | | [{ name: bee-api, port: 80, protocol: TCP, targetPort: 80}] |
| `api.ingress` | | |
     enabled: false
     annotations: {}
     # kubernetes.io/ingress.class: nginx
     # kubernetes.io/tls-acme: "true"
     hosts:
       - host: map-example.local
         paths: []
     tls: []
     # - secretName: chart-example-tls
     # hosts:
     # - chart-example.local
| `api.resources` | | |
     limits:
       cpu: 0.5
       memory: 512Mi
     requests:
       cpu: 250m
       memory: 50Mi
| `api.nodeSelector` | | {} |