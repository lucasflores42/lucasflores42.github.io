---
title: Stability Plot
#author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [Data analysis,gnuplot]
tags: [code, gnuplot]
pin: false
math: true
mermaid: true
hidden: true
---


<hr>

Code to plot in gnuplot every .txt time dynamics file specified in FILES.
Useful to check stability time.

Run with <code class="language-plaintext highlighter-rouge">gnuplot code.gp</code>.

[Download file](/files/scripts/data_analysis/estabilidade.gp){:download}

```bash
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
