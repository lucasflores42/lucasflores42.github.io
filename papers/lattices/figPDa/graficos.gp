reset

set term png
set output "PD_r.png"

set multiplot
set size 0.5, 1
#set size 1.0, 1.0
set xrange [0:1]

set key top left

set origin 0,0
set title "K=0.1"
plot	"media_temporal_quadrada.dat"   	w p pt 4 t "quad",\
		"media_temporal_triangular.dat" 	w p pt 9 t "triang",\
		"media_temporal_moore.dat" 			w p pt 5 t "moore",\
		"media_temporal_hexagonal.dat" 		w p pt 6 lc 8 ps 1.2 t "hex",\
		"media_temporal_kagome.dat"			w p pt 3 lc rgb "red" t "kag"

set origin 0.5,0
set title "K=0.0"
plot	"media_temporal_quadrada_K0.dat"    w p pt 4 ps 1.5 t "quad",\
	"media_temporal_triangular_K0.dat" 	w p pt 9 t "triang",\
	"media_temporal_moore_K0.dat" 		w p pt 5 t "moore",\
	"media_temporal_hexagonal_K0.dat" 	w p pt 6 lc 8 ps 1.2 t "hex",\
	"media_temporal_kagome_K0.dat"	  	w p pt 3 lc rgb "red" t "kag"


unset multiplot
