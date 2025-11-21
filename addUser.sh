#!/bin/bash
#Vérification d'arguments 
if [ $# -eq 0 ]; then
    echo "ll manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi
#recherche de tous les argument
for utilisateur in "$@"
do
    #Vérifier si l'utilisateur existe déjà
    if cat /etc/passwd | grep "$utilisateur" &>/dev/null; then
        echo "L'utilisateur $utilisateur existe déjà"
    else
        #creation de l'utilisateur
        useradd "$utilisateur"
    
        #vérification de l'utilisateur 
        if [ $? -eq 0 ]; then
            echo "l'utilisateur $utilisateur a été créé"
        else
            echo "erreur à la création de l'utilisateur $utilisateur"
        fi
    fi
done


