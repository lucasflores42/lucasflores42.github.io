set terminal postscript eps enhanced color 
set output 'fig1_hmf_cores.eps'

#set multiplot

set style line 11 lw 5 lt 1 dt 1 lc rgb '#0072bd' # blue
set style line 12 lw 5 lt 2 dt 2 lc rgb '#d95319' # orange
set style line 13 lw 5 lt 3 dt 3 lc rgb '#edb120' # yellow
set style line 14 lw 5 lt 4 dt 4 lc rgb '#7e2f8e' # purple
set style line 15 lw 5 lt 5 dt 5 lc rgb '#77ac30' # green
set style line 16 lw 5 lt 6 dt 6 lc rgb '#4dbeee' # light-blue
set style line 17 lw 5 lt 7 dt 7 lc rgb '#a2142f' # red


set xtics font ",20"  
set ytics font ",20"  
set key at 1.09,.34 box font ',22'
set ylabel '{/Symbol r}' rotate by 0  font ",30" offset -1,0,0
set xlabel 'r/G'  font ",30"
set xrange[0.6:]
set yrange[0:1.05]
plot 'g10_media' u ($1/5):($4+$6) w l ls 11 title '{/Symbol g}=1.00',\
     'g06_media' u ($1/5):($4+$6) w l ls 12 title '{/Symbol g}=0.60',\
     'g02_media' u ($1/5):($4+$6) w l ls 13 title '{/Symbol g}=0.20',\
     'g015_media' u ($1/5):($4+$6) w l ls 14 title '{/Symbol g}=0.15',\
     'g010_media' u ($1/5):($4+$6) w l ls 15 title '{/Symbol g}=0.10',\
     'g00_media' u ($1/5):($4+$6) w l ls 16 title '{/Symbol g}=0.00'



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




#pause -1

#   %%BoundingBox: 28 48 430 302
