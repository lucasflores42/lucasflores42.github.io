set terminal postscript eps enhanced color 
set output 'coopG.eps'

set label 1 "(b)" font ",35" at 0.55, 0.9 front

set multiplot


set xtics offset 0,-0.6 font ",30"  
set ytics font ",30"  
set xrange[0.5:1.7]
set yrange[0.:1.0]
set ylabel "{/Symbol r}_C" rotate by 0 offset -1.5,0,0 font ",40" 
set xlabel 'r/G' offset 0,-1.6,0 font ",40" 
set key font ",25"
unset key


plot '3dados_media.txt' u ($1/4):($3+$5) w l lw 3 title 'honeycomb (G=4)','dados_media.txt' u ($1/5):($3+$5) w l lw 3 title 'von Neumann (G=5)','kagome_dados_media.txt' u ($1/5):3 w l lw 3 title 'kagome (G=5)', '6dados_media.txt' u ($1/7):5 w l lw 3 title 'triangular (G=7)', '8dados_media.txt' u ($1/9):5 w l lw 3 title 'Moore (G=9)','3Ddados_media.txt' u ($1/7):5 w l lw 3 dt 2 title 'cubic (G=7)','4Ddados_media.txt' u ($1/9):5 w l lw 3 dt 3 title 'quadridimensional (G=9)'

set xtics 0.5,0.25,1 font ",25"  
set ytics font ",25"  
unset key
set size 0.45,0.45
set origin 0.5,0.18
set xrange[0.38:1.2]
set yrange[0:1]
unset ylabel #'{/Symbol r}_C' rotate by 0 font ",22"
unset xlabel
#set xlabel 'r' font ",32" offset 0,-0.6
unset label

plot '001hexagonal_dados_media.txt' u ($1/4):3 w l lw 3 title 'honeycomb','001quad_dados_media.txt' u ($1/5):3 w l lw 3 title 'von Neumann',  '001kagome_dados_media.txt' u ($1/5):3 w l lw 3 title 'kagome', '001triangular_dados_media.txt' u ($1/7):3 w l lw 3 title 'triangular', '001moore_dados_media.txt' u ($1/9):3 w l lw 3 title 'Moore','001cubica_dados_media.txt' u ($1/7):3 w l lw 3 dt 2 title 'cubic','001quadri_dados_media.txt' u ($1/9):3 w l lw 3 dt 3 title 'quadridimensional'



pause -1

#   %%BoundingBox: 28 38 430 302
