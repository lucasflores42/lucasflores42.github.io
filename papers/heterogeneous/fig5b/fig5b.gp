set terminal postscript eps enhanced color 
set output 'heterog2.eps'
set boxwidth 0.00001 #absolute
set boxdepth 0.1 #absolute

set label 1 "(b)" font ",30" at 5.7,1.4 front

set style fill  transparent solid 0.70 border
set grid nopolar
set grid xtics nomxtics ytics nomytics ztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid vertical layerdefault   lt 0 linecolor 0 linewidth 1.000,  lt 0 linecolor 0 linewidth 1.000
unset grid
unset key
set view 30, 60, 1, 1
set style data lines
set xyplane at 0
#set title "transparent boxes with imperfect depth sorting" 
set xrange [ 5. : 4.2 ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0. : 5. ] noreverse nowriteback
set y2range [ * : * ] noreverse writeback
set zrange [ 0.01 : 1.0 ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
set xlabel 'r' font ",30" 
set ylabel 'c' font ",30" 
set zlabel '{/Symbol r}' font ",30" offset -1.5,0,0
set xtics font ",20"  
set ytics font ",20" offset 0,-0.1,0 
set ztics font ",20" 0,0.2,1
set pm3d depthorder 

set pm3d interpolate 1,1 flush begin noftriangles border linewidth 1.000 dashtype solid corners2color mean

rgbfudge(x) = x*51*32768 + (11-x)*51*128 + int(abs(5.5-x)*510/9.)
ti(col) = sprintf("%f",col)
NO_ANIMATION = 1
## Last datafile plotted: "candlesticks.dat"

#splot for [col=9:54] 'histograma_media.dat' using 1:((col-5)/10.):((col*column(col))/1):(rgbfudge($1))  with boxes fc rgb variable

splot for [col=9:54] 'histograma_media.dat' using 1:(col-9+4.5)/10.:((column(col))/($56*10000)):(rgbfudge($1)) ev 3 with boxes fc rgb variable



pause -1

