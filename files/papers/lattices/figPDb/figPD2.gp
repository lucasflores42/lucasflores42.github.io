set terminal postscript eps enhanced color 
set output 'PD_r2.eps'

#set multiplot

set xtics font ",30"  
set ytics font ",30"  
set xrange[-2.1:-1.]
set yrange[0.:1.0]
set ylabel "{/Symbol r}_C" rotate by 0 offset -1.5,0,0 font ",40" 
set xlabel '-b' offset 0,-1.1,0 font ",40" 
set key top left font ",25" 

plot 	'media_temporal_hexagonal.dat' 	u (-$1):2 w l title 'Hexagonal',\
	'media_temporal_quadrada.dat' 	u (-$1):2 w l title 'Square',\
	'media_temporal_kagome.dat' 	u (-$1):2 w l title 'Kagome',\
	'media_temporal_triangular.dat' u (-$1):2 w l title 'Triangular',\
	'media_temporal_moore.dat' 	u (-$1):2 w l title 'Moore'#,\
	'Wcubica_media.txt' 		u (-$1):3 w l title 'Cubic',\
	'Wquadri_media.txt' 		u (-$1):3 w l title 'Quadridimensional'

#pause -1

#%%BoundingBox: 28 38 430 302
