# Comments:
#
# Tira a media de dados com ate 3 parametros que estão no mesmo arquivo e os parametros iguais estao em sequencia

# se plotar com virgular escrever no terminal: export LC_NUMERIC="en_US.UTF-8"
# se tiver que usar menos parametros botar o inicial e final no fixo que ta no arquivo

#usar uma vez dentro do calcular_media.sh para juntar as evoluçoes em um mesmo arquivo
#usar denovo nesse novo arquivo com todas evoluçoes para tirar media

BEGIN {
count1 = 0;
count2 = 0;
count3 = 0;
}

{
	parametro1 = sprintf("%.3f", $1);
	parametro2 = sprintf("%.3f", $2);
	parametro3 = sprintf("%d", $3);

	for(j=1;j<=NF;j++)
	{
		media[parametro1,parametro2,parametro3,j] += $j; 
	}   		
	imax[parametro1,parametro2,parametro3] += 1;		
	#printf "%f %f %f %d\n",parametro1,parametro2,parametro3, imax[parametro1,parametro2,parametro3]

	m1[parametro1,parametro2,parametro3] += $7;
	m2[parametro1,parametro2,parametro3] += $7*$7; 	

	#-------------------------------------------------------------
	
	
    if (!(parametro1 in seen_parametro1)) 
	{
        parametro1_array[count1] = parametro1;
        seen_parametro1[parametro1] = 1;  # Mark parametro1 as seen
        count1++;
    }

	if (!(parametro2 in seen_parametro2)) 
	{
        parametro2_array[count2] = parametro2;
        seen_parametro2[parametro2] = 1;  # Mark parametro2 as seen
        count2++;
    }
	if (!(parametro3 in seen_parametro3)) 
	{
        parametro3_array[count3] = parametro3;
        seen_parametro3[parametro3] = 1;  # Mark parametro3 as seen
        count3++;
    }


}

END {

	for (i = 0; i < count1; i++)
	{  
		parametro1 = parametro1_array[i];
		#printf "Accessing parametro1_array[%d]: %f\n", k, parametro1_array[i];

		for (k = 0; k < count2	; k++)
		{
			parametro2 = parametro2_array[k];
			#printf "Accessing parametro2_array[%d]: %f\n", k, parametro2_array[k];

			for (w = 0; w < count3; w++)
			{ 
				parametro3 = parametro3_array[w];
				#printf "Accessing parametro3_array[%d]: %f\n", w, parametro3_array[w];

				a=imax[parametro1,parametro2,parametro3];
				#printf "%f %f %f %f\n ",parametro1,parametro2,parametro3,a
				desvio = sqrt((m2[parametro1,parametro2,parametro3] - (m1[parametro1,parametro2,parametro3]**2)/a)/a );

				for(j=1;j<=NF;j++)
				{
					printf "%f ", media[parametro1,parametro2,parametro3,j]/a
				}  
				printf "%f ",desvio
				printf "%d \n",a  
				  
			}
			printf "\n"   # spaces for heatmap2.gp
		}
			#printf "\n"   # spaces for heatmap2.gp
	}
}


