set terminal postscript eps enhanced color 
set output 'well1_hmf.eps'

#set multiplot

set xtics font ",45"  offset 0,-1,0
set ytics font ",45"  
set key font ',40' at 2000,0.9
#unset key
#set ylabel 'Density' font ",50" offset -6,0,0
set xlabel 'Time'  font ",50" offset -4,-2,0
set logscale x
set xrange[1.:3000]
set yrange[0:1.05]

set label 1 "(b)" font ",50" at 1200, 0.15 front

#plot 'dados_media' u 1:2 w l lt 3 lw 3 title 'C', 'dados_media' u 1:3 w l lw 3 lt 7 title 'D', 'dados_media' u 1:4 w l lt 2 lw 3 title 'P'
plot 'wellmixed_media' u 1:2 w l lt 3 lw 4 title 'C',\
     'wellmixed_media' u 1:3 w l lw 4 lt 7 title 'D',\
     'wellmixed_media' u 1:4 w l lt 2 lw 4 title 'P'

#pause -1

#   %%BoundingBox: 28 38 430 302
