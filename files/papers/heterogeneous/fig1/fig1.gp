

#set terminal postscript eps enhanced color
#set output 'invest_diagrama_triang.eps'



#Verde p/ P's
#set palette defined (0 "#ffffff", 0.5 "#99d8c9", 1 "#2ca25f")
#Azul p/ Coop.
#set palette defined (0 "#ffffff", 0.5 "#9ecae1", 1 "#3182bd")

set palette defined (0 0 0 0.5, 1 0 0 1, 2 0 0.5 1, 3 0 1 1, 4 0.5 1 0.5, 5 1 1 0, 6 1 0.5 0, 7 1 0 0, 8 0.5 0 0)

#set palette rgbformulae -31,13,22

set multiplot
#set dgrid3d 100,100 qnorm 4
#set pm3d corners2color median
unset key
set cbrange [0:1]
#set cblabel "{/Symbol r}_c + {/Symbol r}_p"
#set cblabel "{/Symbol r}_p" font ",25"
set cblabel "Density" font ",20" offset 1,0,0
#unset cbtics
#unset colorbox
set view map
#set dgrid3d

#set label 1 "(a)" font ",30" at -0.5,6.2 front

set pm3d map
set pm3d interpolate 2,2
set lmargin at screen 0.15
set rmargin at screen 0.8
set xtics  font ",20" ("0.01" 0, "1" 1, "2" 2, "3" 3, "4" 4, "5" 5)
set ytics font ",20"  #0.8,0.1,1.2 
set xrange[0.1:5.]
#set yrange[3.:7.5]
set yrange[4.:6.]
set xlabel '{c}' font ",25"
set ylabel 'r' font ",25" offset -5.5,0,0 rotate by 0
#set key font ",30" tamanho da label dentro da figura


splot "invest_diagrama_matriz.dat" u ($1/10.):(($2/10+3.5)):3 matrix with pm3d
#splot "invest_triang_matriz.dat" u ($1/10.):(($2/10+3.)):3 matrix with pm3d


#set size 0.45,0.45
#set origin 4.,0.

#splot "invest_quadrada_matriz.dat" u ($1/10):(($2/100+4.)):3 matrix with pm3d


pause -1
