#!/bin/bash

# Detener el script si algún comando falla
set -e

# Descripción del script
echo -e "\nEmpaquetando e instalando el arquetipo Maven...\n"

# Limpiar y empaquetar el arquetipo
mvn clean install
mvn archetype:create-from-project

# Navegar al directorio del arquetipo generado
cd target/generated-sources/archetype

# Instalar el arquetipo
echo  -e "\nInstalando...\n"
mvn install

# Verificar el arquetipo en el repositorio local
echo -e "\nVerificando el arquetipo en el repositorio local...\n"
if [ -d "$HOME/.m2/repository/com/diego/archetype/mvc/archetypemvc" ]; then
    echo -e "\nEl arquetipo se ha instalado correctamente.\n"
else
    echo -e "\nEl arquetipo no se encontró en el repositorio local. Verifica posibles errores.\n"
fi
