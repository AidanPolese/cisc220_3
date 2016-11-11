#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#Lianne Orlowski : 10204124

for (( n = 1000; n <= 10000; n++ )); do

        sum=0
        sumTwo=0
        for (( i = 0; i < ${#n}; i++ )); do

                sum=$(( ${sum} + ${n:$i:1} ))

        done

        for (( j = 0; j < ${#sum}; j++ )); do

                sumTwo=$((${sumTwo} + ${sum:$j:1} ))
        done

        if (( $sumTwo == 7 )); then
                echo ${n} ;
        fi

 done
