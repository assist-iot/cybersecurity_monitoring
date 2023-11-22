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
Cilium Multi-cluster global service annotations.
*/}}
{{- define "globalServiceAnnotations" -}}
io.cilium/global-service: "true"
io.cilium/service-affinity: remote
{{- end }}

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
Component elasticsearch labels.
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
Component elasticsearch selector labels.
*/}}
{{- define "elasticsearch.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: elasticsearch
isMainInterface: "yes"
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
Component kibana labels.
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
Component kibana selector labels.
*/}}
{{- define "kibana.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: kibana
isMainInterface: "no"
tier: {{ .Values.kibana.tier }}
{{- end }}

{{/*
Name of the component cortex.
*/}}
{{- define "cortex.name" -}}
{{- printf "%s-cortex" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component cortex name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cortex.fullname" -}}
{{- printf "%s-cortex" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the default FQDN for cortex headless service.
*/}}
{{- define "cortex.svc.headless" -}}
{{- printf "%s-headless" (include "cortex.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component cortex labels.
*/}}
{{- define "cortex.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "cortex.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component cortex selector labels.
*/}}
{{- define "cortex.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: cortex
isMainInterface: "no"
tier: {{ .Values.cortex.tier }}
{{- end }}

{{/*
Name of the component cassandra.
*/}}
{{- define "cassandra.name" -}}
{{- printf "%s-cassandra" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component cassandra name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cassandra.fullname" -}}
{{- printf "%s-cassandra" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the default FQDN for cassandra headless service.
*/}}
{{- define "cassandra.svc.headless" -}}
{{- printf "%s-headless" (include "cassandra.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component cassandra labels.
*/}}
{{- define "cassandra.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "cassandra.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component cassandra selector labels.
*/}}
{{- define "cassandra.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: cassandra
isMainInterface: "no"
tier: {{ .Values.cassandra.tier }}
{{- end }}

{{/*
Name of the component thehive4.
*/}}
{{- define "thehive4.name" -}}
{{- printf "%s-thehive4" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component thehive4 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "thehive4.fullname" -}}
{{- printf "%s-thehive4" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the default FQDN for thehive4 headless service.
*/}}
{{- define "thehive4.svc.headless" -}}
{{- printf "%s-headless" (include "thehive4.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component thehive4 labels.
*/}}
{{- define "thehive4.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "thehive4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component thehive4 selector labels.
*/}}
{{- define "thehive4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: thehive4
isMainInterface: "no"
tier: {{ .Values.thehive4.tier }}
{{- end }}

