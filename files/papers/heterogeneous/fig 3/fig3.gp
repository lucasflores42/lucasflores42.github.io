set terminal postscript eps enhanced color 
set output 'coex.eps'


set multiplot
set key left  
set key reverse Left
set key font ",25"
set yrange[0:1]
set xrange[4.2:5.5]
set xtics offset 0,-0.6 font ",30"  
set ytics font ",30"  
set xlabel 'r' offset 0,-1.6,0 font ",40" 
set ylabel '{/Symbol r}' rotate by 0 offset -1.5,0,0 font ",40" 
#set logscale x

#set arrow 1 from 4.58,0 to 4.58,1 nohead lw 2 dt 3
#set arrow 2 from 4.79,0 to 4.79,1 nohead lw 2 dt 3

set object 1 rect from 4.54,0 to 4.58,1 fc lt 8 fillstyle transparent solid 0.1 noborder
set object 11 rect from 4.58,0 to 4.61,1 fc lt 8 fillstyle transparent solid 0.2 noborder  
set object 2 rect from 4.77,0 to 4.79,1 fc lt 8 fillstyle transparent solid 0.1 noborder 
set object 22 rect from 4.79,0 to 4.83,1 fc lt 8 fillstyle transparent solid 0.2 noborder 

#set arrow from 4.54, graph 0 to 4.54, graph 1 nohead
#set arrow from 4.6, graph 0 to 4.6, graph 1 nohead
#set arrow from 4.74, graph 0 to 4.74, graph 1 nohead
#set arrow from 4.83, graph 0 to 4.83, graph 1 nohead
#set arrow from 4.81, graph 0 to 4.81, graph 1 nohead

set label 1 "C_{0.5}" font ",25" at 4.35, 0.36 front

#set label 2 "C_{0.5}" font ",15" at 4.55, 0.7 front
#set label 22 "+" font ",15" at 4.55, 0.65 front
#set label 222 "C_{1}" font ",15" at 4.55, 0.6 front

set label 3 "C_{1}" font ",25" at 4.68, 0.27 front

#set label 4 "C_{0.5 or 1}" font ",15" at 4.77, 0.7 front
#set label 5 "+" font ",15" at 4.77, 0.65 front
#set label 6 "C_{2}" font ",15" at 4.77, 0.6 front

#set label 44 "C_{0.5}" font ",15" at 4.81, 0.9 front
#set label 444 "+" font ",15" at 4.81, 0.85 front
#set label 55 "C_{2}" font ",15" at 4.81, 0.8 front

set label 7 "C_{2}" font ",25" at 4.923, 0.46 front



plot  'invest05_media.dat' u 1:4 w l dt 3 lw 3 title 'C_{0.5}',\
'invest1_media.dat' u 1:4 w l dt 2 lw 3 title 'C_{1}',\
'invest2_media.dat' u 1:4 w l dt 5 lw 3 title 'C_{2}',\
'invest_coex2_media.dat' u 1:4 w l lc 8 lw 4 title 'C_{i}'


unset arrow 1
unset arrow 2



set size 0.35,0.35
set origin 0.6,0.16

#set arrow 3 from 4.58,0.45 to 4.58,0.45 nohead lw 2

unset label
set xtics  font ",20"  4.5,0.05,4.65
set ytics font ",20"  0,0.1,.45 
set xrange[4.5:4.65]
set yrange[0.:0.45]
unset xlabel 
unset ylabel 
unset key
#set key right font ",10" #tamanho da label dentro da figura


plot  'invest_coex3_media.dat' u 1:2 w l lw 2 title 'C_{0.5}', 'invest_coex3_media.dat' u 1:3 w l lw 2 title 'C_{1}', 'invest_coex2_media.dat' u 1:4 w l lc 8 lw 3 title 'C_{i}'






# %%BoundingBox: 28 38 430 302



pause -1
