#!/bin/bash

# Script para el despliegue de un template de Cloudformation 

# Exit on error
set -e

# Variables de entorno
. ./01-enviroment-rds.sh

# Variables de configuración de Cloudformation
. ./01-config-rds.sh

aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --profile $PROFILE \
    --stack-name $STACK_NAME \
    --region $REGION \
    --parameter-overrides $PARAMETERSFILE

