#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>
#include "pointers.h"
#include "regular_lattices.h"

//------------------------------------------------------

#define fps 0000.01000000005 // fps^-1
//#define densidade_arquivo
#define densidade_terminal	

/********************************************************************
***                 		Global variables                   	  ***
********************************************************************/	
const int tmax=9999;//5000;

long long int N;
int L;
int G; // =4 (rede hexagonal) =5 (rede quadrada / kagome) =7 (rede triangular / quadrada 3D) =9 (rede moore / quadrada 4D)
double RUIDO;

/********************************************************************
***                 			 GSL                    		 ***
********************************************************************/	
unsigned long rseed;
const gsl_rng_type * T;
gsl_rng * rand_vec;

//#define DEBUG
	
void set_gsl_rng(void)
{
	#ifdef DEBUG
		rseed=1681248046;
	#else
		rseed=time(NULL);
	#endif

	gsl_rng_env_setup();
	T    = gsl_rng_default;
	rand_vec = gsl_rng_alloc (T);
	gsl_rng_set (rand_vec, rseed);
}
/********************************************************************
***                  distribuição dos estados                     ***
********************************************************************/		
void calculo_ci_rand(int strategy[N], int **viz)
{	
	int n;
	for(n=0; n < N; n++)
	{	
		double aa = gsl_rng_uniform(rand_vec);
		
		if(aa < 0.5 ) {strategy[n] = 1;}
		else {strategy[n] = 0;}
	}
}
/********************************************************************
***                          Payoff                               ***
********************************************************************/
void calculo_payoff_pd ( double *payoff, double r, double gama, double delta, int x, int strategy[N], int **viz )
{

	// x: sitio central do grupo que o jogo ocorre
	// y: sitio que esta jogando

	int nd=0;
	int nc=0;
	int np=0;
	int i=0;

	for(i=0;i<G;i++) // vizinho 0 e o proprio sitio
	{
		switch(strategy[viz[x][i]])
		{
			case 0: ++nd; break;
			case 1: ++nc; break;
			case 2: ++np; break;
			default: 
				fprintf(stderr,"ERRO calculo vizinhos\n");
				fflush(stderr);
		}
	}

	double S = -r;
	double P = 0;
	double R = 1;		
	double T = 1+r;

	payoff[1] = R*(nc-1) + S*nd;
	payoff[0] = T*nc + P*nd;

}
void calculo_payoff_pgg ( double *payoff, double r, double gama, double delta, int x, int strategy[N], int **viz )
{

	// x: sitio central do grupo que o jogo ocorre
	// y: sitio que esta jogando

	int nd, nc, np, i, j, focal_node;

	payoff[1] = 0;
	payoff[0] = 0;

	for(j=0;j<G;j++) // set only first term for FPGG (loop between groups)
	{
		nd = 0;
        nc = 0;
        np = 0;
		focal_node = viz[x][j];

		for(i=0;i<G;i++) // loop inside a group
		{
			switch(strategy[viz[focal_node][i]])
			{
				case 0: ++nd; break;
				case 1: ++nc; break;
				case 2: ++np; break;
				default: 
					fprintf(stderr,"ERRO calculo vizinhos\n");
					fflush(stderr);
			}
		}

		payoff[1] += (r/G)*nc - 1;
		payoff[0] += (r/G)*nc; 
	}
}
/********************************************************************
***                         Update rule                           ***
********************************************************************/
void update_rule( int x, int vizinho, int strategy[N], double Px, double Py , int t)
{

	double Wxy = 1.0/(1.0 + exp(-(Py-Px)/RUIDO));

	double l = gsl_rng_uniform(rand_vec);

	//printf("Px=%lf Py=%lf delta=%lf W=%lf \n",Px,Py,Py-Px,Wxy);

	//troca de estado
	if(Wxy > l)
	{   
		strategy[x] = strategy[vizinho];
	}
}
/********************************************************************
***                            MCS                                ***
********************************************************************/
void calculo_mcs(double *payoff, int strategy[N], int **viz, double r, double gama, double delta, int t)
{

	int n;
	for(n=0; n<N; n++)
	{					

		int x = (int) N*gsl_rng_uniform(rand_vec);
   		int sitio = x;

		int y = 1 + (int) (G-1)*gsl_rng_uniform(rand_vec); 
		int vizinho = viz[x][y];

		calculo_payoff_pgg(payoff,r,gama,delta,sitio,strategy,viz);
		double Px = payoff[strategy[sitio]];

		calculo_payoff_pgg(payoff,r,gama,delta,vizinho,strategy,viz);
		double Py = payoff[strategy[vizinho]];
		//printf("%d %f %f\n", t, Px, Py);
		update_rule(x,vizinho,strategy,Px,Py,t);
		
  	}
}
/********************************************************************
***                          Densidades                           ***
********************************************************************/
int calculo_densidades(int strategy[N], double *payoff, int **viz, double r, double gama, double delta, int t, FILE *fp)
{
	
	//long double mediaC=0.;
	//long double mediaC2=0.;
	//long double mediaD=0.;
	//long double mediaD2=0.;

	int k;
	int ND=0;
	int NC=0;
	int NP=0;

	for(k=0;k<N;k++)
	{
		switch (strategy[k])
		{
			case 1: ++NC; break;
			case 2: ++NP; break;
			case 0: ++ND; break;
			default: 
				fprintf(stderr,"ERRO - tipo de estrategia\n");
				fflush(stderr);
		}	
		/*if(strategy[k] == 1)
		{
			mediaC += investimento[k];
			mediaC2 += investimento[k]*investimento[k];			
		}
		if(strategy[k] == 0)
		{
			mediaD += investimento[k];
			mediaD2 += investimento[k]*investimento[k];			
		}*/
	}	

 	/*double media_C = (double)mediaC/(NC);
	double desvio_C = (double)sqrt((0.0000000001+mediaC2-(mediaC*mediaC)/(NC))/NC);

 	double media_D = (double)mediaD/(ND);
	double desvio_D = (double)sqrt((mediaD2-(mediaD*mediaD)/(ND))/ND);
	
	if(NC == 0) 
	{
		media_C = 0.;
		desvio_C = 0.;
	}
	if(ND == 0) 
	{
		media_D = 0.;
		desvio_D = 0.;
	}

	calculo_payoff_total(payoff,strategy,viz,r,gama,delta,topologia,investimento);
	double payoff_total = payoff_total_C + payoff_total_D + payoff_total_resto;
	*/

	#ifdef densidade_terminal
	printf("%d %lf %lf\n", t, (double)NC/(N), (double)ND/(N));
	#endif

	#ifdef densidade_arquivo
	fprintf(fp,"%d %lf %lf %lf %lf %lf\n", t, (double)NC/(N), (double)ND/(N), (double)NP/(N), media_C ,desvio_C);	
	#endif

   // Return 1 if any strategy dominates, 0 otherwise
    if (NC == N || ND == N || NP == N) {
        return 1;  // All agents have the same strategy
    } else {
        return 0;  // Mixed strategies
    }
}

