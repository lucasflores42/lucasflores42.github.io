#set terminal postscript eps enhanced color 
#set output 'listras.eps'

set multiplot

set xtics font ",20"  
set ytics font ",20"  
set xrange[0.6:]
#set yrange[:7]
set ylabel '{P/C}' rotate by 0  font ",30"
set xlabel 'r/G'  font ",30"
unset key

plot 'g10_media' u ($1/5):($6/($4+0.0000000000000001)) pt 6 lc 8

set xtics font ",15"  
set ytics font ",15"  
set key
set size 0.5,0.5
set origin 0.45,0.45
set yrange[0:1]
set ylabel '{/Symbol r}' rotate by 0 font ",22"
set xlabel 'r/G' font ",22"
plot 'g10_media' u ($1/5):4 w l lc 6 lw 2 title 'C', 'g10_media' u ($1/5):6 w l lc 2 lw 2 title 'P', 'g10_media' u ($1/5):5 w l lc 7 lw 2 title 'D'


pause -1

#   %%BoundingBox: 28 48 430 302
