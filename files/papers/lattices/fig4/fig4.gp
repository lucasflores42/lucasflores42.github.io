set terminal postscript eps enhanced color 
set output 'coopPGG.eps'

#set label 1 "(b)" font ",35" at -011.0, 02. front

set multiplot

set xtics offset 0,-0.6 font ",30"  
set ytics font ",30"  
set xrange[0.5:2.1]
set yrange[0.:1.0]
set ylabel "{/Symbol r}_C" rotate by 0 offset -1.5,0,0 font ",40" 
set xlabel 'r/G' offset 0,-1.6,0 font ",40" 
set key font ",25"

plot 'PGG3dados_media.txt' u ($1/4):($3+$5) w l lw 3 title 'honeycomb (G=4)','PGG4dados_media.txt' u ($1/5):3 w l lw 3 title 'von Neumann (G=5)','PGGkagome_dados_media.txt' u ($1/5):3 w l lw 3 title 'kagome (G=5)', 'PGG6dados_media.txt' u ($1/7):3 w l lw 3 title 'triangular (G=7)', 'PGG8dados_media.txt' u ($1/9):3 w l lw 3 title 'Moore (G=9)','PGGcubica_dados_media.txt' u ($1/7):3 w l lw 3 dt 2 title 'cubic (G=7)','PGGquadri_dados_media.txt' u ($1/9):3 w l lw 3 dt 3 title 'hypercubic (G=9)'

set xtics font ",25"  
set ytics font ",25"  
unset key
set size 0.45,0.45
set origin 0.5,0.145
set xrange[2:12]
set yrange[0:1]
unset ylabel #'{/Symbol r}_C' rotate by 0 font ",22"
set xlabel 'r' font ",32" offset 0,0,0
plot 'PGG3dados_media.txt' u 1:($3+$5) w l lw 3 title 'rede hexagonal','PGG4dados_media.txt' u 1:3 w l lw 3 title 'rede quadrada', 'PGGkagome_dados_media.txt' u 1:3 w l lw 3 title 'rede kagome','PGG6dados_media.txt' u 1:3 w l lw 3 title 'rede triangular', 'PGG8dados_media.txt' u 1:3 w l lw 3 title 'rede moore','PGGcubica_dados_media.txt' u 1:3 w l lw 3 dt 2 title 'rede cúbica','PGGquadri_dados_media.txt' u 1:3 w l lw 3 dt 3 title 'rede quadridimensional'


pause -1

#   %%BoundingBox: 28 38 430 302
