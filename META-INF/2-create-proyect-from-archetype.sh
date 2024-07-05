#!/bin/bash

# Detener el script si algún comando falla
set -e

# valores del arquetipo
A_GROUP_ID="com.diego.archetype.mvc"
A_ARTIFACT_ID="archetypemvc-archetype"
A_VERSION="0.0.1-SNAPSHOT"

# valores del nuevo proyecto
P_PACKAGE_NAME="com.diego.cotizador"
P_PROJECT_NAME="cotizador-transporte"
P_VERSION="1.0.0-SNAPSHOT"


# Verificar si el proyecto ya existe
if [ -d "$P_PROJECT_NAME" ]; then
    read -p "El proyecto '$P_PROJECT_NAME' ya existe. ¿Deseas eliminarlo y continuar? (s/n): " confirm
    if [ "$confirm" = "s" ]; then
        rm -rf "$P_PROJECT_NAME"
        echo -e "\nEl proyecto '$P_PROJECT_NAME' ha sido eliminado.\n"
    else
        echo -e "\nOperación cancelada.\n"
        exit 1
    fi
fi

# Paso 4: Usar el arquetipo para crear un nuevo proyecto
echo -e "\nCreando un nuevo proyecto a partir del arquetipo...\n"
mvn archetype:generate \
    -DarchetypeCatalog=local \
    -DarchetypeGroupId=${A_GROUP_ID} \
    -DarchetypeArtifactId=${A_ARTIFACT_ID} \
    -DarchetypeVersion=${A_VERSION} \
    -DgroupId=${P_PACKAGE_NAME} \
    -DartifactId=${P_PROJECT_NAME} \
    -Dversion=${P_VERSION}\
    -DinteractiveMode=false

echo -e "\nProceso completado. Proyecto generado con éxito.\n"

if [ -d "$P_PROJECT_NAME" ]; then
    read -p "¿Deseas abrir proyecto '$P_PROJECT_NAME' ? (s/n): " confirm
    if [ "$confirm" = "s" ]; then
        echo -e "\nAbriendo proyecto '$P_PROJECT_NAME'.\n"
        code "$P_PROJECT_NAME"
    fi
fi
