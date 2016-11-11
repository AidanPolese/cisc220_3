#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#Lianne Orlowski : 10204124
#Outputs size sorted drives

lsblk --noheadings --raw | sort -h -k 4 | tail -n 2

#you said "ascendingly" so that would be the command ^

#if you meant decendingly this would be the command:
#lsblk --noheadings --raw | sort -rhk 4 | head -n 2

