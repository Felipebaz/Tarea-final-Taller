#!/bin/bash
#Pablo Gonzalez 341209 - Felipe Baz 328217

#pide, captura y muestra la letra inicial
config_home_letter() {

    echo "Ingresar letra de incio:"
    read start_letter

    #bucle que asegura la entrada de un dato valido
    while [[ "$star_letter" =~ [^a-zA-Z] ]]; do
        echo "Ingrese carácteres válidos:"
        read start_letter
    done

    #devuelva los resultados aunque el usuario busque palabras con letras mayuscula
    start_letter=$(echo "$start_letter" | tr 'A-Z' 'a-z')

    #muestra la letra inicial
    echo "Letra inicial: '$start_letter'."

}

#pide, captura y muestra la letra contenida
config_contained_letter() {

    echo "Ingresar letra contenida:"
    read contained_letter

    while [[ "$contained_letter" =~ [^a-zA-Z] ]]; do
        echo "Ingrese carácteres válidos:"
        read contained_letter
    done

    contained_letter=$(echo "$contained_letter" | tr 'A-Z' 'a-z')

    echo "Letra contenida: '$contained_letter'."

}

#pide, captura y muestra la letra de fin
config_end_letter() {

    echo "Ingresar letra de fin:"
    read end_letter

    while [[ "$end_letter" =~ [^a-zA-Z] ]]; do
        echo "Ingrese carácteres válidos:"
        read end_letter
    done

    end_letter=$(echo "$end_letter" | tr 'A-Z' 'a-z')

    echo "Letra de fin: '$end_letter'."

}

#busca la palabra con la letra inicial, contenida y de fin indicadas
lookup_dictionary() {

    #guarda la fecha en el formato YYYY-mm-dd en la variable
    execution_date=$(date "+%Y-%m-%d")

    #utiliza la funcion creada en authenticate_user para obtener el nombre del usuario
    registered_user=$user_name

    #cuenta el total de lineas en el archivo diccionario y lo guarda en la variable
    total_words=$(wc -l < diccionario_utf8.txt)

    #cuenta el numero de palabras que cumplan con el patron especifico
    matched_words=$(grep -cE "^$start_letter.*$contained_letter.*$end_letter$" diccionario_utf8.txt)

    #calcula el porcentaje de palabras que cumplen los criterios especificados
    percentage=$(awk "BEGIN {printf \"%.2f\", ($matched_words / $total_words) * 100}")

    #guarda las palabras que cumplen con los criterios
    list_words=$(grep "^$start_letter.*$contained_letter.*$end_letter$" diccionario_utf8.txt)

    #todos los datos obtenidos los escribe en el archivo informe.txt
    echo "Informe de consulta del diccionario - $execution_date" > informe.txt
    echo "Fecha de ejecución del informe: $execution_date" >> informe.txt
    echo "Cantidad de palabras totales en el diccionario: $total_words" >> informe.txt
    echo "Cantidad de palabras que cumplen los criterios: $matched_words" >> informe.txt
    echo "Porcentaje de palabras que cumplen los criterios: $percentage%" >> informe.txt
    echo "Nombre de usuario registrado: $registered_user" >> informe.txt

    #lista las palabras en el archivo informe.txt
    echo "------------------------------------------------" >> informe.txt
    echo "$list_words" >> informe.txt
    echo "------------------------------------------------" >> informe.txt

    echo "Consulta del diccionario completada"

}

#pide que se ingrese una vocal y devuelve las palabras que contengan la misma
config_vowel() {

    #asigna en una variable todas las vocales
    vowels="aeiouáéíóúAEIOUÁÉÍÓÚ"

    #bucle infinito
    while true; do

        #pide al usuario que ingrese una vocal
        echo "Ingrese una vocal:"
        read vowel

        #verifica que el dato ingresado sea una vocal, si es asi rompe el bucle
        if [[ "$vowels" == *"$vowel"* ]]; then
            break 
        else
            #en caso de que no sea una vocal pide un nuevo dato
            echo "Ingresar una vocal."
        fi
        
    done
    
    #busca todas las lineas que contengan la vocal ingresada y guarda los datos en resultados-vocal.txt
    grep -i "$vowel" diccionario_utf8.txt >> resultados-vocal.txt

}
