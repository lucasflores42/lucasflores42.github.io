set terminal postscript eps enhanced color 
set output 'apB.eps'

#set title 'r=4.8'
set xlabel 'c'
#set logscale y



f(a,b,x) = 1/(1+exp(	-(4.8*(a-b)/5 + 1)*x/0.1	)	)

set multiplot

set xtics offset 0,-0.6 font ",30"  
set ytics font ",30"  
set xrange[0.:2.]
set yrange[0.:1.0]
set ylabel "{/Symbol r}" rotate by 0 offset -1.5,0,0 font ",40" 
set xlabel 'c' offset 0,-1.6,0 font ",40" 
set key left font ",25"

plot 'homogeneo_curva_media.dat' ev 5 u 2:(($30+$34)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34)) w linespoints pt 1 lc 1 title '{/Symbol D}Nc=-3', 'homogeneo_curva_media.dat' ev 5 u 2:(($8+$18)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34)) w linespoints pt 2 lc 2 title '{/Symbol D}Nc=-2', 'homogeneo_curva_media.dat' ev 5 u 2:(($9+$19)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34)) w linespoints pt 3 lc 3 title '{/Symbol D}Nc=-1', 'homogeneo_curva_media.dat' ev 5 u 2:(($10+$20)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34)) w linespoints pt 4 lc 4 title '{/Symbol D}Nc=0', 'homogeneo_curva_media.dat' ev 5 u 2:(($11+$21)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34)) w linespoints pt 5 lc 5 title '{/Symbol D}Nc=+1', 'homogeneo_curva_media.dat' ev 5 u 2:(($12+$22)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34)) w linespoints pt 6 lc 6 title '{/Symbol D}Nc=+2', 'homogeneo_curva_media.dat' ev 5 u 2:(($28+$32)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34)) w linespoints pt 7 lc 7 title '{/Symbol D}Nc=+3'

set xtics font ",20"  0.,0.25,1. 
set ytics font ",25"  
unset key
set size 0.45,0.45
set origin 0.5,0.5
set xrange[0:0.5]
#set yrange[0:1]
unset ylabel #'{/Symbol r}_C' rotate by 0 font ",22"
unset xlabel #font ",32" offset 0,0,0

plot f(3,4,x) w l lt 8, f(2,4,x) w l lt 8, f(1,4,x) w l lt 8, f(4,4,x) w l lt 8, f(4,3,x) w l lt 8, f(4,2,x) w l lt 8, f(4,1,x) w l lt 8, 'homogeneo_curva_media.dat' ev 5 u 2:($30/($30+$34)) ps 1 pt 1 lc 1 title 'delta Nc=-3', 'homogeneo_curva_media.dat' ev 5 u 2:($8/($8+$18)) ps 1 pt 2 lc 2 title 'delta Nc=-2', 'homogeneo_curva_media.dat' ev 5 u 2:($9/($9+$19)) ps 1 pt 3 lc 3 title 'delta Nc=-1', 'homogeneo_curva_media.dat' ev 5 u 2:($10/($10+$20)) ps 1 pt 4 lc 4 title 'delta Nc=0', 'homogeneo_curva_media.dat' ev 5 u 2:($11/($11+$21)) ps 1 pt 5 lc 5 title 'delta Nc=+1', 'homogeneo_curva_media.dat' ev 5 u 2:($12/($12+$22)) ps 1 pt 6 lc 6 title 'delta Nc=+2', 'homogeneo_curva_media.dat' ev 5 u 2:(($28/($28+$32))) ps 1 pt 7 lc 7 title 'delta Nc=+3'


# %%BoundingBox: 28 38 430 302

#pause -1
