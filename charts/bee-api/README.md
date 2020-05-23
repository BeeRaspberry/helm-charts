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
