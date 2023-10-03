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
		cadena='(("\w+(+\w+)+"|\w+)'
		read pais
		egrep -cadena cities.csv | uniq
		;;	
esac
