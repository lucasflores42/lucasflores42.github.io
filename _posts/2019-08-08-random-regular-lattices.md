---
title: Random Regular lattices
author: cotes
date: 2019-08-08 11:33:00 +0800
categories: [Evolutionary Game Theory, lattices]
tags: [code, C, lattices]
pin: false
math: true
mermaid: true

---

[Download file](/codes/misc/random_lattices.c){:download}



Code for the evolution of a system under a random regular lattice (still in progress).






```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <time.h>
#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>
#include "pointers.h"
//#include "regular_lattices.h"
#include "mc.h"
#include <unistd.h> // alarm

long long int N;
int L;
long int L2;//= L*L; 
long int L3;// = L*L*L;
long long int L4;// = L*L*L*L; 
int G; // =4 (rede hexagonal) =5 (rede quadrada / kagome) =7 (rede triangular / quadrada 3D) =9 (rede moore / quadrada 4D)


unsigned long rseed;
const gsl_rng_type * T;
gsl_rng * rand_vec;

//#define DEBUG

void set_gsl_rng(void)
{
#ifdef DEBUG
	rseed=421;
#else
	rseed=time(NULL);                //printf("%d %d %d %d %d aa\n",x,p,vertice[x][p], connections_number[x], connections_number[p]);

#endif
  
	gsl_rng_env_setup();
	T    = gsl_rng_default;
	rand_vec = gsl_rng_alloc (T);
	gsl_rng_set (rand_vec, rseed);

  return;
}

/********************************************************************
***                      random lattice                           ***
********************************************************************/
void random_lattice (int **viz, int **viz_aux, int N)
{
    
	int x,y,z,i,j;
	
    int connections_number[N];
    //int viz_aux[N][N];

    for(x=0;x<N;++x)
    {    
        for(y=0;y<N;++y)
        {   
            viz_aux[x][y] = 0;     // everyone start without connections
            viz_aux[x][x] = 1;     // you are connected to yourself
        }
        connections_number[x] = 1; // count the self interaction
    }

    clock_t start2, end;
    start2 = clock();
    for(x=0;x<N;x++)
    {

        while(connections_number[x]<G)
        {
            int p = (int) N*gsl_rng_uniform(rand_vec);

            // see if x and p are already connected, and if they are connected to G-1 vertices already
            if(viz_aux[x][p]==0 && connections_number[x]<G && connections_number[p]<G)
            {
                //printf("%d %d %d %d %d aa\n",x,p,viz_aux[x][p], connections_number[x], connections_number[p]);


                viz_aux[x][p] = 1; 
                viz_aux[p][x] = 1;

                connections_number[x] += 1;  // count the appearance of x (has to appear G-1 times)
                connections_number[p] += 1;  

                //printf("%d %d %d %d %d aa\n",x,p,viz_aux[x][p], connections_number[x], connections_number[p]);
                //printf("\n");
            } 
    
            if(connections_number[x] == G){break;} 
            //printf("%d %d %d %d %d\n",x,p,viz_aux[x][p], connections_number[x], connections_number[p]);

        
            if( clock() > 5000000) // 5 times the usual time needed
            {
                alarm(5); /* raise alarm after 5 seconds */

                while(1) {
                printf("Running forever\n");
                }            
            }
        } 
    }    //printf("%ld\n",clock());
    
    //********************************************************************************

    for(x=0;x<N;x++)    //change viz_aux to viz[x][y]
    {
        int flag = 1;
        for(y=0;y<N;y++)
        {
            if(viz_aux[x][y]==1 && x!=y)
            {
                viz[x][flag] = y;
                //printf("%d %d %d %d\n",x,y, flag, viz[x][flag]);
                flag += 1; 
            }
            else if(viz_aux[x][y]==1 && x==y)
            {
                viz[x][0] = y;           
            }
        }
        //printf("\n");
    }

    for(x=0;x<N;x++)   //print debug
    {
        for(y=0;y<G;y++)
        {
            //printf("%d\n",viz[x][y]);
        }   //printf("\n");
    }

    //********************************************************************************
    // see if all graph is one (DFS)

    int start = (int) N*gsl_rng_uniform(rand_vec); //printf("%d %d\n", start, viz[start][1]);
    int vertices_visited[N], edges_visited[N][G];
    int count2 = 0;
    int start_aux,w;
    int to_visit = N;

    for(x=0;x<N;x++)
    {
        vertices_visited[x] = 0;
    }
    for(x=0;x<N;x++)
    {
        for(y=0;y<G;y++)
        {
            edges_visited[x][y] = 0;
        }
    }    

    while(count2<N)
    {

        vertices_visited[start] = 1;
        count2 += 1;  

        for(y=1;y<G;y++)
        {

            if(edges_visited[start][y]==0)
            {
                w = viz[start][y];
                if(vertices_visited[w]==0)
                {
                    edges_visited[start][y] = 1;
                }                
            }

        }
        start = w;
        //printf("%d\n", count2);
    }        
    if( count2!=N){printf("deu ruim\n");}



    //********************************************************************************
    // count the appearence of each player
    int count[N];
    double count_mean;
    for(x=0;x<N;x++)
    {
        count[x] = 0;
    }
    for(x=0;x<N;x++)   
    {
        for(y=0;y<G;y++)
        {
            count[viz[x][y]]+=1;
        }   
    }
    for(x=0;x<N;x++)
    {
        count_mean += count[x];
    }
    //printf("%lf %d %d\n", (double)count_mean/N, (int)count_mean/N, G);
    if( (int)(count_mean/N)!=G){printf("deu ruim\n");}
    

}

/********************************************************************
***                          C.I.                                 ***
********************************************************************/	//gcc dilema.c -lm -lgsl -lgslcblas ---- ./a.out r gama delta rede L ruido
#define dens_aleat
#define dens_inic_c  0.5
#define dens_inic_p  0.
#define dens_inic_pc 0.
#define dens_inic_dc 0.

//#define dens_quad
//#define dens_quad2
//#define dens_listras

/********************************************************************
***                          Plot                                 ***
********************************************************************/
//#define snapshot_gnuplot  
//#define snapshot_arquivo   
//#define snapshot_gif
//#define snapshot_hexa
//#define snapshot_kagome
#define fps 0000.01000000005 // fps^-1
#define densidade_arquivo
//#define densidade_terminal	


/********************************************************************
***                          Jogo                                 ***
********************************************************************/
//#define PRISONERS_DILEMMA
#define PGG_FOCAL
//#define PGG


//------------------------------------------------------------------------------------

enum tipo_rede {UNIDIMENSIONAL,QUADRADA, CUBICA, QUADRIDIMENSIONAL, HEXAGONAL, KAGOME,
					TRIANGULAR, MOORE};
enum tipo_rede REDE_ATUAL;
enum tipo_estrategia {DEFECTOR, COOPERATOR, PUNISHER};


double RUIDO;
double INV_RUIDO;
#define prob_mobil 0.
#define EPSILON (1e-8)
const int tmax=99999;//5000;
double measure_time = 1;


int ND=0;
int NC=0;
int NP=0;
int NPC=0;
int NDC=0;

int nd=0;
int nc=0;
int np=0;
int ndc=0;
int npc=0;

double investimento_total;
double payoff_total_C;
double payoff_total_D;
double payoff_total_resto;
//------------------------------------------------------------------------------------

/********************************************************************
***                  distribuição dos estados                     ***
********************************************************************/		
void calculo_ci_estado(int state[N], int **viz, double *investimento)
{
	int n;

	for(n=0; n < N; n++)
	{	

		#ifdef dens_aleat
		double temp = gsl_rng_uniform(rand_vec);
		
		if(temp < dens_inic_c ) state[n] = COOPERATOR;
		else 
		{
			if(temp < dens_inic_c + dens_inic_p) state[n] = PUNISHER;
			else 
			{
				if(temp < dens_inic_c + dens_inic_p + dens_inic_pc ) state[n] = 3;
				else
				{	
					if(temp < dens_inic_c + dens_inic_p + dens_inic_pc + dens_inic_dc) state[n] = 4;
					else state[n] = DEFECTOR;
				}
			}			
		}
		#endif
	
		#ifdef dens_quad
		int i,j;
		j=n%L;
		i=n/L;
		state[n] = DEFECTOR;

		if(j>1*L/5 && j<2*L/5 && i>1*L/5 && i<2*L/5){state[j+i*L] = COOPERATOR;investimento[j+i*L] = 0.55;}
		
		if(j>3*L/5 && j<4*L/5 && i>1*L/5 && i<2*L/5)
		{
			double temp = gsl_rng_uniform(rand_vec);
			if(temp < 0.5) {investimento[j+i*L] = 3.25;state[j+i*L] = COOPERATOR;}
			else{investimento[j+i*L] = 3.25;state[j+i*L] = COOPERATOR;}
		}
		if(j>1*L/5 && j<2*L/5 && i>3*L/5 && i<4*L/5)
		{
			double temp = gsl_rng_uniform(rand_vec);
			if(temp < 1./3) {state[j+i*L] = COOPERATOR;investimento[j+i*L] = 0.;}
			else if(temp < 2./3) {state[j+i*L] = COOPERATOR;investimento[j+i*L] = 2.45;}			
			else{state[j+i*L] = COOPERATOR;investimento[j+i*L] = 3.25;}
		}
		if(j>3*L/5 && j<4*L/5 && i>3*L/5 && i<4*L/5){state[j+i*L] = COOPERATOR;investimento[j+i*L] = 2.45;}
		#endif

		#ifdef dens_quad2
		int i,j;
		j=n%L;
		i=n/L;
		//if(j<L/2){state[j+i*L] = COOPERATOR; investimento[j+i*L] = 0.5;}
		//else{state[j+i*L] = COOPERATOR; investimento[j+i*L] = 2.0;}
		state[j+i*L] = DEFECTOR; investimento[j+i*L] = 0.0;
		//if(j==L/3 || j==2*L/3 || i==L/3 || i==2*L/3){state[j+i*L] = COOPERATOR;investimento[j+i*L] = 0.;}
		if(j>L/3 && j<2*L/3 && i>L/3 && i<2*L/3){state[j+i*L] = COOPERATOR;investimento[j+i*L] = 1.;}
		#endif

		#ifdef dens_listras
		int i,j;
		j=n%L;
		i=n/L;
		if(i<L/4)				{state[j+i*L] = 0;investimento[j+i*L] = 0;}
		if(i>=L/4 && i<2*L/4)	{state[j+i*L] = 1;investimento[j+i*L] = 0.4;}	
		if(i>=2*L/4 && i<3*L/4)	{state[j+i*L] = 1;investimento[j+i*L] = 0.7;}	
		if(i>=3*L/4)			{state[j+i*L] = 1;investimento[j+i*L] = 0.0;}
		#endif
		
	//state[n] = 0;investimento[n] = 0;
	}
	
	return;
	
}
/********************************************************************
***                  distribuição da topologia                    ***
********************************************************************/
void calculo_ci_topologia(int topologia[N])
{
	int i;
	for(i=0;i<N;i++)
	{

		topologia[i] = G;
		
		//topologia aleatoria
		/*double temp = gsl_rng_uniform(rand_vec);
		if( temp < 1/3. ) topologia[n] = QUADRADA; //ou KAGOME
		else
		{
			if( temp < 2/3.) topologia[n] = TRIANGULAR; // ou CUBICA
			else 
				topologia[n] = MOORE;
		}*/
		
		//printf("%d\n",topologia[i]);
	}
}

//#define M_PI
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
		
		/*int jj,j;
		j=i%L;
		jj=i/L;
		if(jj<L/3){investimento[j+jj*L] = 1;}
		if(jj>=L/3 && jj<2*L/3){investimento[j+jj*L] = k;}	
		if(jj>=2*L/3){investimento[j+jj*L] = 0;}*/
		
		//printf(" %d %d %lf\n",i,state[i],investimento[i]);
	}
}
/********************************************************************
***           		          pool do grupo                       ***
********************************************************************/
void calculo_pool( int state[N], int sitio2, int sitio, int vizinho, int **viz, int topologia[N], double *investimento)
{

	int i;
	investimento_total = 0.;

	for(i=0;i<topologia[sitio2];i++)
	{
		investimento_total += investimento[viz[sitio2][i]];
	}


	return;
}
/********************************************************************
***                  numero de cada estrategia                    ***
********************************************************************/
void calculo_numero( int state[N], int sitio2, int sitio, int **viz, int topologia[N])
{
	int i=0;
	
	nd=0;
	nc=0;
	np=0;
	ndc=0;
	npc=0;


	for(i=0;i<topologia[sitio2];i++) // vizinho 0 e o proprio sitio
	{
		switch(state[viz[sitio2][i]])
		{
			case DEFECTOR:   ++nd; break;
			case COOPERATOR: ++nc; break;
			case PUNISHER:   ++np; break;
			case 3: ++npc; break;
			case 4: ++ndc; break;
			default: 
				fprintf(stderr,"ERRO calculo vizinhos\n");
				fflush(stderr);
		}
	}

	//printf("nc=%d nd=%d\n",state[sitio],aaa);
	return;
}

/********************************************************************
***                          Payoff                               ***
********************************************************************/

void calculo_payoff ( double *payoff, double r, double gama, double delta, int x, int y, int topologia[N], int state[N], double *investimento, int **viz )
{
	// x: sitio central do grupo que o jogo ocorre
	// y: sitio que esta jogando

	/*//puniçao c/ propina
	double q = gsl_rng_uniform(rand_vec);
	double p = gsl_rng_uniform(rand_vec);

	payoff[COOPERATOR] = (1./G)*r*c* (np+nc) - c; //C
	payoff[PUNISHER]   = (1./G)*r*c* (np+nc) - c + p*q*delta*nd - (1 - p*q)*gama*nd; //P
	payoff[DEFECTOR]   = (1./G)*r*c* (np+nc) - (1 - p*q)*gama*np - p*q*delta*np; //D*/


	/*//Ising
	payoff[COOPERATOR] = 2*1*(nc-nd + 0.0); 
	payoff[DEFECTOR]   = 2*(-1)*(nc-nd + 0.0); //W = exp(-payoff/T)*/
	
	//puniçao 
	#if defined(PGG) || defined(PGG_FOCAL)

	/*
	double pool = (r/topologia[x])*investimento_total;

	payoff[COOPERATOR] = pool - investimento[x];
	payoff[PUNISHER]   = pool - investimento[x]; // - gama*nd;
	payoff[DEFECTOR]   = pool - investimento[x]; // - delta*np;
	*/


	//corrupçao com propina
	double pool = (r/topologia[x])*(nc+np);

	payoff[COOPERATOR] = pool - investimento[x] - (r/topologia[x])*gama*np + delta*gama*np/nc;
	payoff[DEFECTOR]   = pool - investimento[x] - (r/topologia[x])*gama*np;
	
	if(nc==0)
	{
	payoff[PUNISHER]   = pool - investimento[x] - (r/topologia[x])*gama*np + (1)*gama;
	}
	else
	{
	payoff[PUNISHER]   = pool - investimento[x] - (r/topologia[x])*gama*np + (1-delta)*gama;
	}

	#endif
	
	
	#ifdef PRISONERS_DILEMMA
	double b=1.6;
	double g=0.1;	
	switch(state[x])
	{		

		case COOPERATOR:
			//payoff[COOPERATOR] = nc;   // <- com autointeracao   //RR*(nc - 1) + SS*nd; // sem autointeracao
			payoff[COOPERATOR] = 1*(nc-1+1); //- g*nd;
			break;
		case DEFECTOR: 
			//payoff[DEFECTOR]   = TT*nc;// <- com autointeracao  //TT*nc + PP*(nd-1);   // sem autointeracao
			payoff[DEFECTOR]   = b*nc ;
			break;
	}
	#endif
	
	/*//recompensa
	payoff[COOPERATOR] = (1./G)*r*c* (np+nc) - c + delta*np;
	payoff[PUNISHER]   = (1./G)*r*c* (np+nc) - c - gama*nc;
	payoff[DEFECTOR]   = (1./G)*r*c* (np+nc);*/



	return;
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
		calculo_pool(state,i,i,i,viz,topologia,investimento);
		calculo_payoff(payoff,r,gama,delta,i,i,topologia,state,investimento,viz);
	
		if(state[i]==1){payoff_total_C += payoff[state[i]];}
		if(state[i]==0){payoff_total_D += payoff[state[i]];}
		else{payoff_total_resto += payoff[state[i]];}
		//printf("%d %d %lf %lf %lf %lf\n", state[i], topologia[i], investimento_total, payoff[state[i]], payoff_total_C, payoff_total_D);
	}

}
/********************************************************************
***                         Update rule                           ***
********************************************************************/
void update_rule( int x, int vizinho, int state[N], double Px, double Py ,int topologia[N], double *investimento, int t)
{

	double Wxy = 1.0/(1.0 + exp(-(Py-Px)*INV_RUIDO));//Wxy = 1.0/(1.0 + exp(-(Py-Px)/RUIDO));
	//double Wxy = exp(-Px/r); //Ising

	double l = gsl_rng_uniform(rand_vec);

	//printf("Px=%lf Py=%lf delta=%lf W=%lf \n",Px,Py,Py-Px,Wxy);

	//troca de estado
	if(Wxy > l)
	//if(Py > Px)
	{   
   
		state[x] = state[vizinho];
		topologia[x] = topologia[vizinho];	
		investimento[x] = investimento[vizinho]; // tirar pra fixa investimento com local da rede
		//state[x] = fabs(state[x]-1); //Ising
	}
}


/********************************************************************
***                         MCS                              ***
********************************************************************/
void calculo_mcs(double *payoff, int state[N], int **viz, double r, double gama, double delta, int topologia[N], double *investimento, int t)
{

	int n;
	int x,y,sitio,vizinho;
	double Px, Py;
	int sitio2, vizinho2;	

	for(n=0; n<N; n++)
	{					
		Px = 0;
		Py = 0;

		x = (int) N*gsl_rng_uniform(rand_vec);
   		sitio=x;

		y = 1 + (int) (topologia[x]-1)*gsl_rng_uniform(rand_vec); 
		vizinho = viz[x][y];
			
		if (investimento[vizinho] != investimento[x] || state[vizinho] != state[x])
		{
		#if defined(PGG_FOCAL)


			sitio2 = sitio;
			vizinho2 = vizinho;			

			calculo_numero(state,sitio2,sitio,viz,topologia);
			calculo_pool(state,sitio2,sitio,vizinho,viz,topologia,investimento);
			calculo_payoff(payoff,r,gama,delta,sitio,sitio,topologia,state,investimento,viz);
			Px = payoff[state[sitio]];

			calculo_numero(state,vizinho2,vizinho,viz,topologia);
			calculo_pool(state,vizinho2,vizinho,sitio,viz,topologia,investimento);
			calculo_payoff(payoff,r,gama,delta,vizinho,vizinho,topologia,state,investimento,viz);
			Py = payoff[state[vizinho]];
			
		#endif	

		#ifdef PGG

			for(y=0;y<topologia[sitio];y++)
			{
				sitio2 = viz[sitio][y];
				calculo_numero(state,sitio2,sitio,viz,topologia);
				calculo_pool(state,sitio2,sitio,vizinho,viz,topologia,investimento);
				calculo_payoff(payoff,r,gama,delta,sitio,sitio2,topologia,state,investimento,viz);
				Px += payoff[state[sitio]];
				//printf("%d %d %d %d %lf \n", sitio, state[sitio],sitio2, state[sitio2],Px);
			}

			for(y=0;y<topologia[vizinho];y++)
			{			
				vizinho2 = viz[vizinho][y];
				calculo_numero(state,vizinho2,vizinho,viz,topologia);
				calculo_pool(state,vizinho2,vizinho,sitio,viz,topologia,investimento);
				calculo_payoff(payoff,r,gama,delta,vizinho,vizinho2,topologia,state,investimento,viz);
				Py += payoff[state[vizinho]];
				//printf("%d %d %d %d %lf \n", vizinho, state[vizinho],vizinho2, state[vizinho2],Py);

			}
			
		#endif
		
		#if defined(PRISONERS_DILEMMA)

			sitio2 = sitio;
			vizinho2 = vizinho;			

			calculo_numero(state,sitio2,sitio,viz,topologia);
			calculo_pool(state,sitio2,sitio,vizinho,viz,topologia,investimento);
			calculo_payoff(payoff,r,gama,delta,sitio,sitio,topologia,state,investimento,viz);
			Px = payoff[state[sitio]];

			calculo_numero(state,vizinho2,vizinho,viz,topologia);
			calculo_pool(state,vizinho2,vizinho,sitio,viz,topologia,investimento);
			calculo_payoff(payoff,r,gama,delta,vizinho,vizinho,topologia,state,investimento,viz);
			Py = payoff[state[vizinho]];

		#endif
		
		update_rule(x,vizinho,state,Px,Py,topologia,investimento,t);
		}
  	}
}

/********************************************************************
***                          Densidades                           ***
********************************************************************/
void calculo_densidades(int state[N], double *investimento, double *payoff, int **viz, int histograma[N], int topologia[N], double r, double gama, double delta, int t, FILE *fp)
{
	int k;
	long double mediaC=0.;
	long double mediaC2=0.;
	long double mediaD=0.;
	long double mediaD2=0.;

	ND=0;
	NC=0;
	NP=0;
	NPC=0;
	NDC=0;
	
	for(k=0;k<N;k++)
	{
		switch (state[k])
		{
			case COOPERATOR: ++NC; break;
			case PUNISHER:   ++NP; break;
			case DEFECTOR:   ++ND; break;
			case 3: ++NPC; break;
			case 4: ++NDC; break;
			default: 
				fprintf(stderr,"ERRO - tipo de estrategia\n");
				fflush(stderr);
		}	
		if(state[k] == 1)
		{
			mediaC += investimento[k];
			mediaC2 += investimento[k]*investimento[k];			
		}
		if(state[k] == 0)
		{
			mediaD += investimento[k];
			mediaD2 += investimento[k]*investimento[k];			
		}
	}	

 	double media_C = (double)mediaC/(NC);
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

	calculo_payoff_total(payoff,state,viz,r,gama,delta,topologia,investimento);
	double payoff_total = payoff_total_C + payoff_total_D + payoff_total_resto;

	#ifdef densidade_terminal
	printf("%d %lf %lf %lf %lf %lf %lf %lf\n", t, (double)NC/(N), (double)ND/(N), (double)NP/(N), media_C ,desvio_C, payoff_total_C, payoff_total_D);
	
	#endif

	#ifdef densidade_arquivo
	fprintf(fp,"%d %lf %lf %lf %lf %lf\n", t, (double)NC/(N), (double)ND/(N), (double)NP/(N), media_C ,desvio_C);	
	#endif

}

/********************************************************************
***                          Main                                 ***
********************************************************************/
int main(int argc, char *argv[])
{
	//gera arquivo
	char filename[200];
	char REDE_ATUAL_NAME[50];	
	FILE *fp;		
  	int t=0;	
	double payoff[5], gama, delta,  r;
    int **viz,**viz_aux;

	if (argc!=7)
	{
		printf("O programa precisa de 6 argumentos:\n1) r\n2) gama\n3) delta\n4) tipo de rede\n5) L\n6) RUIDO");
		exit(1);
	}
	r=atof(argv[1]);
	gama=atof(argv[2]);
	delta=atof(argv[3]);
	L=atoi(argv[3]);
	RUIDO=atof(argv[4]); 
    INV_RUIDO = 1.0/RUIDO;

    set_gsl_rng();
    
    N = 100*100;
    G=4;

    viz = create_2d_int_pointer_h(N,G);
    viz_aux = create_2d_int_pointer_h(N,N);

    sprintf(filename,"random_dados_r%f_g%d_d%f_seed%ld.txt",r,G,delta,rseed);

	int state[N],topologia[N], histograma[N], label[N];
	double investimento[N];

	fp=fopen(filename,"w"); //abre .dat


    random_lattice(viz,viz_aux,N);


//-------------------C.I.-------------------------------------------------------------
	
	calculo_ci_estado(state,viz,investimento);
	calculo_ci_topologia(topologia);
	calculo_ci_investimento(investimento,state,gama);

	calculo_densidades(state,investimento,payoff,viz,histograma,topologia,r,gama,delta,t,fp);

//------------------M.C.S.------------------------------------------------------------

	for(t=1; t < tmax; t++)
	{	

		#ifdef snapshot_gnuplot	
		snap_gnuplot(state, topologia,investimento,label,t);
		#endif 
		#ifdef snaphot_gif	
		snap_gif(state, topologia,t);
		#endif 
		#ifdef snapshot_hexa	
		snap_hexa(state, topologia,t);
		#endif 
		#ifdef snapshot_kagome
		snap_kagome(state, topologia,t);
		#endif 

		#ifdef snapshot_arquivo
		if(t==1 || t==40 || t==90 || t==120 || t==300){
			printf("set terminal postscript eps enhanced color\n");
			printf("set output 'snapshotC1_MCS%d.eps'\n",t);
			snap_gnuplot(state, topologia,investimento,label,t);
			printf("unset terminal\n");
			
			fprintf(fp, "set terminal postscript eps enhanced color\n");
			fprintf(fp, "set output 'snapshotC1_MCS%d.eps'\n",t);
			snap_arquivo(state, topologia,investimento,label,t,fp);
		}
		#endif 
//------------------------------------------------------------------------------------

		calculo_mcs(payoff,state,viz,r,gama,delta,topologia,investimento,t);
		/*if(t>70000)
		{
		calculo_percolacao(state,viz,label);	
		calculo_tamanho_cluster(state,viz,label,investimento,t);
		}*/
		//calculo_mobilidade(state,viz);
		
//------------------------------------------------------------------------------------

		calculo_densidades(state,investimento,payoff,viz,histograma,topologia,r,gama,delta,t,fp);

		measure_time = rint(1.03*t); //printf("%d %lf\n",t, measure_time);
			
   
  		if((NC/(N)==1) || (NP/(N)==1) || (NPC/(N)==1) || (ND/(N)==1) )
		{
			do
			{
				if ( t >= measure_time)
				{
					calculo_densidades(state,investimento,payoff,viz,histograma,topologia,r,gama,delta,t,fp);
					measure_time = rint(1.03*measure_time);
				}
				t=t+1;
			}
			while(t<tmax);
		 break;
		}
	
	}//MCS

fclose(fp);

return 0;

free_2d_int_pointer(viz,N,G);
free_2d_int_pointer(viz_aux,N,N);

} //main




















```
