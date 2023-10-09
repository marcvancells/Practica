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
	'sc') 
		cadena='(("\w+( +\w+)+")|\w+)'
		read -p "Introdueix un pais: " pais
		echo $pais
		codi_p= $(grep -E  '\w+,'"${cadena}"',\w+,\w+,'"${cadena}"', \w+,\w+,' $"pais" cities.csv | cut -d',' -f7 | uniq )
		#if [[ -n codi_p ]]; then
			#codi_p='xx'	
		#else
			#codi_p='xx'
		#fi
		;;
esac
