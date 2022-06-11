{{/*
Expand the name of the chart.
*/}}
{{- define "delta-force.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "delta-force.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Controller labels.
*/}}
{{- define "delta-force.labels" -}}
helm.sh/chart: {{ include "delta-force.chart" . }}
{{ include "delta-force.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Controller Selector labels.
*/}}
{{- define "delta-force.selectorLabels" -}}
app.kubernetes.io/name: {{ include "delta-force.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
