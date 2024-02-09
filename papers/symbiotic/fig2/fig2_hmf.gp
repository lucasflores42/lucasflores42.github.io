
set terminal postscript eps enhanced color 
set output 'fig2_hmf.eps'

set style rect fc lt -1 fs solid 0.15 noborder

set obj rect from 0.4, graph 0 to 1, graph 1.
set yrange[0:1.05]
set xrange[:1.1]
set xtics font ",20"  
set ytics font ",20"
set key at 0.45,0.2 box font ',22'
set xlabel '{/Symbol g}' rotate by 0 font ",30" offset 0,0,0
set ylabel '{/Symbol r}' rotate by 0 font ",30"

set label 1 "(a)" font ",35" at 1.0, 0.1 front

plot 'r41_media' u 2:($4+$6) w l lt 2 dt 6 lw 5 lc 8 title 'r=4.1',\
     'r40_media' u 2:($4+$6) w l lt 7 dt 0 lw 7 lc 6 title 'r=4.0',\
     'r39_media' u 2:($4+$6) w l lw 5 lc 9 title 'r=3.9'



#pause -1
#   %%BoundingBox: 28 48 430 302
