/********************************************************************
***                        Snapshots                              ***
********************************************************************/

//snap_gnuplot(strategy, topologia,investimento,label,t);
		/*
		if(t==1 || t==40 || t==90 || t==120 || t==300){
			printf("set terminal postscript eps enhanced color\n");
			printf("set output 'snapshotC1_MCS%d.eps'\n",t);
			snap_gnuplot(strategy, topologia,investimento,label,t);
			printf("unset terminal\n");
			
			fprintf(fp, "set terminal postscript eps enhanced color\n");
			fprintf(fp, "set output 'snapshotC1_MCS%d.eps'\n",t);
			snap_arquivo(strategy, topologia,investimento,label,t,fp);
		}
		*/ 

void snap_gnuplot(int state[N], int topologia[N], double *investimento, int label[N], int t)	//    ./a.out | gnuplot
{
	// plota de cima pra baixo, esquerda pra direita
	// gnuplot inverte baixo e cima
	int i,j;
	
	printf("set title \"MCS = %d\" \n",t);
	printf("set autoscale keepfix\n");
	printf("set palette model RGB\n");
	printf("unset border\n");
	//printf("unset colorbox\n");	
	printf("unset xtics\n");
	printf("unset ytics\n");
	//printf("set palette defined ( 0 \"dark-red\", 0.5 \"light-red\",  1  \"#0000B3\", 2 \"#000057\")\n");
	printf("set palette defined ( 0 \"red\", 1 \"blue\", 2 \"yellow\")\n");
	//printf("set palette defined ( 0 \"#a6611a\", 0.5 \"#dfc27d\",  1  \"#80cdc1\", 2 \"#018571\")\n");
	printf("set cbrange[0:2]\n");
	printf("set xrange[0:%d]\n",L);
	printf("set yrange[0:%d]\n",L);
	printf("set size square\n");
			
	printf("plot \"-\" matrix with image\n");
			

	for(i=0;i<L;i++)
	{
		for(j=0;j<L;j++)
		{
			printf("%d ",state[j+i*L]);
		
		}
		/*for(j=0;j<L;j++)
		{
			printf("%d ",state[j+i*L]);
		}*/
		printf("\n");
	}
	printf("\n"); 
	printf("e\n");    printf("pause(%lf)\n",fps);
}

void snap_arquivo(int state[N], int topologia[N], double *investimento, int label[N], int t, FILE *fp)	//    ./a.out | gnuplot
{
	// plota de cima pra baixo, esquerda pra direita
	// gnuplot inverte baixo e cima
	int i,j;
	
	fprintf(fp,"set title \"MCS = %d\" \n",t);
	fprintf(fp,"set autoscale keepfix\n");
	fprintf(fp,"set palette model RGB\n");
	fprintf(fp,"unset border\n");
	//printf("unset colorbox\n");	
	fprintf(fp,"unset xtics\n");
	fprintf(fp,"unset ytics\n");
	//printf("set palette defined ( 0 \"dark-red\", 0.5 \"light-red\",  1  \"#0000B3\", 2 \"#000057\")\n");
	//printf("set palette defined ( 0 \"black\", 0.4 \"green\", 1 \"red\",  2 \"light-blue\", 5 \"#000057\")\n");
	//printf("set palette defined ( 0 \"#a6611a\", 0.5 \"#dfc27d\",  1  \"#80cdc1\", 2 \"#018571\")\n");
	//printf("set cbrange[0:1]\n");
	fprintf(fp,"set xrange[0:%d]\n",L);
	fprintf(fp,"set yrange[0:%d]\n",L);
	fprintf(fp,"set size square\n");
			
	fprintf(fp,"plot \"-\" matrix with image\n");
			

	for(i=0;i<L;i++)
	{
		for(j=0;j<L;j++)
		{
			fprintf(fp,"%lf ",investimento[j+i*L]);
		
		}
		/*for(j=0;j<L;j++)
		{
			fprintf(fp,"%d ",state[j+i*L]);
		}*/
		fprintf(fp,"\n");
	}
	fprintf(fp,"\n"); 
	fprintf(fp,"e\n");    fprintf(fp,"pause(%lf)\n",fps);
}

