#!/bin/bash
# Entrega Felipe Baz - 328217


menu() {

    #muestra las diferentes opciones disponibles al usuario
    echo "Bienvenido al menú principal:"
    echo "1. Listar usuarios registrados"
    echo "2. Registrar nuevo usuario"
    echo "3. Configurar letra de inicio"
    echo "4. Configurar letra contenida"
    echo "5. Configurar letra de fin"
    echo "6. Consultar diccionario"
    echo "7. Buscar por vocal"
    echo "8. Algoritmo 1"
    echo "9. Algoritmo 2"
    echo "10. Salir"

    #permite agregar un mensaje antes de capturar un valor
    read -p "Ingrese su elección: " choice

    #case maneja las diferentes opciones dependiendo el valor de choice
    # ;; se utiliza para limitar la ejecucion
    case $choice in 

        1) list_users ;; 
        2) add_users ;;
        3) config_home_letter ;;
        4) config_contained_letter ;;
        5) config_end_letter ;;
        6) lookup_dictionary ;;
        7) config_vowel ;;
        8) algorithm_1 ;;
        9) algorithm_2 ;;
        10) exit ;;
        #en caso de no coincidir pide que ingrese un nuevo dato
        *) echo "Seleccionar una opción valida." ;;
    
    #finaliza la estructura case
    esac

}
