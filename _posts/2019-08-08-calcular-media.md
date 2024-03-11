---
title: Calcular media
author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [Data analysis, bash]
tags: [code, bash]
pin: false
math: true
mermaid: true

---

[Download file](/codes/scripts/calcular_media_lucas.sh){:download}


Code to apply media_temporal.awk in all files, merging every equilibrium density from every sample in the same file. 


Run with ./calcular_media.awk > file






```awk
 # coloca num mesmo arquivo varias densidades no equilibrio de diferentes arquivos atraves do media_temporal_lucas
 
#!/bin/bash
export LC_NUMERIC="en_US.UTF-8" # no terminal caso esteja plotando virgula
 # hashtag apaga antes e porcentagem depois
for name in quadrada*.txt
do
delta1=${name#*_g*_d}
delta=${delta1%_seed*}

R1=${name#*_r}
R=${R1%_g*}

gama1=${name#*_g}
gama=${gama1%_d*}

#echo -n "$R $gama $delta "  # comentar ao usar media_temporal.awk

awk -f media_temporal.awk $name

done
```
