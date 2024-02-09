
set terminal postscript eps enhanced color 
set output 'fig2a_hmf.eps'

set style line 11 lt 1 lc rgb '#0072bd' # blue
set style line 12 lt 1 lc rgb '#d95319' # vermelho
set style line 13 lt 1 lc rgb '#edb120' # yellow
set style line 14 lt 1 lc rgb '#7e2f8e' # purple
set style line 15 lt 1 lc rgb '#77ac30' # green
set style line 16 lt 1 lc rgb '#4dbeee' # light-blue
set style line 17 lt 1 lc rgb '#a2142f' # red


set xtics font ",45" offset 0,-.5,0
set ytics font ",45"  
unset key
set xlabel 'Time' rotate by 0 font ",50" offset 0,-2,0
set ylabel '{/Symbol r}' rotate by 0 font ",50" offset -2,0,0
set xrange[1:5000]
set yrange[0:1.05]
set logscale x

set label 1 "(b)" font ",50" at 1800, 0.15 front

#plot 'r4g06.txt' u 1:($2+$4) w p ls 5 lc 3, 'r4g06_media' u 1:($2+$4) w l lt 8 lw 6, 
#plot 'r4g015.txt' u 1:($2+$4) w p ls 5 lc 3, 'r4g015_media' u 1:($2+$4) w l lt 8 lw 6,

#plot 'r4g06a3.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,'r4g06a4.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6, 'r4g06a5.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6, 'r4g06a6.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6, 'r4g06a7.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6, 'r4g06a8.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6, 'r4g06a9.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6, 'r4g06a.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6, 'r4g06a1.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6, 'r4g06_media' u 1:($2+$4) w l lt 8 lw 6

plot 'r4g015a3.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015a4.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015a5.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015a6.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015a7.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015a8.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015a9.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015a.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015a1.txt' u 1:($2+$4) w l lc rgb 'gray60' lw 6,\
     'r4g015_media' u 1:($2+$4) w l lt 8 lw 7

#pause -1
#   %%BoundingBox: 28 38 430 302
