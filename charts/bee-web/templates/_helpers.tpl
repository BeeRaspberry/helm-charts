{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "bee-ui.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bee-ui.fullname" -}}
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
{{- define "bee-ui.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "bee-ui.labels" -}}
helm.sh/chart: {{ include "bee-ui.chart" . }}
{{ include "bee-ui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app: {{ .Chart.Name }}
chart: {{ include "bee-ui.chart" . }}
release: {{ .Release.Name }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "bee-ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bee-ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "bee-ui.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "bee-ui.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "bee-ui.backend-api" -}}
{{- if .Values.backend_api.host -}}
{{- printf "%s://%s:%s" .Values.backend_api.protocol .Values.backend_api.host .Values.backend_api.port -}}
{{- else -}}
{{/*- printf "%s://%s:%s" .Values.backend_api.protocal (include "bee-ui.fullname" .) .Values.backend_api.port -*/}}
{{- printf "%s://%s:%s" .Values.backend_api.protocol (include "bee-ui.fullname" .) .Values.backend_api.port -}}
{{- end -}}
{{- end -}}