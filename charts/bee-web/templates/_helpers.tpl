{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "bee-web.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bee-web.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bee-web.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "bee-web.labels" -}}
helm.sh/chart: {{ include "bee-web.chart" . }}
{{ include "bee-web.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app: {{ .Chart.Name }}
chart: {{ include "bee-web.chart" . }}
release: {{ .Release.Name }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "bee-web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bee-web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "bee-ui.serviceAccountName" -}}
{{- if .Values.beeUi.serviceAccount.create -}}
    {{ printf "%s-ui" (default (include "bee-web.fullname" .) .Values.beeUi.serviceAccount.name) }}
{{- else -}}
    {{ default "default" .Values.beeUi.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "bee-api.serviceAccountName" -}}
{{- if .Values.beeApi.serviceAccount.create -}}
    {{ printf "%s-api" (default (include "bee-web.fullname" .) .Values.beeApi.serviceAccount.name) }}
{{- else -}}
    {{ default "default" .Values.beeApi.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "bee-web.backend-api" -}}
{{- if .Values.backend_api.host -}}
{{- printf "%s://%s:%s" .Values.backend_api.protocol .Values.backend_api.host .Values.backend_api.port -}}
{{- else -}}
{{/*- printf "%s://%s:%s" .Values.backend_api.protocal (include "bee-web.fullname" .) .Values.backend_api.port -*/}}
{{- printf "%s://%s:%s" .Values.backend_api.protocol (include "bee-web.fullname" .) .Values.backend_api.port -}}
{{- end -}}
{{- end -}}