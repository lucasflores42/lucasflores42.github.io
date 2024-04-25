
set terminal postscript eps enhanced color 
set output 'fig2_hmf_cores.eps'

set style rect fc lt -1 fs solid 0.15 noborder

set style line 11 lw 5 lt 1 lc rgb '#0072bd' # blue
set style line 12 lw 5 lt 2 lc rgb '#d95319' # orange
set style line 13 lw 5 lt 3 lc rgb '#edb120' # yellow
set style line 14 lw 5 lt 4 lc rgb '#7e2f8e' # purple
set style line 15 lw 5 lt 5 lc rgb '#77ac30' # green
set style line 16 lw 5 lt 6 lc rgb '#4dbeee' # light-blue
set style line 17 lw 5 lt 7 lc rgb '#a2142f' # red

set obj rect from 0.4, graph 0 to 1, graph 1.
set yrange[0:1.05]
set xrange[:1.1]
set xtics font ",20"  
set ytics font ",20"
set key at 0.45,0.2 box font ',22'
set xlabel '{/Symbol g}' rotate by 0 font ",30" offset 0,0,0
set ylabel '{/Symbol r}' rotate by 0 font ",30"

plot 'r41_media' u 2:($4+$6) w l ls 14 title 'r=4.1',\
     'r40_media' u 2:($4+$6) w l ls 12 title 'r=4.0',\
     'r39_media' u 2:($4+$6) w l ls 13 title 'r=3.9'



#pause -1
#   %%BoundingBox: 28 48 430 302
