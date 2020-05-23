# BeeRaspberry Helm Chart Repo

## Introduction
This repo holds the Helm Charts for the BeeRaspberry organization.

There's two sub-charts to the Repo. 

- [bee-api](charts/bee-api/) provides the charts for building the Bee backend.
- [bee-ui](charts/bee-ui/) charts the Bee front-end.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.x.+

## Installing via Helm Repo

1. Add Bee Repo
```console
helm repo add beeraspberry https://beeraspberry.github.io/helm-charts/
helm repo update
```