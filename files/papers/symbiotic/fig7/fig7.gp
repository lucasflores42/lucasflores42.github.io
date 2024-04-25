set terminal postscript eps enhanced color 
set output 'well1.eps'

#set multiplot

set xtics font ",30"  
set ytics font ",30"  
set key font ',30'
set ylabel 'Density' font ",40" offset -3,0,0
set xlabel 'Time'  font ",40" offset 0,-.5,0
set logscale x
set xrange[1.:5000]
set yrange[0:1]
#plot 'dados_media' u 1:2 w l lt 3 lw 3 title 'C', 'dados_media' u 1:3 w l lw 3 lt 7 title 'D', 'dados_media' u 1:4 w l lt 2 lw 3 title 'P'
plot 'wellmixed_media' u 1:2 w l lt 3 lw 3 title 'C', 'wellmixed_media' u 1:3 w l lw 3 lt 7 title 'D', 'wellmixed_media' u 1:4 w l lt 2 lw 3 title 'P'
pause -1

#   %%BoundingBox: 28 38 430 302
