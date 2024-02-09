# Comments:
# The evaluated errors are sample to sample errors.
# Data lines starting with '#' are comments.
#
# Command line:  awk -f media_temporal.awk input 
#
# V0.01 - 10/05/2002 - MHV
# If not a comment, read record: 
BEGIN { 
      media1=0;
      media2=0;
      media3=0;
      i=0;
      }
{
 if ($1 !~ /#/)
       {
# The number of columns: should be constant, but since some lines can
# be empty...
	if ($1 >=70000)
     	 {
		media1  += $2;
		media2  += $3;
		media3  += $4;
		 ++i;
	 }    
       }	 
}
END { #print #$2 $3 $4
# The integer division gives the number of lines (incomplete lines
# are neglected):
             printf("%.8f %.8f %.8f 1.0\n",media1/i, media2/i, media3/i, 1);
    }


