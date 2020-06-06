# BeeRaspberry Helm Chart Repo

## Introduction
This repo holds the Helm Charts for the BeeRaspberry organization.

There's two sub-charts to the Repo. 

- [bee-api](charts/bee-api/README,md) provides the charts for building the Bee backend.
- [bee-ui](charts/bee-ui/README.md) charts the Bee front-end.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.x.+

## Installing via Helm Repo

```console
helm repo add beeweb https://beeraspberry.github.io/helm-charts/
helm repo update
helm install <release name> beeweb/bee-web -n <namespace>
```

| Parameter | Description    | Default |
| --------- | -------------- | ------- |
| `ReplicaCount`| Number of pods to run. | 1 |
| `image.repository` | The image repo to pull containers from.| beeraspberry/bee-ui |
| `image.pullPolicy` | When to pull the image. | IfNotPresent |
| `imagePullSecrets` |  | [] |
| `nameOverride` |  |  |
| `fullnameOverride` |  |  |
| `serviceAccount.create` |  | true |
| `serviceAccount.annotations` |  | {} |
| `serviceAccount.name` |  |  |
| `podSecurityContext` |  | {} |
| `securityContext` |  | {} |
| `service.type` | The service type to create for ui service| ClusterIP |
| `service.ports` | Service ports to associate with the service. | [{ name: bee-ui, port: 80, protocol: TCP, targetPort: 80}] |
| `nodeSelector` |  | {} |
| `ingress` |  | enabled: false<br>     annotations: {}<br> # kubernetes.io/ingress.class: nginx <br># kubernetes.io/tls-acme: "true" <br>     hosts: <br>       - host: map-example.local <br>         paths: [] <br>     tls: [] <br>     # - secretName: chart-example-tls <br>     # hosts: <br>     # - chart-example.local |
| `resources` | Resources assigned to the pod |      limits: <br>        cpu: 0.5 <br>        memory: 512Mi <br>     requests: <br>        cpu: 250m <br>        memory: 50Mi |
| `tolerations` |  | [] |
| `affinity` |  | {} |
| `frontend.enabled` |  | false |
| `backend_ui.host` | The host name to connect to backend. The NGINX pod redirects to the api service.  | localhost |
| `backend_ui.port` | Similar to host above except for port | 80 |
| `backend_ui.protocol` | Protocol used to connect to API backend | http |
| `env` |  | [ {<br>name: DEBUG, value:"false"<br>name: PRODUCTION, value: "true"<br>name: SERVICE_NAME, value: "http://localhost"<br>name: PORT, value: "80"<br>name: DOMAIN_NAME, value: localhost<br>}] |