void snap_gif(int state[N], int topologia[N], int t)
{

	int i,j;
	
	for(i=0;i<L;i++)
	{
		for(j=0;j<L;j++)
		{
			printf("%d ",state[j+i*L]);
		
		}
		/*for(j=0;j<L;j++)
		{
		printf("%d ",topologia[j+i*L]);
		}*/
		printf("\n");
	}
	printf("\n"); 

}

void snap_kagome(int state[N], int topologia[N], int t)
{

	int n,i,j; //n = i + 2j N
	double x,y;

	printf("set title \"MCS = %d\" \n",t);
	printf("set object 1 rect from graph 0, graph 0 to graph 1, graph 1 back\n");
	printf("set object 1 rect fc rgb \"black\" fillstyle solid 1.0 \n");
	printf("set view map\n");
	printf("set size ratio .9\n");
	//printf("set xrange[30:50]\n");
	//printf("set yrange[30:60]\n");
	printf("set xrange[00:100]\n");
	printf("set yrange[0:40]\n");
	printf("set palette defined ( 0 \"red\", 1 \"blue\",  2 \"green\")\n");
	printf("set cbrange[0:2]\n");
	printf("unset key\n");
	printf("splot \"-\" using 1:2:3 with points pointtype 7 pointsize 1. palette linewidth 10\n");

	for(n=0;n<N;n++)
	{
	//int L = 100;
	int d = 1;
	double h = d*pow(3/4,1/2);
	int n_celula = (int) (n/3);
	int linha_celula = (int) (n_celula/L);
	int coluna_celula = (n_celula%(L));	
		if(n % 3 == 0)
		{
			x = 2*d*coluna_celula + linha_celula*d;
			y = 0 + 2*h*linha_celula;
		}
		if(n % 3 == 1)
		{
			x = d + 2*d*coluna_celula  + linha_celula*d;
			y = 0 + 2*h*linha_celula;
		}
		if(n % 3 == 2)
		{
			x = (d/2.) + 2*d*coluna_celula  + linha_celula*d;
			y = h + 2*h*linha_celula;
		}
		printf("%lf %lf %d\n",x,y,state[n]);
		//printf("%lf %lf %d %lf %lf\n",x,y,a,h,2*h* (int) (n_celula/L));
	}
	printf("\n"); 
	printf("e\n");    printf("pause(%lf)\n",fps);
}

