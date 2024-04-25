
#set terminal postscript eps enhanced color 
#set output 'heterog.eps'

set key left  
set key reverse Left
set key font ",25"
#set yrange[0:1]
#set xrange[4.2:5.5]
set xlabel 'r'
set ylabel '{/Symbol r}'
#set logscale x
set xtics offset 0,-0.6 font ",30"  
set ytics font ",30"  
set xlabel 'r' offset 0,-1.6,0 font ",40" 
set ylabel '{/Symbol r}' rotate by 0 offset -1.5,0,0 font ",40" 
set key spacing 1.2

# u 1:2:3 with yerrorbars

#densidade por desvio dela
#plot  'inset_dados_media.dat' u 1:4:55 with yerrorbars  dt 1 ps 1  title ''

#contribuiçao por desvio dela
#plot  'inset_dados_media.dat' u 1:7:8 with yerrorbars  dt 1 ps 1  title ''

#histogramas
unset key
plot 'histograma_r4.9.dat' u 1:2 with boxes




# %%BoundingBox: 28 38 430 302



pause -1
