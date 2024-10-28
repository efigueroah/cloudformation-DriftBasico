#!/bin/bash

# Script para el despliegue de un template de Cloudformation 

# Exit on error
set -e

# Variables de entorno
. ./enviroment-drift.sh

# Variables de configuración de Cloudformation
. ./config-drift.sh

#    --profile $PROFILE \
#    --stack-name $STACK_NAME \
#    --region $REGION \
    
#!/bin/bash

# Function to check for errors and print informative messages
check_error () {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Ejemplo de listar todos los stacks en un estado solicitado asignamos los valores a la variable stacks
# stacks=$(aws cloudformation list-stacks --profile $PROFILE --region $REGION --stack-status-filter CREATE_COMPLETE ROLLBACK_COMPLETE UPDATE_COMPLETE UPDATE_ROLLBACK_COMPLETE --query 'StackSummaries[].StackName' --output text)

stacks=$STACKS

# Iterate over each stack and check for drift
for stack in $stacks; do
    echo "Checking drift for stack: $stack"
    aws cloudformation detect-stack-drift  --profile $PROFILE --region $REGION --stack-name "$stack"
    aws cloudformation describe-stack-resource-drifts  --profile $PROFILE --region $REGION --stack-name "$stack" --stack-resource-drift-status-filters MODIFIED DELETED
    check_error "No se pudo detectar Desviaciones para el stack $stack"
done

echo "Proceso de detectar desviaciones finalizo para todos los stacks"    
    
