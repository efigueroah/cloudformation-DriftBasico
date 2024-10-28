#!/bin/bash

# Script para el despliegue de un template de Cloudformation 

# Exit on error
set -e

# Variables de entorno
. ./00-enviroment-vpc.sh

# Variables de configuración de Cloudformation
. ./00-config-vpc.sh

aws cloudformation update-stack \
    --template-file $TEMPLATE_FILE \
    --profile $PROFILE \
    --stack-name $STACK_NAME \
    --region $REGION
    
# Descomentar la siguiente linea si se van a pasar parametros
#    --parameter-overrides $PARAMETERSFILE
    
