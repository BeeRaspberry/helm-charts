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
helm install <release name> . -n <release namespace>
# For example
helm install beeweb . -n bee-namespace
```

## Uninstalling via Helm Repo
```console
need instructions
```

## Configuration

The table below lists available parameters and their default values.

Parameter | Description | Default
--- | --- | ---
`ReplicaCount`| | 1
`image.repository` | | beeraspberry/bee-api
`image.pullPolicy` | | IfNotPresent
`imagePullSecrets` | | []
`volumes.name`     | | bee-api-volume
`volumes.persistentVolumeClaim.claimName` |  | bee-api-claim
`volumeMounts.mountPath` | | /data
`volumeMounts.name` | | bee-api-volume
`database.enabled` | | true
`database.port` | | 5432
`database.username` | | beeapi
`database.password` | |
`database.host` | |
`database.databaseName` | | beeapi
`database.type` | | postgresql
`env` | | [ {name: DATABASE_DIR, value:"/data"}]
`nameOverride` | | ""
`fullnameOverride` | | ""
`persistence.enabled` | | true
`persistence.storageClass` | | manual
`persistence.accessMode` | | ReadWriteOnce
`persistence.size` | | 8Gi
`persistence.annotations` | | {}
`serviceAccount.create` | | true
`serviceAccount.annotations` | | {}
`serviceAccount.name` | | ""
`podSecurityContext` | | {}
`securityContext` | | {}
`service.type` | | ClusterIP
`service.ports` | | [{ name: bee-api, port: 80, protocol: TCP, targetPort: 80}]
`ingress` | |
 enabled: false
 annotations: {}
 # kubernetes.io/ingress.class: nginx
 # kubernetes.io/tls-acme: "true"
 hosts:
   - host: map-example.local
     paths: []
 tls: []
  #- secretName: chart-example-tls
`resources` | |
 limits:
   cpu: 0.5
   memory: 512Mi
 requests:
   cpu: 250m
   memory: 50Mi
`nodeSelector` | | {}