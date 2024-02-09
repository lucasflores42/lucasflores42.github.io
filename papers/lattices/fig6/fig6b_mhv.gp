#set terminal postscript eps enhanced color 
#set terminal png enhanced 
set terminal pdf enhanced
set output 'fig6.pdf'
 
set xtics 0.,1.,12 offset 0,-0.5 font ",20"  
set ytics font ",20"  
set key left font ",25"
set xlabel 'N_{C}' font ",24" offset 0,-1.4
set ylabel 'Freq.'  font ",22" offset -0.5,0
set xrange[0:12.5]
set yrange[0:1]

set key font ",17"

set style fill transparent solid 0.3
#binwidth=1
#bin(x,width)=width*floor(x/width) + width/2.0

plot 	'count2_r4.dat' u 1:($2/1000) w boxes title 'kagome (G=5)' ,\
	'count2_r4.dat' u 1:($3/1000) w boxes title 'von Neumann (G=5)'
	
	 

#plot 'count2_r4.dat' using (bin($1,binwidth)):($2/1000) smooth freq with boxes title 'kagome (G=5)', 'count2_r4.dat' using (bin($1,binwidth)):($3/1000) smooth freq with boxes title 'von Neumann (G=5)'

#pause -1

#%%BoundingBox: 28 38 430 302
