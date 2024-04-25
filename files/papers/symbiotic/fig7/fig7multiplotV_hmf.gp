set terminal postscript eps enhanced color 
set output 'wellV_hmf.eps'

set colorsequence classic

#set tmargin 0
set bmargin 0.5
#set lmargin 3
#set rmargin 3

#set multiplot
set multiplot layout 2, 1

# 7a
set xtics font ",35"  offset 0,-1,0
set ytics font ",35"  
set key font ',35' at 2000,0.9
unset key
set ylabel 'Density' font ",40" offset -4,0,0
#set xlabel 'Time'  font ",40" offset -4,-2,0
set logscale x
set xrange[1.:3000]
set yrange[0:1.05]

set label 1 "(a)" font ",40" at 1200, 0.15 front
set format x ''
#unset xtics
unset xlabel
#7a
plot 'dados_media' u 1:2 w l lt 3 lw 6,\
     'dados_media' u 1:3 w l lt 1 lw 6,\
     'dados_media' u 1:4 w l lt 2 lw 6 



#7b
set xtics font ",35"  offset 0,-1,0
set ytics font ",35"  
set key font ',35' at 2000,0.9
#set key font ',40' at 2000,0.9
#unset key
#set ylabel 'Density' font ",40" offset -6,0,0
set xlabel 'Time'  font ",40" offset -4,-1.5,0
set logscale x
set xrange[1.:3000]
set yrange[0:1.05]

set label 1 "(b)" font ",40" at 1200, 0.17 front

set xtics font ",35"  offset 0,-1,0
unset format x
#7b
plot 'wellmixed_media' u 1:2 w l lt 3 lw 6 title 'C',\
     'wellmixed_media' u 1:3 w l lt 1 lw 6 title 'D',\
     'wellmixed_media' u 1:4 w l lt 2 lw 6 title 'P'

#pause -1

#   %%BoundingBox: 28 38 430 302
