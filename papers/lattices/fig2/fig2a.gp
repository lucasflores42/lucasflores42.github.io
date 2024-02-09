set terminal postscript eps enhanced color 
set output 'coopK.eps'

set label "(a)" font ",35" at 2.5,0.9 front

set multiplot

set xtics offset 0,-0.5 font ",30"  
set ytics font ",30"  
set xrange[2.:14.3]

set yrange[0.:1.0]
set ylabel "{/Symbol r}_C" rotate by 0 offset -1.5,0,0 font ",40" 
set xlabel 'r' offset 0,-1.6,0 font ",40" 
set key left font ",25" at 7.2,0.5

plot '3dados_media.txt' u 1:($3+$5) w l lw 3 title 'honeycomb (G=4)','dados_media.txt' u 1:($3+$5) w l lw 3 title 'von Neumann (G=5)', 'kagome_dados_media.txt' u 1:3 w l lw 3 title 'kagome (G=5)','6dados_media.txt' u 1:5 w l lw 3 title 'triangular (G=7)', '8dados_media.txt' u 1:5 w l lw 3 title 'Moore (G=9)','3Ddados_media.txt' u 1:5 w l lw 3 dt 2 title 'cubic (G=7)','4Ddados_media.txt' u 1:5 w l lw 3 dt 3 title 'hypercubic (G=9)'


pause -1

#   %%BoundingBox: 28 38 430 302
