# BeeRaspberry Helm Chart Repo

![Remote Dispatch Action Responder](https://github.com/BeeRaspberry/helm-charts/workflows/Remote%20Dispatch%20Action%20Responder/badge.svg)
![build](https://github.com/BeeRaspberry/helm-charts/workflows/build/badge.svg)

## Introduction
This repo holds the Helm Charts for the BeeRaspberry organization.

There's two sub-charts to the Repo. 

- [bee-api](charts/bee-api/README.md) provides the charts for building the Bee backend.
- [bee-ui](charts/bee-ui/README.md) charts the Bee front-end.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.x.+

## Optional

A relation database for storing data. The Helmchart defaults to Sqlite suffiences for single pod deployments. For scalable options, a relation database is the way to go.

## Installing via Helm Repo with default, Sqlite database.

1. Add Bee Repo
```console
helm repo add beeraspberry https://beeraspberry.github.io/helm-charts/
helm repo update
```

2. 

## Installing via Helm Repo with a relation database solution.

1. Add Bee Repo
```console
helm repo add beeraspberry https://beeraspberry.github.io/helm-charts/
helm repo update
```

2. Add Database Repo
```console
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

3. Install Database (how to create user for the bee api?)
```console
# Install Postgres
helm install <name> bitnami/postgresql -n <name space>
# Install mysql
helm install <name> bitnami/mysql -n <name space>
```

4. Install Bee Api
```console
helm install <name> beeraspberry/bee-api -n <name space>
# override the following values:
```

5. Install Bee Web
```console
helm install <name> beeraspberry/bee-ui -n <name space>
```