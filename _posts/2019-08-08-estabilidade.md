---
title: Estabilidade
author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [Data analysis,gnuplot]
tags: [code, gnuplot]
pin: false
math: true
mermaid: true

---
[Download file](/codes/scripts/estabilidade.gp){:download}



Code to plot in gnuplot every .txt file specified in FILES.






```gnuplot
#set terminal postscript eps enhanced color
#set output "${name1}_estabilidade.eps"

FILES = system("ls -1 quadrada_dados*.txt")

set yrange [0:1]
set xlabel "time"
set ylabel "C density"
set title "stability"   


plot for [data in FILES] data u 1:2 w l title data

pause -1
```
