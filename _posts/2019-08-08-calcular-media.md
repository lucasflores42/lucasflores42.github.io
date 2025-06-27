---
title: Merge equilibrium samples
#author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [Data analysis, bash]
tags: [code, bash]
pin: false
math: true
mermaid: true
hidden: true
---

<hr>


Code to apply 
<a href="{% post_url 2019-08-08-media-temporal %}">
    <code class="language-plaintext highlighter-rouge">media_temporal_equilibrio.awk</code>
</a>
in all files, merging every equilibrium density from every sample in the same file with the parameter values.

My simulation files have the parameter values in it so I can extract them and put as columns in this code.
For example, <code class="language-plaintext highlighter-rouge">square_r1.700000_g0.000000_d0.200000_seed1673476071.txt</code>.



Run with <code class="language-plaintext highlighter-rouge">./calcular_media.awk > file</code>.


[Download file](/files/scripts/data_analysis/calcular_media_lucas.sh){:download}


```awk
# coloca num mesmo arquivo varias densidades no equilibrio de diferentes arquivos atraves do media_temporal_lucas
# hashtag apaga antes e porcentagem depois
# example: 
#    parameter_aux = ${name#*_parameter}
#    parameter_value=${parameter_aux%_parameter2*}

#!/bin/bash
export LC_NUMERIC="en_US.UTF-8" # no terminal caso esteja plotando virgula

for name in square*.txt
do
    delta1=${name#*_g*_d}
    delta=${delta1%_seed*}

    R1=${name#*_r}
    R=${R1%_g*}

    gama1=${name#*_g}
    gama=${gama1%_d*}

    echo -n "$R $gama $delta "  

    awk -f media_temporal_equilibrio.awk $name

done
```

