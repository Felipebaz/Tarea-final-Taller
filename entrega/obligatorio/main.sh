#!/bin/bash

#Pablo Gonzalez 341209 - Felipe Baz 328217

### Toda la explicacion extensa se encuentra en .pdf ###


#ejecucion de los scripts.
source users.sh
source entrega.sh
source dictionary.sh
source algorithms.sh

#echo utilizado para imprimir texto
echo "Autenticación requerida"
#invocacion de la funcion
authenticate_user

#loop para mostrar el menu despues de cada funcion
while true; do
    entrega
done