/********************************************************************
***                          Main                                 ***
********************************************************************/
void main(int argc, char *argv[])
{	
	//------------------------------------------------------------------------------
	// gcc dilema.c -lm -lgsl -lgslcblas -O3 ---- 							   //***
	// ./a.out r gama delta L ruido								   			   //***
								   											   //***
	double payoff[2], gama, delta, r;								  		   //***
	int **viz;								   								   //***
								   											   //***
	r=atof(argv[1]);														   //***
	gama=atof(argv[2]);														   //***
	delta=atof(argv[3]);													   //***
	L=atoi(argv[4]);														   //***
	RUIDO=atof(argv[5]); 													   //***
																			   //***
	set_gsl_rng(); // gsl   												   //***
								 											   //***
	//gera arquivo										  					   //***
	char filename[200];														   //***
	FILE *fp;																   //***
	#ifdef densidade_arquivo									   			   
	sprintf(filename,"dados_r%f_g%f_d%f_seed%ld.txt",r,gama,delta,rseed);	   //***
	#endif																	   //***
	fp=fopen(filename,"w"); //abre .dat									       //***
																			   //***					
	// --------------------------------------								   //***
	// especificar dependendo da rede										   //***
	N = L*L; 																   //***
	G = 5;								   									   //***
	viz = create_2d_int_pointer_h(N,G);									       //***
	square_lattice(viz,L);													   //***
	int strategy[N]; // sempre depois de declarar N							   //***
	//-------------------C.I.-------------------------------------------------------

	calculo_ci_rand(strategy,viz);
	calculo_densidades(strategy,payoff,viz,r,gama,delta,0,fp);
	
	//-------------------MCS--------------------------------------------------------
	int t=0;	
	for(t=1; t < tmax; t++)
	{	
		
		calculo_mcs(payoff,strategy,viz,r,gama,delta,t);
		calculo_densidades(strategy,payoff,viz,r,gama,delta,t,fp);

  		/*
		int stop = calculo_densidades(strategy, payoff, viz, r, gama, delta, t, fp);
		if (stop == 1) 
		{
			while (t < tmax) 
			{
				calculo_densidades(strategy, payoff, viz, r, gama, delta, t, fp);
				t++; 
			} 
			break;
		}	
		*/
	}//MCS

fclose(fp);
free_2d_int_pointer(viz,N,G);

} //main
