# coloca num mesmo arquivo varias densidades no equilibrio de diferentes arquivos atraves do media_temporal_lucas

# hashtag apaga antes e porcentagem depois

# example: 
#    parameter_aux = ${name#*_parameter}
#    gama=${parameter_aux%_parameter2*}

#!/bin/bash
export LC_NUMERIC="en_US.UTF-8" # no terminal caso esteja plotando virgula

for name in quadrada*.txt
do
    delta1=${name#*_g*_d}
    delta=${delta1%_seed*}

    R1=${name#*_r}
    R=${R1%_g*}

    gama1=${name#*_g}
    gama=${gama1%_d*}

    echo -n "$R $gama $delta "  # comentar ao usar media_temporal.awk

    awk -f media_temporal_equilibrio.awk $name

done
