# Introduction 
Collection of platform tools 
- util/rh-cve-parser - Reads CVEs from the security api of Redhat and filters on Openshift 4.10 issues.
- generate-project for creating utility scripts in general

kubectl patch -f cron.yaml --type=json -p='[{"op":"replace", "path": "/spec/jobTemplate/spec/template/spec/containers/0/image", "value":"phiroict/rh_cve_parser_aro:20230212.1"}]' 