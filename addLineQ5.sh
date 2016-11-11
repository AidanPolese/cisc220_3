#!/bin/bash
#Developed in cisc220
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548
#Lianne Orlowski : 10204124

#Adds "#Develiped in cisc220" after bin/bash line

find $pwd -maxdepth 1 -executable -type f | xargs -d '\n' grep -l -e '#!/bin/bash' | xargs -d '\n' sed -i '0,/bin\/bash/a  #Developed in cisc220'
