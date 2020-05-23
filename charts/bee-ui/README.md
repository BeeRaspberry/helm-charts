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
need instructions
```

## Configuration

The table below lists available parameters and their default values.

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `ui.ReplicaCount`| Number of pods to run. | 1 |
| `ui.image.repository` | The image repo to pull containers from.| beeraspberry/bee-ui |
| `ui.image.pullPolicy` | When to pull the image. | IfNotPresent |
| `ui.imagePullSecrets` |  | [] |
| `ui.nameOverride` |  |  |
| `ui.fullnameOverride` |  |  |
| `ui.serviceAccount.create` |  | true |
| `ui.serviceAccount.annotations` |  | {} |
| `ui.serviceAccount.name` |  |  |
| `ui.podSecurityContext` |  | {} |
| `ui.securityContext` |  | {} |
| `ui.service.type` | The service type to create for ui service| ClusterIP |
| `ui.service.ports` | Service ports to associate with the service. | [{ name: bee-ui, port: 80, protocol: TCP, targetPort: 80}] |
| `ui.nodeSelector` |  | {} |
| `ui.ingress` |  | enabled: false<br>     annotations: {}<br> # kubernetes.io/ingress.class: nginx <br># kubernetes.io/tls-acme: "true" <br>     hosts: <br>       - host: map-example.local <br>         paths: [] <br>     tls: [] <br>     # - secretName: chart-example-tls <br>     # hosts: <br>     # - chart-example.local |
| `ui.resources` | Resources assigned to the pod |      limits: <br>        cpu: 0.5 <br>        memory: 512Mi <br>     requests: <br>        cpu: 250m <br>        memory: 50Mi |
| `ui.tolerations` |  | [] |
| `ui.affinity` |  | {} |
| `ui.frontend.enabled` |  | false |
| `ui.backend_ui.host` | The host name to connect to backend. The NGINX pod redirects to the api service.  | localhost |
| `ui.backend_ui.port` | Similar to host above except for port | 80 |
| `ui.backend_ui.protocol` | Protocol used to connect to API backend | http |
| `ui.env` |  | [ {<br>name: DEBUG, value:"false"<br>name: PRODUCTION, value: "true"<br>name: SERVICE_NAME, value: "http://localhost"<br>name: PORT, value: "80"<br>name: DOMAIN_NAME, value: localhost<br>}] |
