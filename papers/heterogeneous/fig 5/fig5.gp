
set terminal postscript eps enhanced color 
set output 'heterog.eps'



set multiplot
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

# u 1:2:3 with yerrorbars

plot  'invest_optimal_media.dat' u 1:4 w l lc 8 lw 4 title 'c_{o}=0.4', 'invest_randmenos_media.dat' ev 5 u 1:4 ps 2 lt 8 title 'c_{i}{\~}U(0,c_{o})',  'invest_randmais_media.dat' u 1:4 w linespoints pointinterval 5 lc 7 lt 6 ps 1 pt 7 title 'c_{i}{\~}U(c_{o},5)',  'invest_randmais_media.dat' ev 5 u 1:4:9 with yerrorbars lt 6 dt 1 ps 1 lc 7 title ''#,  'invest12_media.dat' u 1:4 w l lt 3 dt 2 lw 4 title 'c_{i}=1 or 2'

#'invest_rand05_media.dat' u 1:4 w l lt 7 title 'c_{i}=rand(0,5)', 'invest_gaussian41_media.dat' u 1:4 w l lt 2 lc 3 title 'c_{i} ~ Normal(4,1)',

#plot 'invest_optimal_media.dat' u 1:4 w l lc 8 lw 3 title 'c_{o}=0.4', 'invest_gaussian41_media.dat' ev 10 u 1:4:9 with yerrorbars dt 1  

#plot 'invest_randmenos_media.dat' ev 5 u 1:4:9 with yerrorbars dt 1 lc 7 title ''


set size 0.35,0.35
set origin 0.6,0.16

unset label
set xtics  font ",20"  4.2,0.3,5.1
set ytics font ",20"  #0,0.1,.45 
set xrange[4.2:5.1]
set yrange[0.:5.2]
unset xlabel 
set ylabel 'c' offset 0,0,0 font ",30" 
#set label 1 at -4,5 "Some text" center offset 0,-1
set arrow 1 from 3.92,3.0 to 4.00,3.0 lc "black" lw 4 dt 1 nohead
unset key
#set key right font ",10" #tamanho da label dentro da figura

set label 1 "(a)" font ",30" at 1.4,15.2 front

plot  'inset_dados_media.dat' u 1:7:8 with yerrorbars  dt 2 ps 1 pt 5  title ''

# %%BoundingBox: 28 38 430 302



pause -1
