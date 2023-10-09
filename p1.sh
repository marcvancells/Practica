#!/bin/bash

read -p "Introdueix una opció: " x
case $x in

    'q')
        echo "Sortint de l'aplicació"
        exit 10
        ;;

    'lp')
        cut -d',' -f7,8 cities.csv | uniq
        ;;

    'sc')
	cadena='(("\w+( +\w+)+")|\w+)'
        read -p "Introdueix un pais: " resposta
	YY=$(awk -F',' -v pais="$resposta" '$8 == pais {print $7}' cities.csv | sort | uniq)
	if [ -n "$YY" ]; then
		echo "$YY"
	else
		YY="XX"
		echo "YY"
	fi
        ;;
esac

