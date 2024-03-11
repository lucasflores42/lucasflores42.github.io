---
title: Transf. matrix
author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [Data analysis, awk]
tags: [code, awk]
pin: false
math: true
mermaid: true

---

[Download file](/codes/scripts/transformar_em_matriz.awk){:download}


Code to take a file with the parameters and results in columns and transform into a matrix. Need to be used to use the heatmap.gp.






```awk
BEGIN{
col1 = 2.
col2 = 0.
i=0;
}
{
if ($1 != col1)
 {
	printf("\n");
	col1 = $1
	#if($4+$6 !=0)
	#{
 	#printf("%f ",$4/($4+$6));
	#}
	#else{printf("0 ");} 
	printf("%f ",$3);
}
else 
{
     #if ($2 !=1.3 )

	#if($4+$6 !=0)
	#{
 	#printf("%f ",$4/($4+$6));
	#}
	#else{printf("0 ");} 
	printf("%f ",$3);

#   ++i;
#   if (i==16)
#   {
#	  printf("\n");
#	i=0;
#   }
}

}
END{
 printf("\n");
}
```
