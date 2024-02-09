reset
set table "temp_f.dat"
set samples 1000

c=1
N=5
# P  e D
f(x,npp,npd) = N*((npd+npp-N)*x-c)/(c*(npd-npp))

#C contra D na presenca de P
g(x,ncpcc,ndp,ndc) = N*(ndp*x-c)/(c*(ndp+ndc-ncpcc))
i(x)=2.5
#P contra D na presenca de C
h(x,npcpp,ndp,ndc) = N*((ndp+npcpp-N)*x-c)/(c*(ndp+ndc-npcpp))
#plot f(x,3,1), f(x,4,3), 2.5

f(x)= (x<0.19001) ? N*((3+4-N)*x-c)/(c*(3-4)) : N*((1+3-N)*x-c)/(c*(1-3))
plot f(x), (x>1? i(x): 1/0)


f1(x)=N*((3+4-N)*x-c)/(c*(3-4)) 
f2(x)=N*((1+3-N)*x-c)/(c*(1-3))

# retas de payoff
plot [0:0.2] N*((3+4-N)*x-c)/(5*c*(3-4)), [0.2:1] N*((1+3-N)*x-c)/(5*c*(1-3)), [1:5] 0.5 


unset table
unset key

set terminal postscript eps enhanced color
set output 'CPmenosP_hmf.eps'


#Verde p/ P's
set palette defined (0 "#ffffff", 0.5 "#99d8c9", 1 "#2ca25f")
#Azul p/ Coop.
#set palette defined (0 "#ffffff", 0.5 "#9ecae1", 1 "#3182bd")



#set dgrid3d 100,100 qnorm 4
#set pm3d corners2color median
unset key
set cbrange [0:1]
#set cblabel "{/Symbol r}_c + {/Symbol r}_p"
#set cblabel "{/Symbol r}_p" font ",25"
#set cblabel "Density" font ",20" offset 1,0,0
set label 1 "(c)" font ",25" at 0.05, 0.52 front
set label 2 "{/Symbol r}_p - {/Symbol r}_c" font ",25" at 1.17, 1.05 rotate by 0 

#unset cbtics
#unset colorbox
set view map
#set dgrid3d
set pm3d map
set pm3d interpolate 0,0
set lmargin at screen 0.15
set rmargin at screen 0.8
set xtics font ",20"  
set ytics font ",20"  
set xrange[0.:1.2]
set yrange[0.48:1.01]
set xlabel '{/Symbol g}' font ",25"
set ylabel 'rc/G' font ",25" offset -3,0,0 rotate by 0
#set key font ",30" tamanho da label dentro da figura

splot "matriz3c.dat" u ($1/100.):(($2/10+2.4)/5):3 matrix with pm3d

#splot "matrizteste.dat" u ($1/100.):(($2/10+2.4)/5):3 matrix with pm3d, "temp_f.dat" u 1:2:(0) notitle with lines lw 1 lc -1, "reta4.dat" u 1:2:(0) w l lw 1 lc -1

#paste dados_media dadosP_media | awk '{print $1,$2,$3-$9,$4-$10,$5-$11}'>dados3c

pause -1
