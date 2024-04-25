#!/bin/bash
 # hashtag apaga antes e porcentagem depois
for name in dados_*txt
do
name1=${name%_*}
name2=${name#*_}
#echo $name1
R=${name1#da*r}
R2=${name2#*g}
R3=${R2%_seed*}
R4=${R%_g*}
echo -n "$R4 $R3 "
#echo -n "$R2 "
awk -f media_temporal_lucas.awk $name
done
