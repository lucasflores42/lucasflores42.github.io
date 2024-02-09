# Comments:
#
# Command line:  awk -f average_lucas.awk input > output
#
BEGIN{
i=1;
col1=2.4;
col2=0;
#imax=1; #repetiçoes do programa
}
{
# If not a comment, read record: 
 #if ($1 !~ /#/)
    #{
	if($1 == col1 && $2 == col2) 
	{
	tempo[i] += $1;
	valor[i] += $2;
	valor1[i] += $3;
	valor2[i] += $4;
	valor3[i] += $5;
	imax[i] += 1;
	col1=$1
	
	}
	else
	{
	col1=$1;
	col2=$2;
      	++i;
	imax[i] = 1;
	tempo[i] += $1;
	valor[i] += $2;
	valor1[i] += $3;
	valor2[i] += $4;
	valor3[i] += $5;
	 # a=imax[i];
	#printf("%f %f %f %f %f %f\n",tempo[i]/a,valor[i]/a, valor1[i]/a,valor2[i]/a,valor3[i]/a, a);
	}
    #}	
}
END {
	for(i=1;i<=3388;++i) # limite: numero total de passos
	{  a=imax[i];
          printf("%f %f %f %f %f %f\n",tempo[i]/a,valor[i]/a, valor1[i]/a,valor2[i]/a,valor3[i]/a, a);
	}
}


