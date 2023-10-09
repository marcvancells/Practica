#!/bin/bash
codi_p='xx'

read -p "Introdueix una opció: " x
case $x in 
	'q')
		echo "Sortint de l'aplicació"
		exit 10
		;;
	'lp')
		cut -d',' -f7,8 cities.csv | uniq
		;;
	'sc') #NO
		cadena='(("\w+( +\w+)+")|\w+)'
		read -p "Introdueix un pais: " pais
		codi_p=$(grep -E  '$'pais' ^\w+, $(cadena), \w+, \w+, $(cadena), \w+, \w+, $(cadena)' cities.csv | cut -d',' -f7,8 cities.csv | uniq )	
		;;
	'se')
esac
