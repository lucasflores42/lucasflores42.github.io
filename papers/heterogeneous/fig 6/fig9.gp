
set terminal postscript eps enhanced color 
set output 'apbb.eps'

set label 1 "C_{1}" font ",25" at 4.35, 0.36 front
set label 2 "C_{2}" font ",25" at 4.89, 0.40 front

set key left  
set key reverse Left
set key font ",25"
set yrange[0:1]
set xrange[4.2:5.5]
set xlabel 'r'
set ylabel '{/Symbol r}'
#set logscale x
set xtics offset 0,-0.6 font ",30"  
set ytics font ",30"  
set xlabel 'r' offset 0,-1.6,0 font ",40" 
set ylabel '{/Symbol r}' rotate by 0 offset -1.5,0,0 font ",40" 
set key spacing 1.2


plot  'invest05_media.dat' u 1:4 w l dt 3 lw 3 title 'C_{0.5}',\
'invest1_media.dat' u 1:4 w l dt 2 lw 3 title 'C_{1}',\
'invest15_media.dat' u 1:4 w l dt 4 lw 3 title 'C_{1.5}',\
'invest2_media.dat' u 1:4 w l dt 5 lw 3 title 'C_{2}',\
'apendice_dados_media.dat' u 1:4 w l lc 8 lw 4 title 'C_{i}'



# %%BoundingBox: 28 38 430 302



pause -1
