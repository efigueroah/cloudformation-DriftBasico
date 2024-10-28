#!/bin/bash

# STACK_NAME - nombre de la pila o stack a crear o actualizar
# TEMPLATE_FILE - archivo de plantilla en formato YAML

export STACK_NAME='eifh-VPC-DriftStack'
export TEMPLATE_FILE='00-vpc-template.yaml'

# PARAMETESOVERRIDE - Archivos de parametros de entrada del template en formato JSON
export PARAMETERSOVERRIDE='file://parameters.json'

