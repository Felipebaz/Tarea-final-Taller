#!/bin/bash
#Pablo Gonzalez 341209 - Felipe Baz 328217

#variable que guarda la ubicacion de un archivo
users_file="users.txt"

#variables de cadenas vacias
start_letter=""
contained_letter=""
end_letter=""

#autentificar credenciales
authenticate_user() {

    #muestra un mensaje en consola
    echo "Ingrese su usuario:"
    #le la entrada en consola y la asigna a una variable
    read username
    echo "Ingrese su contraseña:"
    # -s se encarga que el dato ingresa el usuario no se muestre en la terminal
    read -s password

    #busca en la variable users_file datos que coincidan con el formato: username,password
    #grep se encarga de buscar las coincidencias mientras -q suprime los resultados
    if grep -q "^$username,$password$" $users_file; then
        #en caso de que los datos coincidan se muestra un mensaje de aprobacion
        #guarda el nombre del usuario que ingreso en una variable y muestra el menu
        echo "Autenticación exitosa"
        user_name=$username
        menu
    else 
        #en caso de no coincidir, muestra un mensaje de error y vuelve a pedir las credenciales
        echo "Credenciales incorrectas. Inténtelo de nuevo."
        authenticate_user
    fi

}

#listar usuarios
list_users() {

    #agregamos lineas separadoras para que el formato sea mas claro
    echo "Usuarios registrados"
    echo "--------------------"
    #utilizamos awk para manipular texto y -F indica que se utilice ',' para delimitar el campo
    #entonces imprime solo los usuarios de la variabli users_file
    awk -F ',' '{print $1}' $users_file
    echo "--------------------"

}

#agregar usuario
add_users() {

    echo "Ingresar nombre de usuario:"
    read new_user

    #verifica que el usuario no exista, en caso de existir pide un nuevo usuario
    if grep -q "^$new_user," $users_file; then
        echo "Usuario existente, ingresar un nuevo nombre de usuario"
        add_users
    else
        #en caso de no existir, pide la contraseña y guarda los nuevos datos en la variable users_file
        echo "Ingrese contraseña:"
        read -s new_password
        #se guarda en el archivo users.txt indicando el mismo formato
        echo "$new_user,$new_password" >> $users_file
        echo "Usuario registrado correctamente"
    fi

}
