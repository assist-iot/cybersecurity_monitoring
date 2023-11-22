{{/*
Expand the name of the chart.
*/}}
{{- define "enabler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "enabler.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "enabler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Cilium Multi-cluster global service annotations
*/}}
{{- define "globalServiceAnnotations" -}}
io.cilium/global-service: "true"
io.cilium/service-affinity: remote
{{- end }}

{{/*
Name of the component wazuh.
*/}}
{{- define "wazuh.name" -}}
{{- printf "%s-wazuh" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component wazuh name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wazuh.fullname" -}}
{{- printf "%s-wazuh" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the default FQDN for wazuh headless service.
*/}}
{{- define "wazuh.svc.headless" -}}
{{- printf "%s-headless" (include "wazuh.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component wazuh labels
*/}}
{{- define "wazuh.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "wazuh.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component wazuh selector labels
*/}}
{{- define "wazuh.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: wazuh
isMainInterface: "yes"
tier: {{ .Values.wazuh.tier }}
{{- end }}

{{/*
Return the Elasticsearch URL
*/}}
{{- define "wazuh.elasticsearchUrl" -}}
{{- printf "https://%s:%d" (include "elasticsearch.fullname" .) (.Values.elasticsearch.service.ports.api.port | int) -}}
{{- end -}}

{{/*
Return the Wazuh URL
*/}}
{{- define "kibana.wazuhUrl" -}}
{{- printf "https://%s" (include "wazuh.fullname" .)  -}}
{{- end -}}

{{/*
Name of the component elasticsearch.
*/}}
{{- define "elasticsearch.name" -}}
{{- printf "%s-elasticsearch" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component elasticsearch name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "elasticsearch.fullname" -}}
{{- printf "%s-elasticsearch" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the default FQDN for elasticsearch headless service.
*/}}
{{- define "elasticsearch.svc.headless" -}}
{{- printf "%s-headless" (include "elasticsearch.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component elasticsearch labels
*/}}
{{- define "elasticsearch.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "elasticsearch.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component elasticsearch selector labels
*/}}
{{- define "elasticsearch.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: elasticsearch
isMainInterface: "no"
tier: {{ .Values.elasticsearch.tier }}
{{- end }}

{{/*
Name of the component kibana.
*/}}
{{- define "kibana.name" -}}
{{- printf "%s-kibana" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component kibana name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kibana.fullname" -}}
{{- printf "%s-kibana" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component kibana labels
*/}}
{{- define "kibana.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "kibana.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component kibana selector labels
*/}}
{{- define "kibana.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: kibana
isMainInterface: "no"
tier: {{ .Values.kibana.tier }}
{{- end }}

