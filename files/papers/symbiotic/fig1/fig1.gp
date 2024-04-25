set terminal postscript eps enhanced color 
set output 'fig1.eps'

#set multiplot



set xtics font ",20"  
set ytics font ",20"  
set key at 1.078,.34 box font ',22'
set ylabel '{/Symbol r}' rotate by 0  font ",30" offset -1,0,0
set xlabel 'r/G'  font ",30"
set xrange[0.6:]
set yrange[0:1.005]
plot 'g10_media' u ($1/5):($4+$6) w l lw 4  title '{/Symbol g}=1.00', 'g06_media' u ($1/5):($4+$6) w l lt 4 dt 7 lw 4 title '{/Symbol g}=0.60', 'g02_media' u ($1/5):($4+$6) w l lt 8 dt 2 lw 4  title '{/Symbol g}=0.20', 'g015_media' u ($1/5):($4+$6) w l lt 6 dt 4 lw 7 title '{/Symbol g}=0.15', 'g010_media' u ($1/5):($4+$6) w l lt 7 dt 5 lw 5 title '{/Symbol g}=0.10', 'g00_media' u ($1/5):($4+$6) w l lt 2 dt 6 lw 4 title '{/Symbol g}=0.00'



#set size 0.4,0.4
#set origin 0.1,0.55
#set xlabel '{/Symbol g}'  font ",10"
#set ylabel 'r/G' rotate by 0  font ",10"
#set xtics font ",10"  
#set ytics font ",10"  
#unset key
#set xrange[0:1]
#set yrange[0.6:0.95]
#plot 'fig11.txt' u 2:($1/5) w linespoints lt 8




pause -1

#   %%BoundingBox: 28 48 430 302
