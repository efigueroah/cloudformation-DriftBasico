#!/bin/bash

# STACK_NAME - nombre de la pila o stack a crear o actualizar
# TEMPLATE_FILE - archivo de plantilla en formato YAML

export STACK_NAME='eifh-RDS-DriftStack'
export TEMPLATE_FILE='01-database-template.yaml'

# PARAMETESOVERRIDE - Archivos de parametros de entrada del template en formato JSON
export PARAMETERSFILE='file://parameters.json'

