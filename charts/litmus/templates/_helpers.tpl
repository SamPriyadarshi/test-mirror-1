{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
<<<<<<< HEAD
{{- define "litmus.name" -}}
=======
{{- define "litmus-portal.name" -}}
>>>>>>> eb0e859e20aee51bc690b747b1b6dbfd380f19e3
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
<<<<<<< HEAD
{{- define "litmus.fullname" -}}
=======
{{- define "litmus-portal.fullname" -}}
>>>>>>> eb0e859e20aee51bc690b747b1b6dbfd380f19e3
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
<<<<<<< HEAD
{{- define "litmus.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
=======
{{- define "litmus-portal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Specify default labels
*/}}
{{- define "litmus-portal.labels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: {{ include "litmus-portal.name" . }}
app.kubernetes.io/part-of: {{ template "litmus-portal.name" . }}
app.kubernetes.io/version: "{{ .Chart.Version }}"
helm.sh/chart: {{ include "litmus-portal.chart" . }}
litmuschaos.io/version: {{ .Chart.AppVersion }}
{{- if .Values.customLabels }}
{{ toYaml .Values.customLabels }}
{{- end }}
{{- end -}}

{{/*
Specify default selectors
*/}}
{{- define "litmus-portal.selectors" -}}
app.kubernetes.io/name: {{ include "litmus-portal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Check for existing secret
*/}}

{{- define "litmus-portal.secretname" -}}
    {{ if eq .Values.existingSecret "" }}
        {{- include "litmus-portal.fullname" $}}-admin-secret
    {{ else }}
      {{- printf "%s" (tpl .Values.existingSecret $) -}}
    {{- end -}}
{{- end -}}

{{/*
 Return true if a secret object should be created
*/}}
{{- define "litmus-portal.createSecret" -}}
    {{- if .Values.existingSecret -}}
    {{ else }}
        {{ true }}
    {{- end -}}
{{- end -}}

{{- define "litmus-portal.mongodbServiceName" -}}
    {{- if not (eq .Values.mongodb.architecture "replicaset") }}
        {{- include "mongodb.fullname" .Subcharts.mongodb -}}
    {{ else }}
        {{- include "mongodb.service.nameOverride" .Subcharts.mongodb -}}
    {{- end -}}
{{- end -}}
>>>>>>> eb0e859e20aee51bc690b747b1b6dbfd380f19e3
