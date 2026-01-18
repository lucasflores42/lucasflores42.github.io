---
title: Histogram
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

Code used to separate some parameter values from the complete file.

Run with <code class="language-plaintext highlighter-rouge">awk -f code.awk file</code>.

[Download file](/files/scripts/data_analysis/histogram.awk){:download}

```awk
BEGIN{
col1 = 4.2
col2 = 0.
i=0.4;
}

{
    if(col1!=$1)
    {
        i=0.4
        col1 = $1
        printf("\n");    
    }

     for(j=9;j<=54;j++)
    {
    i = i + 0.1
        printf("%f %f %f\n",$1,i,$j);
    } 
    #print
}

END{
 #printf("\n");
}
```
