{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "lemp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lemp.fullname" -}}
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
{{- define "lemp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "lemp.labels" -}}
helm.sh/chart: {{ include "lemp.chart" . }}
{{ include "lemp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
lemp.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
lemp.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "lemp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lemp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "lemp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "lemp.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "lemp.ingress.annotations" -}}
{{- with .Values.ingress.annotations }}
{{- toYaml . }} 
{{- end }}
{{- if .Values.ingress.enabledLetsEncrypt}}
kubernetes.io/tls-acme: "true"
cert-manager.io/cluster-issuer: letsencrypt-prod
{{- end }}
{{- if .Values.security.basicAuthentication.enabled }}
konghq.com/plugins: {{ include "lemp.fullname" . }}
{{- end }}
{{- end -}}