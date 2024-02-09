set terminal postscript eps enhanced color 
set output 'apB2.eps'

#set title 'r=4.8'
set xlabel 'c'
#set logscale y



f(a,b,x) = 1/(1+exp(	-(4.8*(a-b)/5 + 1)*x/0.1	)	)

set multiplot

set xtics offset 0,-0.6 font ",30" 
set ytics font ",30"   0.0,0.1,0.3
set xrange[0.:2.]
set yrange[0.:0.3]
set ylabel "{/Symbol r}" rotate by 0 offset -1.5,0,0 font ",40" 
set xlabel 'c' offset 0,-1.6,0 font ",40" 
set key left font ",20"
unset key

plot 'homogeneo_curva_media.dat' ev 5 u 2:(($30+$34)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34))*($30/($30+$34)) w linespoints title 'delta Nc=-3', 'homogeneo_curva_media.dat' ev 5 u 2:(($8+$18)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34))*($8/($8+$18)) w linespoints title 'delta Nc=-2', 'homogeneo_curva_media.dat' ev 5 u 2:(($9+$19)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34))*($9/($9+$19)) w linespoints title 'delta Nc=-1', 'homogeneo_curva_media.dat' ev 5 u 2:(($10+$20)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34))*($10/($10+$20)) w linespoints title 'delta Nc=0', 'homogeneo_curva_media.dat' ev 5 u 2:(($11+$21)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34))*($11/($11+$21)) w linespoints title 'delta Nc=+1', 'homogeneo_curva_media.dat' ev 5 u 2:(($12+$22)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34))*($12/($12+$22)) w linespoints title 'delta Nc=+2', 'homogeneo_curva_media.dat' ev 5 u 2:(($28+$32)/($8+$9+$10+$11+$12+$28+$30+$18+$19+$20+$21+$22+$32+$34))*($28/($28+$32)) w linespoints title 'delta Nc=+3'

# %%BoundingBox: 28 38 430 302

#pause -1
