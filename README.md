Práctica de Drifting en AWS CloudFormation
Introducción

Esta práctica te guiará a través del proceso de detección y corrección de desviaciones (drift) en stacks de AWS CloudFormation. Aprenderás a configurar tu entorno de trabajo, desplegar recursos, inducir cambios manuales y automatizar la detección de drift.


Configuración del Entorno

    Configurar la AWS CLI:
        Credenciales: Asegúrate de tener las credenciales de acceso correctas para tu cuenta de AWS.
        Perfil: Crea un perfil en la AWS CLI para esta práctica y configúralo con tus credenciales.
        Bash

        aws configure

        Usa el código con precaución.

Login SSO (si aplica):
Bash

aws sso login --profile <tu_perfil>



Usa el código con precaución.

    Clonar el Repositorio: Clona este repositorio en tu máquina local.

Estructura del Proyecto

drift/
  check-drifts.sh
  config-drift.sh
  enviroment-drift.sh
rds/
  01-config-rds.sh
  01-database-template.yaml
  01-deploy-rds.sh
  01-enviroment-rds.sh
  01-update-rds.sh
  parameters.json
vpc/
  00-config-vpc.sh
  00-deploy-vpc.sh
  00-enviroment-vpc.sh
  00-update-vpc.sh
  00-vpc-template.yaml
  parameters.json

    drift: Contiene scripts para la detección de drift.
    rds: Contiene scripts y plantillas para el despliegue y gestión de una instancia RDS.
    vpc: Contiene scripts y plantillas para el despliegue de una VPC.

Configuración de los Scripts

    enviroment.sh: Define las variables de entorno como PROFILE y REGION.
    config.sh: Define variables comunes como STACK_NAME, TEMPLATE_FILE, y PARAMETERSOVERRIDE.
    parameters.json: Contiene los parámetros de entrada para las plantillas CloudFormation.

Despliegue de los Recursos

    VPC: Ejecuta sh ./vpc/00-deploy-vpc.sh para desplegar la VPC
      verificacion: aws ec2 describe-vpcs --profile '<usar_profile_creado>'
      
    RDS: Ejecuta sh ./rds/01-deploy-rds.sh para desplegar la instancia RDS.
      verificacion: aws rds describe-db-instances --profile '<usar_profile_creado>'


Inducción de Cambios y Detección de Drift

    Cambios Manuales: Realiza cambios en los recursos de la pila (e.g., modificar un parámetro de la instancia RDS) utilizando la consola de AWS.
    Detección de Drift: Ejecuta sh ./drift/check-drifts.sh para detectar desviaciones en las pilas.

Automatización de Pruebas

    Scripts de Drift: Los scripts en el directorio drift automatizan la detección de drift.



Consideraciones Adicionales

    Seguridad: Asegúrate de utilizar claves de acceso y perfiles con permisos mínimos necesarios.
    Limpieza: Al finalizar la práctica, elimina los recursos creados para evitar costos innecesarios.
    Profundización: Explora opciones más avanzadas como la detección de drift en recursos individuales, la integración con herramientas de monitoreo y la creación de alertas.

Recomendaciones:

    Documentación: Proporciona una documentación más detallada sobre los scripts y su funcionamiento.
    Ejemplos: Incluye ejemplos concretos de cambios que se pueden realizar para inducir drift y cómo detectarlos.
    Visualización: Utiliza diagramas o gráficos para explicar la arquitectura y el flujo de la práctica.
    Mejores Prácticas: Resalta las mejores prácticas para la gestión de stacks de CloudFormation y la prevención de drift.

Preguntas:

    ¿Qué cambios específicos deseas realizar en los recursos para inducir drift?
    ¿Qué herramientas de monitoreo planeas utilizar para complementar la detección de drift?
    ¿Qué nivel de automatización deseas alcanzar?

Al seguir estas pautas y personalizar la práctica según tus necesidades, podrás adquirir una sólida comprensión de los conceptos de drift en AWS CloudFormation y las mejores prácticas para gestionarlo.


aws rds describe-db-instances --profile HG-AWSTest-385912780816


cd sandbox/aws/CursoCloudFormation/Templates-DriftBasico
sh ./01-deploy-rds.sh
sh ./01-update-rds.sh





