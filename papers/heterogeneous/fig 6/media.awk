# Comments:
#
# Tira a media de dados com 2 parametros que estão no mesmo arquivo e os parametros iguais estao em sequencia
# Para botar varias no mesmo arquivo usar calcular_media_lucas.sh

# se plotar com virgular escrever no terminal: export LC_NUMERIC="en_US.UTF-8"
# se tiver que usar menos parametros botar o inicial e final no fixo que ta no arquivo

BEGIN{
i=1;
parametro1_inicial = 4.2;
parametro1_final = 5.5;
parametro1_var = 0.01;

a = 0.0
parametro2_inicial = a;
parametro2_final = a; # tem que botar uma variaçao a mais do que o valor maximo (?)
parametro2_var = 0.01;
}
{
# If not a comment, read record: 
 #if ($1 !~ /#/)
    #{

	parametro1 = $1 + 0;
    	parametro2 = $2 + 0;  #quando uasr em evoluçao temporal mudar esse valor
	for(j=1;j<=NF;j++)
	{
		media[parametro1,parametro2,j] += $j; 
		
	}   		
	imax[parametro1,parametro2] += 1;		


	desvio1[parametro1,parametro2] += $4;
	desvio2[parametro1,parametro2] += $4*$4; 	 	
}
END {
	for(i=parametro1_inicial;i<=parametro1_final;i=i+parametro1_var) 
	{  
		for(k=parametro2_inicial;k<=parametro2_final;k=k+parametro2_var) 
		{ 
			a=imax[i,k];
			desvio = sqrt( (desvio2[i,k] - (desvio1[i,k]*desvio1[i,k])/a)/a );
			
		   	for(j=1;j<=NF;j++)
			{
				printf "%f ",media[i,k,j]/a
			}  	
			printf "%f ",desvio
			printf "%d \n",a      
		}
        
	}
}


