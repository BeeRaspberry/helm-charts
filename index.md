# BeeRaspberry Helm Chart Repo

## Introduction
This repo holds the Helm Chart for the BeeRaspberry organization.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.x.+

## Installing via Helm Repo

1. Add Bee Repo

```console
helm repo add beeraspberry https://beeraspberry.github.io/helm-charts/
helm repo update
```

2. Install the chart via Chart Repo

```console
helm install <release name>
```

## Uninstalling via Helm Repo

```console
helm delete <release name>
```

## Configuration

The table below lists available parameters and their default values.

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `cluster.podsecuritypolicy.create`| Create pod security policy | false |
| `beeApi.ReplicaCount`| Number of BeeApi service pods to run. | 1 |
| `beeApi.image.repository` | The image repo to pull Bee Api image from.| beeraspberry/bee-api |
| `beeApi.image.version` | The Bee Api image version to pull containers from. It's recommended to ping to a version <br> instead of using `latest`.| latest |
| `beeApi.image.pullPolicy` | When to pull the image.| Always |
| `beeApi.imagePullSecrets` | Credentials to use to pull the image. | [] |
| `beeApi.database.enabled` | Enable database to store data. | true |
| `beeApi.database.port` | Port the database is running on | 5432 |
| `beeApi.database.username` | User id to connect to the database with | test |
| `beeApi.database.password` | Password associated with user id to connect to the database | test |
| `beeApi.database.databaseName` | Database name | beeapi |
| `beeApi.database.type` | Type of database. (sqlite, postgresql, mysql) | postgresql |
| `beeApi.persistence.storageClass` | Storage class used for persistent storage whn sqlite is the database |  |
| `beeApi.persistence.accessMode` | Storage class used for persistent storage whn sqlite is the database | manual |
| `beeApi.persistence.size` | Storage class used for persistent storage whn sqlite is the database | manual |
| `beeApi.persistence.annontations` | Storage class used for persistent storage whn sqlite is the database | manual |
| `beeApi.nameOverride` |  |  |
| `beeApi.fullnameOverride` |  |  |
| `beeApi.serviceAccount.create` |  | true |
| `beeApi.serviceAccount.annotations` |  | {} |
| `beeApi.serviceAccount.name` |  |  |
| `beeApi.podSecurityContext` |  | {} |
| `beeApi.securityContext` |  | {} |
| `beeApi.service.type` | The service type to create for ui service| ClusterIP |
| `beeApi.service.ports` | Service ports to associate with the service. | [{ name: bee-ui, port: 80, protocol: TCP, targetPort: 80}] |
| `beeApi.nodeSelector` |  | {} |
| `beeApi.ingress` |  | enabled: false<br>     annotations: {}<br> # kubernetes.io/ingress.class: nginx <br># kubernetes.io/tls-acme: "true" <br>     hosts: <br>       - host: map-example.local <br>         paths: [] <br>     tls: [] <br>     # - secretName: chart-example-tls <br>     # hosts: <br>     # - chart-example.local |
| `beeApi.resources` | Resources assigned to the pod |      limits: <br>        cpu: 0.5 <br>        memory: 512Mi <br>     requests: <br>        cpu: 250m <br>        memory: 50Mi |
| `beeApi.tolerations` |  | [] |
| `beeApi.affinity` |  | {} |
| `beeApi.frontend.enabled` |  | false |
| `beeApi.backend_ui.host` | The host name to connect to backend. The NGINX pod redirects to the api service.  | localhost |
| `beeApi.backend_ui.port` | Similar to host above except for port | 80 |
| `beeApi.backend_ui.protocol` | Protocol used to connect to API backend | http |
| `beeApi.env` |  | [ {<br>name: DEBUG, value:"false"<br>name: PRODUCTION, value: "true"<br>name: SERVICE_NAME, value: "http://localhost"<br>name: PORT, value: "80"<br>name: DOMAIN_NAME, value: localhost<br>}] |
| `beeUi.ReplicaCount`| Number of BeeUi service pods to run. | 1 |
| `beeUi.image.repository` | The image repo to pull Bee Ui image from.| beeraspberry/bee-ui |
| `beeUi.image.version` | The Bee Ui image version to pull containers from. It's recommended to ping to a version <br> instead of using `latest`.| latest |
| `beeUi.image.pullPolicy` | When to pull the image.| Always |
| `beeUi.imagePullSecrets` | Credentials to use to pull the image. | [] |
| `beeUi.nameOverride` |  |  |
| `beeUi.fullnameOverride` |  |  |
| `beeUi.serviceAccount.create` |  | true |
| `beeUi.serviceAccount.annotations` |  | {} |
| `beeUi.serviceAccount.name` |  |  |
| `beeUi.podSecurityContext` |  | {} |
| `beeUi.securityContext` |  | {} |