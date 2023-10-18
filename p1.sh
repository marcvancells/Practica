#!/bin/bash

YY='XX'
AA='XX'
a='XX'
BB='XX'
CC='XX'
DD='XX'
EE='XX'

while true; do 

	read -p "Introdueix una opció: " i
	case $i in

    	'q')
	        echo "Sortint de l'aplicació"
        	exit 10
        	;;

    	'lp')
		cut -d',' -f7,8 cities.csv | uniq
        	;;
	
	'sc')
	        read -p "Introdueix un pais: " resposta
		YY=$(awk -F',' -v pais="$resposta" '$8 == pais {print $7}' cities.csv | sort | uniq)
		if [ -n "$YY" ]; then
			echo "$YY"
		else
			YY="XX"
			echo $YY
		fi
		;;

	'se')
		read -p "Introdueix un estat: " resposta2
	        AA=$(awk -F',' -v estat="$resposta2" -v z="$YY" '$5 == estat && $7 == z {print $4}' cities.csv | sort | uniq)
		if [ -n "$AA" ]; then
	                echo $AA
	        else
        	        AA="XX"
                	echo $AA
        	fi
	        ;;


	'le')
		BB=$(awk -F',' -v z="$YY" '$7 == z {print $4, $5}' cities.csv | sort | uniq)
		echo "$BB"
		;;

	'lcp')
		CC=$(awk -F',' -v z="$YY" '$7 == z {print $2, $11}' cities.csv | sort | uniq)
                echo "$CC"
                ;;
	
	'ecp')
		touch $YY.csv	
		(awk -F',' -v z="$YY" '$7 == z {print $2, $11}' cities.csv | sort | uniq) >> $YY.csv 		
		;;
	'lce')

		DD=$(awk -F',' -v e="$AA" -v z="$YY" '$4 == e && $7 == z {print $2, $11}' cities.csv | sort | uniq)
                ec<F10>ho "$DD"
		;;
	'ece')
		(awk -F',' -v e="$AA" -v z="$YY" '$4 == e && $7 == z {print $2, $11}' cities.csv | sort | uniq) > "${YY}_${AA}.csv"
		;;
	'gwd')
		read -p "Introdueix el nom de la població: " resposta3
		EE=$(awk -F',' -v z="$YY" -v e="$AA" -v poblacio="$resposta3" '$2 == poblacio && $7 == z && $4 == e {print $11}' cities.csv | sort | uniq)
		if [ -n "$EE" ]; then
			echo "$EE"
			curl -o $EE.json https://www.wikidata.org/wiki/Special:EntityData/$EE.json > $EE.json
		else
			echo "Població Incorrecta"
		fi
		;;
		

	esac

done
