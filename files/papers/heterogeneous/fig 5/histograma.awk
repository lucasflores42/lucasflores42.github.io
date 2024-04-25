BEGIN{
col1 = 4.2
col2 = 0.
i=0.4;
}

{

if ($1 == 4.9)
 {
 	for(j=9;j<=54;j++)
	{
	i = i + 0.1
		printf("%f %f\n",i,$j);
	} 
	#print
	
}
else 
{
     	#printf("\n");
}

}
END{
 #printf("\n");
}