void snap_hexa(int state[N], int topologia[N], int t)
{

	int n,i,j; //n = i + 2j N
	double x,y,d=1,h=70.;

	printf("set title \"MCS = %d\" \n",t);
	printf("set object 1 rect from graph 0, graph 0 to graph 1, graph 1 back\n");
	printf("set object 1 rect fc rgb \"black\" fillstyle solid 1.0 \n");
	printf("set view map\n");
	printf("set size ratio .9\n");
	//printf("set xrange[00:100]\n");
	//printf("set yrange[0:2000]\n");
	printf("set palette defined ( 0 \"red\", 1 \"blue\",  2 \"green\")\n");
	printf("set cbrange[0:2]\n");
	printf("unset key\n");
	printf("splot \"-\" using 1:2:3 with points pointtype 7 pointsize 1. palette linewidth 10\n");

	for(n=0;n<N;n++)
	{
		i = n % (2*L);
		j = n / (2*L);

		x = d*(i+j);
		y = j*(L+h) - h*(i%2);

		printf("%lf %lf %d\n",x,y,state[n]);

	}
	printf("\n"); 
	printf("e\n");    printf("pause(%lf)\n",fps);
}
/********************************************************************
***		                  Hoshen - Kopelman                       ***
********************************************************************/				
void calculo_percolacao( int state[N], int **viz, int label[N])
{
	int largest_label = 0;
	int n,i;

	for(n=0;n<N;n++)
	{
		label[n] = state[n]*(n+1);
	}
	
	for(n=0;n<N;n++)
	{
		if(state[n]==1)
		{
			if(state[viz[n][1]] == 0 && state[viz[n][4]] != 0)
			{
				int a = label[n];
				label[n] = label[viz[n][4]];
			
				for(i=0;i<N;i++)
				{
					if(label[i]==a)
					{label[i]=label[n];}
				}
			}
			else if(state[viz[n][1]] != 0 && state[viz[n][4]] == 0)
			{
				int a = label[n];
				label[n] = label[viz[n][1]];
			
				for(i=0;i<N;i++)
				{
					if(label[i]==a)
					{label[i]=label[n];}
				}
			}
			else if(state[viz[n][1]] != 0 && state[viz[n][4]] != 0)
			{
				int a = label[viz[n][1]];
				int b = label[n];
				label[viz[n][1]] = label[viz[n][4]];
				label[n] = label[viz[n][4]];
			
				for(i=0;i<N;i++)
				{
					if(label[i]==a || label[i]==b)
					{label[i]=label[n];}
				}
			}
		}
	}
}
/********************************************************************
***		             contribuiçao por cluster                     ***
********************************************************************/				
void calculo_tamanho_cluster( int state[N], int **viz, int label[N], double *investimento, int t)
{
	int n,m,flag;
	double tamanho,inv_medio, desvio, desvio_acum;
	long double inve, inve2,inve22;
	desvio_acum = 0.;

	for(m=0;m<N;m++)
	{	
		if(label[m]!=0)
		{
			tamanho = 0.;
			inve = 0.;
			inve2 = 0.;
			desvio = 0.;
			//inv_medio = 0.;

			for(n=0;n<N;n++)
			{
				if(label[n]==label[m])
				{
					tamanho += 1.;
					inve += investimento[n];
					inve2 += investimento[n]*investimento[n];
					inve22 = inve*inve;
					//desvio += sqrt(inve2/tamanho-inve22/(tamanho*tamanho));
					desvio += inve2/tamanho-inve22/(tamanho*tamanho); // variancia
				}
			}
			inv_medio = inve/tamanho;
			desvio_acum += desvio/tamanho; // soma desvio de cada cluster por passo
			//printf("%d %d %lf %lf\n", t, label[m], inv_medio, desvio);
		}
	}
	printf("%d %lf\n", t, desvio_acum);
	//printf("%d %.26Lf %.26Lf %lf %Lf\n",t, inve22/(tamanho*tamanho),inve2/tamanho,tamanho, inve2/tamanho-inve22/(tamanho*tamanho));
}
/********************************************************************
***                  distribuição da contribuiçao                 ***
********************************************************************/
void calculo_ci_investimento(double  *investimento, int state[N], double gama)
{	

	int i;
	for(i=0;i<N;i++)
	{
		double ga1 = gsl_rng_uniform(rand_vec);
		double ga2 = gsl_rng_uniform(rand_vec);
		double gaussian = 4 + 1*sqrt(-2*log(ga1))*cos(2*M_PI*ga2); // media 3 desvio 1
		int k = 1 + (int) 3*gsl_rng_uniform(rand_vec); // X*gsl_rng_uniform(rand_vec) vai de 0 até X-1
		double kk = 5*gsl_rng_uniform(rand_vec);
		if(k==1){kk=0.5;}
		if(k==2){kk=1.0;}
		if(k==3){kk=2.0;}

		if(state[i] == 0){investimento[i] = 0.0;}
		if(state[i] == 1){investimento[i] = 1.0;}
		if(state[i] == 2){investimento[i] = 1.0;}		
				
		//printf(" %d %d %lf\n",i,state[i],investimento[i]);
	}
}
/********************************************************************
***                         payoff total                          ***
********************************************************************/
void calculo_payoff_total(double *payoff, int state[N], int **viz, double r, double gama, double delta, int topologia[N], double *investimento)
{
	int i;
	payoff_total_C = 0.;
	payoff_total_D = 0.;
	payoff_total_resto = 0.;

	for(i=0;i<N;i++)
	{
		calculo_payoff(payoff,r,gama,delta,i,topologia,state,investimento,viz);
	
		if(state[i]==1){payoff_total_C += payoff[state[i]];}
		if(state[i]==0){payoff_total_D += payoff[state[i]];}
		else{payoff_total_resto += payoff[state[i]];}
		//printf("%d %d %lf %lf %lf %lf\n", state[i], topologia[i], investimento_total, payoff[state[i]], payoff_total_C, payoff_total_D);
	}

}
/********************************************************************
***                  distribuição dos estados                     ***
********************************************************************/	
void calculo_ci_square1(int strategy[N], int **viz)
{
	int n;
	for(n=0; n < N; n++)
	{	
		int i,j;
		j=n%L;
		i=n/L;
		//if(j<L/2){strategy[j+i*L] = COOPERATOR; investimento[j+i*L] = 0.5;}
		//else{strategy[j+i*L] = COOPERATOR; investimento[j+i*L] = 2.0;}
		strategy[j+i*L] = 0; investimento[j+i*L] = 0.0;
		//if(j==L/3 || j==2*L/3 || i==L/3 || i==2*L/3){strategy[j+i*L] = COOPERATOR;investimento[j+i*L] = 0.;}
		if(j>L/3 && j<2*L/3 && i>L/3 && i<2*L/3){strategy[j+i*L] = 1;investimento[j+i*L] = 1.;}
	}
}
void calculo_ci_square2(int strategy[N], int **viz)
{
	int n;
	for(n=0; n < N; n++)
	{	
		int i,j;
		j=n%L;
		i=n/L;
		strategy[n] = 0;

		if(j>1*L/5 && j<2*L/5 && i>1*L/5 && i<2*L/5){strategy[j+i*L] = 1;investimento[j+i*L] = 0.55;}
		
		if(j>3*L/5 && j<4*L/5 && i>1*L/5 && i<2*L/5)
		{
			double temp = gsl_rng_uniform(rand_vec);
			if(temp < 0.5) {investimento[j+i*L] = 3.25;strategy[j+i*L] = 1;}
			else{investimento[j+i*L] = 3.25;strategy[j+i*L] = 1;}
		}
		if(j>1*L/5 && j<2*L/5 && i>3*L/5 && i<4*L/5)
		{
			double temp = gsl_rng_uniform(rand_vec);
			if(temp < 1./3) {strategy[j+i*L] = 1;investimento[j+i*L] = 0.;}
			else if(temp < 2./3) {strategy[j+i*L] = 1;investimento[j+i*L] = 2.45;}			
			else{strategy[j+i*L] = 1;investimento[j+i*L] = 3.25;}
		}
		if(j>3*L/5 && j<4*L/5 && i>3*L/5 && i<4*L/5){strategy[j+i*L] = 1;investimento[j+i*L] = 2.45;}
	
	}
}
void calculo_ci_stripes(int strategy[N], int **viz)
{
	int n;
	for(n=0; n < N; n++)
	{	
		int i,j;
		j=n%L;
		i=n/L;
		if(i<L/4)				{strategy[j+i*L] = 0;investimento[j+i*L] = 0;}
		if(i>=L/4 && i<2*L/4)	{strategy[j+i*L] = 1;investimento[j+i*L] = 0.4;}	
		if(i>=2*L/4 && i<3*L/4)	{strategy[j+i*L] = 1;investimento[j+i*L] = 0.7;}	
		if(i>=3*L/4)			{strategy[j+i*L] = 1;investimento[j+i*L] = 0.0;}
	}
}