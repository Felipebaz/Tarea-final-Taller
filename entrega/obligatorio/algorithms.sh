#!/bin/bash
#Pablo Gonzalez 341209 - Felipe Baz 328217

algorithm_1() {

    echo "Ingresar cantidad de datos:"
    #lee la entrada desde consola y la asigna a la variable
    read num_data

    #bucle que asegura que el primer dato ingresado sea numerico
    while ! [[ "$num_data" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; do
        echo "Ingrese un número válido:"
        read num_data
    done

    #variables
    sum=0
    min=0
    max=0

    #for que se mantendra en loop la cantidad de veces indicadas por consola
    for ((i = 1; i <= num_data; i++)); do

        #se repite pidiendo nuevos datos, #$i es la cantidad de veces que se repite el for
        echo "Ingresar el dato #$i:"
        read data


        #bucle que asegura que los datos ingresados sean numericos
        while ! [[ "$data" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; do
            echo "Dato válido."
            echo "Ingresar el dato #$i:"
            read data
        done

        #funciona como un acc (acumulador)
        sum=$((sum + data))

        #if para encontrar el minimo y el maximo de los datos ingresados
        #bloque condicional
        if [[ $i -eq 1 ]]; then
            min=$data
            max=$data
        else
            if [[ $data -lt $min ]]; then
                min=$data
            fi
            if [[ $data -gt $max ]]; then
                max=$data
            fi
        fi
    done

    #calcula el promedio entre los valores ingresados
    average=$(awk "BEGIN {printf \"%.2f\", $sum / $num_data}")

    #se imprimen en consola
    echo "Promedio de los datos ingresados: $average"
    echo "Menor dato ingresado: $min"
    echo "Mayor dato ingresado: $max"

}


#funcion que revierte la palabra ingresada
reverse_string() {

    #guarda el string
    local input="$1"
    #guarda la longitud del string
    local len=${#input}
    #guarda la cadena revertida
    local reversed=""

    #loop decreciente
    for ((i = len - 1; i >= 0; i--)); do
        #sustitucion de cadena
        reversed="$reversed${input:$i:1}"
    done

    #imprime la palabra revertida
    echo "$reversed"

}

algorithm_2() {

    echo "Ingresar palabra:"
    read word

    #bucle de validación que solo permite letras
    while [[ "$word" =~ [^a-zA-Z] ]]; do
        echo "Ingresar una palabra sin números:"
        read word
    done

    #invoca la funcion anterior y almacena el resultado en una variable
    reversed_word=$(reverse_string "$word")

    #comprueba si la palabra original ingresada es igual a la obtenida en la 
    #funcion anterior y imprime si es capicua o no
    if [[ $word == $reversed_word ]]; then
        echo "La palabra '$word' es capicúa."
    else
        echo "La palabra '$word' no es capicúa."
    fi
    
}