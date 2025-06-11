---
title: Time Average in equilibrium.
#author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [Data analysis, awk]
tags: [code, awk]
pin: false
math: true
mermaid: true
hidden: true
---


<hr>

Code used in <code class="language-plaintext highlighter-rouge">calcular_media.sh</code> to average over time the equilibrium densities from each sample.

[Download file](/files/scripts/data_analysis/media_temporal_equilibrio.awk){:download}


```awk
# Comments:
# plota densidade media no equilibrio pra uma evoluçao temporal

# se plotar com virgular escrever no terminal: export LC_NUMERIC="en_US.UTF-8"

BEGIN { 
        #printf export LC_NUMERIC="en_US.UTF-8"      
	i=0;

      }
{
	

	if ($1 >=70000) 
     	{
		for(j=1;j<=NF;j++)
		{
			media[j] += $j; 
			#print media[j]
		}  						
		++i;
	}    
		 
}
END { 

	for(j=2;j<=NF;j++)
	{
		#media[j] += $j; 
		printf "%s ",media[j]/i
		#print media[j]/i
	}  printf "\n"
	

    }


```
