# Instruccion

### Primero
-En base al proyecto que se creo se ejecuta el comando para crear el archetype
`shell
mvn archetype:create-from-project
`
### Segundo
-Luego que se crea el target no vamos a la ruta
`shell
cd target/generated-sources/archetype
`
### Tercero
-Instalamos de forma local(Osea nuestro computador)
`shell
mvn install
`
### Validamos
-Validamos que se haya instalado de forma local
 en el siguiente directorio "C:\Users\tu_usuario\.m2\repositor" (tu_usuario -> tu usuario real), debiera estar registrado en esta carpeta 

### cuarto
-Una vez registrado se pueden crear proyectos apartir del archetype usando como referencia el archivo cmd.sh, donde se reemplazan los parametros según corresponda
