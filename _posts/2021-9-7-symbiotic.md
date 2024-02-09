---
title: Symbiotic behavior in the Public Goods Game with altruistic punishment
author: LS Flores
journal: "Journal of Theoretical Biology 524, 110737"
date: 2021-09-07 11:33:00 +0800
categories: []
tags: [publication]
pin: true
math: true
mermaid: true

---

[PDF](/papers/symbiotic/1-s2.0-S0022519321001594-main.pdf){:target="_blank"}
<style>
  .content {
    text-align: justify;
    text-justify: inter-word; /* You can also use 'inter-character' for a different effect */
  }
</style>



## Abstract

Finding ways to overcome the temptation to exploit one another is still {a challenge in behavioural sciences}. In the framework of {evolutionary game theory}, punishing strategies are frequently used to promote cooperation in competitive environments. 
%
{Here, we introduce altruistic punishers in the spatial public goods game. This strategy acts as a cooperator in the absence of defectors, otherwise it will punish all defectors in their vicinity while bearing a cost to do so.}
%
We observe three distinct behaviours in our model: i) in the absence of punishers, cooperators {(who don't punish defectors)} are driven to extinction by defectors for most parameter values; ii) clusters of punishers thrive by sharing the punishment costs when these are low iii) for higher punishment costs, punishers, when alone, are subject to exploitation but in the presence of cooperators can form a symbiotic spatial structure that benefits both. 
This last observation is our main finding since neither cooperation nor punishment alone can survive the defector strategy in this parameter region and the specificity of the symbiotic spatial configuration shows that lattice topology plays a central role in sustaining cooperation. Results were obtained by means of  Monte Carlo simulations on a square lattice and subsequently confirmed by a {pairwise comparison of different strategies' payoffs in diverse group compositions,} leading to a phase diagram of the possible states.



## Introduction

One of the most intriguing questions in evolutionary game theory is the emergence and maintenance of cooperation in an environment with limited resources and selfish individuals~\cite{Smith82, Nowak2006, Perc2017}. However, cooperation, in its broadest definition, is a phenomenon both frequent and extremely difficult to explain in terms of a mathematical model~\cite{Pennisi2005}.
%
Classical game theory predicts that unconditional betrayal should be the most rational choice in conflict situations~\cite{Szabo2007, nowak_n05}. Nevertheless, cooperation is commonplace not only among individuals of the same family, flock, or species but also in inter-species interactions ~\cite{Nowak2006, wilson_71,  Nowak2011a}, as in symbiosis or obligate mutualism. This phenomenon is very common in nature, such as in bacteria ~\cite{hosokawa2016obligate, yurtsev2016oscillatory}, animal gut microbiome ~\cite{Lewin-Epstein2020} and even regarding cells and mitochondria ~\cite{Henze2003}.  A memorable example of this situation happens with the acacia tree and ants of the species {\it Pseudomyrmex ferruginea}: the former depends upon the ants for the protection of its fruits against herbivores,  whereas the latter benefit by acquiring food and shelter~\cite{janzen1966coevolution}.
%

In the context of evolutionary game theory, a usual way to model the interaction among players is via the public goods game (PGG), in which groups are formed by agents that have two possible strategies, to cooperate or to defect ~\cite{Wardil2017}. Cooperators bear an individual cost to invest in a collective pool while defectors do not. The sum of all investments is subsequently multiplied by a positive factor that represents the synergistic factor of mutual investment. Then the total amount is equally divided among all players in the group, independent of their strategy. 
%
This dynamic leads to a clear temptation to defect, since one can gain at the expense of the rest of the group without bearing an individual loss. The most rational choice for an exploited cooperator would be to defect, avoiding to sustain players who do not contribute. Nevertheless, as all agents end up defecting, this results in a worse outcome than if all cooperated, a scenario called the Tragedy of the Commons~\cite{Szabo2007}.
%

Among many different applications, a current use of the PGG is the modeling of climate changes (collective risk dilemma) ~\cite{Yang2020, Curry2020, Gois2019, Vicens2018, Couto2020}, where it is possible to understand the consequences of the maintenance of cooperation and observe strategies to avoid catastrophic scenarios. 
%
Although humans are a highly cooperative species, historically we see that the exploration of natural resources, other species, and even of our own species generates deep impacts on the planet, due to the temptation of individuals and countries to increase their gain.
%
Several mechanisms were proposed with the aim of {explaining} cooperation in competitive systems, such as group selection~\cite{wilson_ds_an77}, spatial reciprocity~\cite{Nowak1992a, wardil_epl09, wardil_pre10, Zhao2020}, reputation~\cite{dos-santos_m_prsb11, brandt2003punishment}, direct and indirect reciprocity  ~\cite{nowak2006five, trivers_qrb71, axelrod_s81}, willingness ~\cite{brandt2006punishing, hauert2005game}, mobility ~\cite{vainstein2007does}, heterogeneity  ~\cite{perc_bs10, Amaral2016, Amaral2015, Amaral2020a, Amaral2020, Fang2019, Zhou2018}, among others such as the introduction of tolerance, multiple strategies and behavioural diversity~\cite{Wardil2017, Szolnoki2016a, Xu2017, Stewart2016, Hamilton1964, Junior2019}. 
 
When considering human interactions, a classic mechanism to promote cooperation is the punishment of defectors~\cite{Couto2020, yang2018promoting,boyd2003evolution, chen2014probabilistic, perc2015double, szolnoki2011phase, helbing2010evolutionary, rand2010anti, Fang2019a}. Such an approach consists of individuals who prefer
to withstand a small loss in order to harm defectors.
%
Based on these considerations, here we analyse the effect of altruistic punishers in the lattice PGG which besides contributing to the public pool like a normal cooperator also bear an extra individual cost in order to punish {each} nearby defector.

%
This strategy was proposed in previous works, showing the effects of heterogeneous punishment~\cite{perc2015double} and the counter-intuitive clustering of punishers with a protective layer of defectors~\cite{Szolnoki2017a}. It was also shown that,  independent of the cost, high punishment fines always favour punishers, who fight defectors more efficiently via segregation~\cite{Helbing_2010}. Nevertheless, cooperators are usually seen as second-order free riders in the parameter regions of the previous works. This generally leads to defectors being extinct by punishers allowing cooperators to dominate the system.

Here we explore parameter regions that allow punishers to take advantage of cooperators when the former cannot survive alone. This situation is the inverse of the second-order free-rider problem where {only} cooperators take advantage of punishers.
Specifically,  we focus on values that allow spatial structures of cooperators and punishers to resist defectors and grow in a symbiotic fashion.
%
We see that while well-mixed populations are unable to sustain such an arrangement, the topology of lattices allows specific formations that benefit both altruistic strategies in a scenario where none would survive alone. 


## Model


We study a variation of the public goods game, in which three strategies are present: cooperators ($ C $), defectors ($ D $), and punishers ($ P $).
%
Players are located at the vertices of a square lattice of dimensions $ L \times L $, with periodic boundary conditions and interact with their first four neighbours (von Neumann neighbourhood). Initially, the strategies are randomly distributed with half of the players being $ D $, and the remaining half equally divided between $ C $ and $ P $, unless explicitly stated otherwise.
%
The interaction between players is such that cooperators and punishers contribute equally to a common pool with one unit (cost, $ c = 1 $), whereas defectors do not. The accumulated total in the group is then multiplied by a synergy factor ($ r>1 $) and divided equally among all players in the group, irrespective of their strategy.
%
When the player is a defector, a fine ($ \delta $) is discounted from its final payoff for each punisher present in its group. On the other hand, in addition to their investment, punishers also have to pay a fee ($ \gamma $) for each defector present in the group{, resulting in a decrease in payoff proportional to the number of defector neighbours.} We will use $ \gamma = \delta $ for simplicity.
%
Therefore, the payoff for a given agent is given by:

\begin{align}\label{eq.pay}
\pi_C &= (r c/G)\,(N_{P}+N_{C}) - c \\
\pi_P &= (r c/G)\,(N_{P}+N_{C}) - c - \gamma\,N_{D} \\ 
\pi_D &= (r c/G)\,(N_{P}+N_{C}) - \gamma\,N_{P} ,
\end{align}

where $G$ is the group size, $N_C$ stands for the number of cooperative agents, $N_P$ for punishers and $N_D$ for defectors in the respective group, {including the central site}.

For each player's payoff, we only take into account the group in which the player is the central site. That is, differently from the typical PGG game, we consider that each player only receives gains from one group. The results are qualitatively the same if we consider that each agent belongs to five groups (data not shown), corroborating the findings of~\cite{szolnoki_pre09c,szolnoki_pre11c,hauert2003prisoner}.

The dynamics of the system evolves by means of a Monte Carlo simulation: first, a random site $ X $ is chosen along with a random neighbour $ Y $, and then both payoffs are determined and compared via an imitation rule. The agent in site $ X $  will adopt agent $ Y $'s strategy with a probability given by the Fermi function

  \begin{equation}
  \label{eq.transition}
     W_{X\rightarrow Y}= \frac{1}{1+\exp[-(\pi_Y-\pi_X)/K]} \,\,,   
 \end{equation}
where $ K $ is a noise associated with irrationality during interactions ~\cite{Szabo2007,szolnoki_pre09c}. 
%
A Monte Carlo step (MCS) is characterized by the above procedure repeated $L^2$ times, allowing all players to interact in a time step on average. In the simulations we used $K=0.1$, $G=5$, $ L = 100 $ and $ t_ {max} = 10 ^ 6 $ MCS. The simulation was stopped before $t_{max}$ if $D$'s became extinct, since we are interested in the proportion of altruistic strategies. We used averages over $100$ independent samples to generate  the results, unless  otherwise stated. 

## Results



![aaa](/papers/symbiotic/figs/fig1_hmf_cores.pdf){: width="700" height="400" }
_Image Caption_


$$ x = 3 $$