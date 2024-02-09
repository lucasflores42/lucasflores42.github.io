# Comments:
# plota densidade media no equilibrio pra uma evoluçao temporal

# se plotar com virgular escrever no terminal: export LC_NUMERIC="en_US.UTF-8"

#usar uma vez dentro do calcular_media.sh para juntar as evoluçoes em um mesmo arquivo
#usar denovo nesse novo arquivo com todas evoluçoes para tirar media

BEGIN { 
        #printf export LC_NUMERIC="en_US.UTF-8"      
        
	parametro1_inicial = 0;
	parametro1_final = 99999;
	parametro1_var = 1;
	
      }
{
	parametro1 = $1 + 0;
	
	if ($1 >=0) 
     	{
		for(j=1;j<=NF;j++)
		{
			media[parametro1,j] += $j; 
			#print media[j]
		}  						
		imax[parametro1] += 1;	#numero de evoluçoes temporais
	}    
		 
}
END { 

	for(i=parametro1_inicial;i<=parametro1_final;i=i+parametro1_var) 
	{
		a = imax[i];
		
		for(j=1;j<=NF;j++)
		{
			#media[j] += $j; 
			printf "%f ",media[i,j]/a
		}  	printf "%d \n",a  
	
	}
    }


