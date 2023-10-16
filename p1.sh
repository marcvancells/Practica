#!/bin/bash

YY='XX'
AA='XX'
a='XX'
BB='XX'
CC='XX'

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
	        AA=$(awk -F',' -v estat="$resposta2" '$5 == estat {print $4}' cities.csv | sort | uniq)
		#a= $(awk -F',' -v estat="$resposta2" '$8 == estat {print $7}' cities.csv | sort | uniq)
		if [ -n "$AA" ]; then #&& [ "$a" == "$YY" ]; then
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
                echo $CC
                ;;
	
	'ecp')
		touch $YY.csv	
		(awk -F',' -v z="$YY" '$7 == z {print $2, $11}' cities.csv | sort | uniq) >> $YY.csv 		
		;;
	'lce')
		DD=$(awk -F',' -v n="$AA" '$5 == n {print $2, $11}' cities.csv | sort | uniq)
                echo "$DD"
		;;
	esac

done
