---
title: Symbiotic behavior in the Public Goods Game with altruistic punishment
authors: ["LS Flores", "MH Vainstein", "HCM Fernandes", "MA Amaral"]
journal: "Journal of Theoretical Biology 524, 110737"
date: 2021-09-07 11:33:00 +0800
categories: []
tags: [publication]
pin: true
math: true
mermaid: true
#[PDF](/papers/symbiotic/1-s2.0-S0022519321001594-main.pdf){:target="_blank"}

---


text <a href="/papers/symbiotic/1-s2.0-S0022519321001594-main.pdf" target="_blank">here</a> text

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


<div style="text-align: left;">

\[
\begin{align*}
\pi_C &= (r c/G)\,(N_{P}+N_{C}) - c \tag{1} \label{eq_PC} \\
\pi_P &= (r c/G)\,(N_{P}+N_{C}) - c - \gamma\,N_{D} \tag{2} \label{eq_PP} \\
\pi_D &= (r c/G)\,(N_{P}+N_{C}) - \gamma\,N_{P} \tag{3} \label{eq_PD}
\end{align*}
\]

</div>



where $G$ is the group size, $N_C$ stands for the number of cooperative agents, $N_P$ for punishers and $N_D$ for defectors in the respective group, {including the central site}.

For each player's payoff, we only take into account the group in which the player is the central site. That is, differently from the typical PGG game, we consider that each player only receives gains from one group. The results are qualitatively the same if we consider that each agent belongs to five groups (data not shown), corroborating the findings of~\cite{szolnoki_pre09c,szolnoki_pre11c,hauert2003prisoner}.

The dynamics of the system evolves by means of a Monte Carlo simulation: first, a random site $ X $ is chosen along with a random neighbour $ Y $, and then both payoffs are determined and compared via an imitation rule. The agent in site $ X $  will adopt agent $ Y $'s strategy with a probability given by the Fermi function

<div style="text-align: left;">
\[
W_{X\rightarrow Y}= \frac{1}{1+\exp[-(\pi_Y-\pi_X)/K]} \tag{4} \label{eq:transition}
\]
</div>

\ref{eq:transition}

where $ K $ is a noise associated with irrationality during interactions ~\cite{Szabo2007,szolnoki_pre09c}. 
%
A Monte Carlo step (MCS) is characterized by the above procedure repeated $L^2$ times, allowing all players to interact in a time step on average. In the simulations we used $K=0.1$, $G=5$, $ L = 100 $ and $ t_ {max} = 10 ^ 6 $ MCS. The simulation was stopped before $t_{max}$ if $D$'s became extinct, since we are interested in the proportion of altruistic strategies. We used averages over $100$ independent samples to generate  the results, unless  otherwise stated. 

## Results



![aaa](/papers/symbiotic/figs/fig1_hmf_cores.pdf){: width="700" height="400" }
_Image Caption_


$$ x = 3 $$





## References

\begin{thebibliography}{10}
\expandafter\ifx\csname url\endcsname\relax
  \def\url#1{\texttt{#1}}\fi
\expandafter\ifx\csname href\endcsname\relax
  \def\href#1#2{#2} \def\path#1{#1}\fi

\bibitem{Smith82}
J.~M. Smith,
  \href{https://books.google.com.br/books?id=Nag2IhmPS3gC{\&}printsec=frontcover{\&}dq=isbn:9780521288842{\&}hl=pt-BR{\&}sa=X{\&}ved=0ahUKEwjw6eHkvePRAhVEiZAKHYOfAcYQ6AEIHDAA{\#}v=onepage{\&}q{\&}f=false}{{Evolution
  and the Theory of Games}}, Cambridge Univ. Press Cambridge U.K., 1982.

\bibitem{Nowak2006}
M.~A. Nowak,
  \href{http://www.hup.harvard.edu/catalog.php?isbn=9780674023383}{{Evolutionary
  Dynamics Exploring the Equations of Life}}, Harvard Univ. Press, Cambridge,
  MA, 2006.

\bibitem{Perc2017}
M.~Perc, J.~J. Jordan, D.~G. Rand, Z.~Wang, S.~Boccaletti, A.~Szolnoki,
  \href{http://dx.doi.org/10.1016/j.physrep.2017.05.004
  http://linkinghub.elsevier.com/retrieve/pii/S0370157317301424}{{Statistical
  physics of human cooperation}}, Phys. Rep. 687 (2017) 1--51.
  \href {https://doi.org/10.1016/j.physrep.2017.05.004}
  {\path{doi:10.1016/j.physrep.2017.05.004}}.

\bibitem{Pennisi2005}
E.~Pennisi, \href{http://www.sciencemag.org/cgi/doi/10.1126/science.309.5731.93
  https://www.sciencemag.org/lookup/doi/10.1126/science.309.5731.93}{{How Did
  Cooperative Behavior Evolve?}}, Science 309~(5731) (2005) 93--93.
\newblock \href {https://doi.org/10.1126/science.309.5731.93}
  {\path{doi:10.1126/science.309.5731.93}}.

\bibitem{Szabo2007}
G.~Szab{\'{o}}, G.~F{\'{a}}th, {Evolutionary games on graphs}, Phys. Rep. 446
  (2007) 97--216.
\href
  {https://doi.org/10.1016/j.physrep.2007.04.004}
  {\path{doi:10.1016/j.physrep.2007.04.004}}.

\bibitem{nowak_n05}
M.~A. Nowak, K.~Sigmund, {Evolution of indirect reciprocity}, Nature 437 (2005)
  1291--1298.

\bibitem{wilson_71}
E.~O. Wilson, {The Insect Societies}, Harvard Univ. Press, Harvard, 1971.

\bibitem{Nowak2011a}
M.~A. Nowak, R.~Highfield, {SuperCooperators: Altruism, Evolution, and Why We
  Need Each Other to Succeed}, Simon and Schuster, New York, 2012.

\bibitem{hosokawa2016obligate}
T.~Hosokawa, Y.~Ishii, N.~Nikoh, M.~Fujie, N.~Satoh, T.~Fukatsu, Obligate
  bacterial mutualists evolving from environmental bacteria in natural insect
  populations, Nat. Microbiol. 1~(1) (2016) 15011.

\bibitem{yurtsev2016oscillatory}
E.~A. Yurtsev, A.~Conwill, J.~Gore, Oscillatory dynamics in a bacterial
  cross-protection mutualism, Proc. Natl. Acad. Sci. U.S.A. 113~(22) (2016) 6236--6241.

\bibitem{Lewin-Epstein2020}
O.~Lewin-Epstein, L.~Hadany,
  \href{https://royalsocietypublishing.org/doi/10.1098/rspb.2019.2754}{{Host–microbiome
  coevolution can promote cooperation in a rock–paper–scissors dynamics}},
  Proc. R. Soc. B Biol. Sci. 287~(1920) (2020) 20192754.
\newblock \href {https://doi.org/10.1098/rspb.2019.2754}
  {\path{doi:10.1098/rspb.2019.2754}}.

\bibitem{Henze2003}
K.~Henze, W.~Martin,
  \href{http://www.nature.com/nature/journal/v426/n6963/full/426127a.html}{{Evolutionary
  biology: Essence of mitochondria}}, Nature 426~(6963) (2003) 127--128.
\newblock \href {https://doi.org/10.1038/426127a} {\path{doi:10.1038/426127a}}.

\bibitem{janzen1966coevolution}
D.~H. Janzen, Coevolution of mutualism between ants and acacias in central
  america, Evolution 20~(3) (1966) 249--275.

\bibitem{Wardil2017}
L.~Wardil, M.~Amaral, \href{http://www.mdpi.com/2073-4336/8/3/35}{{Cooperation
  in Public Goods Games: Stay, But Not for Too Long}}, Games 8~(3) (2017) 35.
\newblock \href {https://doi.org/10.3390/g8030035}
  {\path{doi:10.3390/g8030035}}.

\bibitem{Yang2020}
X.~Yang, F.~Zhang, W.~Wang, D.~Zhang, Z.~Shi, S.~Zhou,
  \href{https://linkinghub.elsevier.com/retrieve/pii/S0375960120300694}{{Effect
  of habitat destruction on cooperation in public goods games}}, Phys. Lett. A
  (2020) 126276. \href {https://doi.org/10.1016/j.physleta.2020.126276}
  {\path{doi:10.1016/j.physleta.2020.126276}}.

\bibitem{Curry2020}
O.~S. Curry, D.~Hare, C.~Hepburn, D.~D.~P. Johnson, M.~D. Buhrmester,
  H.~Whitehouse, D.~W. Macdonald,
  \href{https://onlinelibrary.wiley.com/doi/abs/10.1111/csp2.123}{{Cooperative
  conservation: Seven ways to save the world}}, Conserv. Sci. Pract. 2~(1)
  (2020) 1--7.
\newblock \href {https://doi.org/10.1111/csp2.123}
  {\path{doi:10.1111/csp2.123}}.

\bibitem{Gois2019}
A.~R. G{\'{o}}is, F.~P. Santos, J.~M. Pacheco, F.~C. Santos,
  \href{http://www.nature.com/articles/s41598-019-52524-8}{{Reward and
  punishment in climate change dilemmas}}, Sci. Rep. 9~(1) (2019) 16193.
\newblock \href {https://doi.org/10.1038/s41598-019-52524-8}
  {\path{doi:10.1038/s41598-019-52524-8}}.

\bibitem{Vicens2018}
J.~Vicens, N.~Bueno-Guerra, M.~Guti{\'{e}}rrez-Roig, C.~Gracia-L{\'{a}}zaro,
  J.~G{\'{o}}mez-Garde{\~{n}}es, J.~Perell{\'{o}}, A.~S{\'{a}}nchez, Y.~Moreno,
  J.~Duch, \href{http://dx.plos.org/10.1371/journal.pone.0204369}{{Resource heterogeneity
  leads to unjust effort distribution in climate change mitigation}}, PLoS One
  13~(10) (2018) e0204369.
\href
  {https://doi.org/10.1371/journal.pone.0204369}
  {\path{doi:10.1371/journal.pone.0204369}}.

\bibitem{Couto2020}
M.~C. Couto, J.~M. Pacheco, F.~C. Santos,
  \href{https://doi.org/10.1016/j.jtbi.2020.110423
  https://linkinghub.elsevier.com/retrieve/pii/S0022519320302782}{{Governance
  of Risky Public Goods under Graduated Punishment}}, J. Theor. Biol. (2020)
  110423. \href {https://doi.org/10.1016/j.jtbi.2020.110423} 
  {\path{doi:10.1016/j.jtbi.2020.110423}}.

\bibitem{wilson_ds_an77}
D.~S. Wilson,
  \href{http://www.journals.uchicago.edu/doi/10.1086/283146}{{Structured Demes
  and the Evolution of Group-Advantageous Traits}}, Am. Nat. 111~(977) (1977)
  157--185.
\newblock \href {https://doi.org/10.1086/283146} {\path{doi:10.1086/283146}}.

\bibitem{Nowak1992a}
M.~A. Nowak, R.~M. May,
  \href{http://www.nature.com/doifinder/10.1038/359826a0}{{Evolutionary games
  and spatial chaos}}, Nature 359~(6398) (1992) 826--829.
\newblock \href {https://doi.org/10.1038/359826a0}
  {\path{doi:10.1038/359826a0}}.

\bibitem{wardil_epl09}
L.~Wardil, J.~{K. L. da Silva},
  \href{http://iopscience.iop.org/article/10.1209/0295-5075/86/38001/meta}{{Adoption
  of simultaneous different strategies against different opponents enhances
  cooperation}}, EPL 86~(3) (2009) 38001.
\newblock \href {https://doi.org/10.1209/0295-5075/86/38001}
  {\path{doi:10.1209/0295-5075/86/38001}}.

\bibitem{wardil_pre10}
L.~Wardil, J.~K.~L. da~Silva,
  \href{http://link.aps.org/doi/10.1103/PhysRevE.81.036115}{{Distinguishing the
  opponents promotes cooperation in well-mixed populations}}, Phys. Rev. E
  81~(3) (2010) 036115.
\newblock \href {https://doi.org/10.1103/PhysRevE.81.036115}
  {\path{doi:10.1103/PhysRevE.81.036115}}.

\bibitem{Zhao2020}
J.~Zhao, X.~Wang, C.~Gu, Y.~Qin,
  \href{https://doi.org/10.1007/s13235-020-00365-w
  http://link.springer.com/10.1007/s13235-020-00365-w}{{Structural
  Heterogeneity and Evolutionary Dynamics on Complex Networks}}, Dyn. Games
  Appl. (aug 2020).
\newblock \href {https://doi.org/10.1007/s13235-020-00365-w}
  {\path{doi:10.1007/s13235-020-00365-w}}.

\bibitem{dos-santos_m_prsb11}
M.~dos Santos, D.~J. Rankin, C.~Wedekind, {The evolution of punishment through
  reputation}, Proc. R. Soc. Lond. B [Biol] 278 (2011) 371--377.
\newblock \href {https://doi.org/10.1098/rspb.2010.1275}
  {\path{doi:10.1098/rspb.2010.1275}}.

\bibitem{brandt2003punishment}
H.~Brandt, C.~Hauert, K.~Sigmund, Punishment and reputation in spatial public
  goods games, Proc. R. Soc. Lond. B [Biol] 270~(1519) (2003) 1099--1104.

\bibitem{nowak2006five}
M.~A. Nowak, Five rules for the evolution of cooperation, Science 314~(5805) (2006) 1560--1563.

\bibitem{trivers_qrb71}
R.~L. Trivers, \href{http://www.journals.uchicago.edu/doi/10.1086/406755}{{The
  Evolution of Reciprocal Altruism}}, Q. Rev. Biol. 46~(1) (1971) 35--57.
\newblock \href {https://doi.org/10.1086/406755} {\path{doi:10.1086/406755}}.

\bibitem{axelrod_s81}
R.~Axelrod, W.~Hamilton,
  \href{http://science.sciencemag.org/content/211/4489/1390}{{The evolution of
  cooperation}}, Science 211~(4489) (1981) 1390--1396.
\newblock \href {https://doi.org/10.1126/science.7466396}
  {\path{doi:10.1126/science.7466396}}.

\bibitem{brandt2006punishing}
H.~Brandt, C.~Hauert, K.~Sigmund, Punishing and abstaining for public goods,  Proc. Natl. Acad. Sci. U.S.A. 103~(2) (2006) 495--497.

\bibitem{hauert2005game}
C.~Hauert, G.~Szab{\'o}, Game theory and physics, Am. J. Phys.
  73~(5) (2005) 405--414.

\bibitem{vainstein2007does}
M.~H. Vainstein, A.~T. Silva, J.~J. Arenzon, Does mobility decrease  cooperation?, J. Theor. Biol. 244~(4) (2007) 722--728.

\bibitem{perc_bs10}
M.~Perc, A.~Szolnoki,
  \href{http://www.sciencedirect.com/science/article/pii/S0303264709001646
  http://linkinghub.elsevier.com/retrieve/pii/S0303264709001646}{{Coevolutionary
  games—A mini review}}, Biosystems 99~(2) (2010) 109--125.
\newblock \href {https://doi.org/10.1016/j.biosystems.2009.10.003}
  {\path{doi:10.1016/j.biosystems.2009.10.003}}.

\bibitem{Amaral2016}
M.~A. Amaral, L.~Wardil, M.~Perc, J.~K.~L. da~Silva,
  \href{http://link.aps.org/doi/10.1103/PhysRevE.93.042304}{{Evolutionary mixed
  games in structured populations: Cooperation and the benefits of
  heterogeneity}}, Phys. Rev. E 93~(4) (2016) 042304.
\newblock \href {https://doi.org/10.1103/PhysRevE.93.042304}
  {\path{doi:10.1103/PhysRevE.93.042304}}.

\bibitem{Amaral2015}
M.~A. Amaral, L.~Wardil, J.~K.~L. da~Silva,
  \href{http://stacks.iop.org/1751-8121/48/i=44/a=445002?key=crossref.5d12abaa9d93d27016b1adbf9be62761}{{Cooperation
  in two-dimensional mixed-games}}, J. Phys. A Math. Theor. 48~(44) (2015)
  445002.
\newblock \href {https://doi.org/10.1088/1751-8113/48/44/445002}
  {\path{doi:10.1088/1751-8113/48/44/445002}}.

\bibitem{Amaral2020a}
M.~A. Amaral, M.~A. Javarone,
  \href{https://doi.org/10.1103/PhysRevE.101.062309}{{Strategy equilibrium in
  dilemma games with off-diagonal payoff perturbations Marco}}, Phys. Rev. E
  101~(62309) (2020) 1.
\newblock \href {https://doi.org/10.1103/PhysRevE.101.062309}
  {\path{doi:10.1103/PhysRevE.101.062309}}.

\bibitem{Amaral2020}
M.~A. Amaral, M.~A. Javarone, \href{  https://royalsocietypublishing.org/doi/10.1098/rspa.2020.0116}{{Heterogeneity
  in evolutionary games: an analysis of the risk perception}}, Proc. R. Soc. A
  Math. Phys. Eng. Sci. 476~(2237) (2020) 20200116.
  \href {https://doi.org/10.1098/rspa.2020.0116}
  {\path{doi:10.1098/rspa.2020.0116}}.


\bibitem{Fang2019}
Y.~Fang, T.~P. Benko, M.~Perc, H.~Xu,
  \href{http://www.nature.com/articles/s41598-019-44184-5}{{Dissimilarity-driven
  behavior and cooperation in the spatial public goods game}}, Sci. Rep. 9~(1)
  (2019) 7655.
\newblock \href {https://doi.org/10.1038/s41598-019-44184-5}
  {\path{doi:10.1038/s41598-019-44184-5}}.

\bibitem{Zhou2018}
L.~Zhou, B.~Wu, V.~V. Vasconcelos, L.~Wang,
  \href{https://link.aps.org/doi/10.1103/PhysRevE.98.062124}{{Simple property of
  heterogeneous aspiration dynamics: Beyond weak selection}}, Phys. Rev. E
  98~(6) (2018) 062124.
  \href {https://doi.org/10.1103/PhysRevE.98.062124}
  {\path{doi:10.1103/PhysRevE.98.062124}}.

\bibitem{Szolnoki2016a}
A.~Szolnoki, M.~Perc,
  \href{http://stacks.iop.org/1367-2630/18/i=8/a=083021?key=crossref.d7ebd1a06758011776825fb0e4e69687}{{Competition
  of tolerant strategies in the spatial public goods game}}, New J. Phys.
  18~(8) (2016) 083021.
\newblock \href {https://doi.org/10.1088/1367-2630/18/8/083021}
  {\path{doi:10.1088/1367-2630/18/8/083021}}.

\bibitem{Xu2017}
K.~Xu, K.~Li, R.~Cong, L.~Wang,
  \href{http://stacks.iop.org/0295-5075/117/i=4/a=48002?key=crossref.593fe52bc6e6bb80fa41ada34d75d8e2}{{Cooperation
  guided by the coexistence of imitation dynamics and aspiration dynamics in
  structured populations}}, EPL 117~(4) (2017) 48002.
\newblock \href {https://doi.org/10.1209/0295-5075/117/48002}
  {\path{doi:10.1209/0295-5075/117/48002}}.

\bibitem{Stewart2016}
A.~J. Stewart, T.~L. Parsons, J.~B. Plotkin,
  \href{http://www.pnas.org/lookup/doi/10.1073/pnas.1608990113}{{Evolutionary
  consequences of behavioral diversity}}, Proc. Natl. Acad. Sci. U.S.A. 113~(45)
  (2016) E7003--E7009.
  \href {https://doi.org/10.1073/pnas.1608990113}
  {\path{doi:10.1073/pnas.1608990113}}.

\bibitem{Hamilton1964}
W.~Hamilton,
  \href{http://linkinghub.elsevier.com/retrieve/pii/0022519364900396}{{The
  genetical evolution of social behaviour. II}}, J. Theor. Biol. 7~(1) (1964)
  17--52.
\newblock \href {https://doi.org/10.1016/0022-5193(64)90039-6}
  {\path{doi:10.1016/0022-5193(64)90039-6}}.

\bibitem{Junior2019}
E.~J. J{\'{u}}nior, M.~A. Amaral, L.~Wardil,
  \href{https://linkinghub.elsevier.com/retrieve/pii/S0378437119317960}{{Moderate
  death rates can be beneficial for the evolution of cooperation}}, Physica A
  540 (2020) 123195.
\newblock \href {https://doi.org/10.1016/j.physa.2019.123195}
  {\path{doi:10.1016/j.physa.2019.123195}}.

\bibitem{yang2018promoting}
H.-X. Yang, X.~Chen, Promoting cooperation by punishing minority, Appl. Math. Comput.  316 (2018) 460--466.

\bibitem{boyd2003evolution}
R.~Boyd, H.~Gintis, S.~Bowles, P.~J. Richerson, The evolution of altruistic
  punishment, Proc. Natl. Acad. Sci. U.S.A. 100~(6) (2003) 3531--3535.

\bibitem{chen2014probabilistic}
X.~Chen, A.~Szolnoki, M.~Perc, Probabilistic sharing solves the problem of
  costly punishment, New J. Phys. 16~(8) (2014) 083016.

\bibitem{perc2015double}
M.~Perc, A.~Szolnoki, A double-edged sword: Benefits and pitfalls of heterogeneous punishment in evolutionary inspection games, Sci. Rep. 5 (2015) 11027.

\bibitem{szolnoki2011phase}
A.~Szolnoki, G.~Szab{\'o}, M.~Perc, Phase diagrams for the spatial public goods  game with pool punishment, Phys. Rev. E 83~(3) (2011) 036101.

\bibitem{helbing2010evolutionary}
D.~Helbing, A.~Szolnoki, M.~Perc, G.~Szab{\'o}, Evolutionary establishment of
  moral and double moral standards through spatial interactions, PLOS Comput. Biol. 6~(4) (2010).

\bibitem{rand2010anti}
D.~G. Rand, J.~J. Armao~IV, M.~Nakamaru, H.~Ohtsuki, Anti-social punishment can
  prevent the co-evolution of punishment and cooperation, J. Theor. Biol. 265~(4) (2010) 624--632.

\bibitem{Fang2019a}
Y.~Fang, T.~P. Benko, M.~Perc, H.~Xu, Q.~Tan,
  \href{https://royalsocietypublishing.org/doi/10.1098/rspa.2019.0349}{{Synergistic
  third-party rewarding and punishment in the public goods game}}, Proc. R.
  Soc. A Math. Phys. Eng. Sci. 475~(2227) (2019) 20190349.
\newblock \href {https://doi.org/10.1098/rspa.2019.0349}
  {\path{doi:10.1098/rspa.2019.0349}}.

\bibitem{Szolnoki2017a}
A.~Szolnoki, M.~Perc,
  \href{https://link.aps.org/doi/10.1103/PhysRevX.7.041027}{{Second-Order
  Free-Riding on Antisocial Punishment Restores the Effectiveness of Prosocial
  Punishment}}, Phys. Rev. X 7~(4) (2017) 041027.
  \href {https://doi.org/10.1103/PhysRevX.7.041027}
  {\path{doi:10.1103/PhysRevX.7.041027}}.

\bibitem{Helbing_2010}
D.~Helbing, A.~Szolnoki, M.~Perc, G.~Szabó,
  \href{http://dx.doi.org/10.1088/1367-2630/12/8/083005}{Punish, but not too
  hard: how costly punishment spreads in the spatial public goods game}, New J. Phys. 12~(8) (2010) 083005.
\newblock \href {https://doi.org/10.1088/1367-2630/12/8/083005}
  {\path{doi:10.1088/1367-2630/12/8/083005}}.

\bibitem{szolnoki_pre09c}
A.~Szolnoki, M.~Perc, G.~Szab{\'{o}}, {Topology-independent impact of noise on
  cooperation in spatial public goods games}, Phys. Rev. E 80 (2009) 56109.
\newblock \href {https://doi.org/10.1103/PhysRevE.80.056109}
  {\path{doi:10.1103/PhysRevE.80.056109}}.

\bibitem{szolnoki_pre11c}
A.~Szolnoki, M.~Perc,
  \href{http://link.aps.org/doi/10.1103/PhysRevE.84.047102}{{Group-size effects
  on the evolution of cooperation in the spatial public goods game}}, Phys.
  Rev. E 84~(4) (2011) 047102.
\newblock \href {https://doi.org/10.1103/PhysRevE.84.047102}
  {\path{doi:10.1103/PhysRevE.84.047102}}.

\bibitem{hauert2003prisoner}
C.~Hauert, G.~Szabo, Prisoner's dilemma and public goods games in different
  geometries: compulsory versus voluntary interactions, Complexity 8~(4) (2003)
  31--38.

\bibitem{Vainstein2014b}
M.~H. Vainstein, J.~J. Arenzon, {Spatial social dilemmas: Dilution, mobility
  and grouping effects with imitation dynamics}, Physica A 394 (2014) 145--157.
  \href {https://doi.org/10.1016/j.physa.2013.09.032}
  {\path{doi:10.1016/j.physa.2013.09.032}}.

\bibitem{gif_fig4}
L.~S. Flores, \href{https://doi.org/10.6084/m9.figshare.13366577.v1}{Temporal
  lattice evolution using parameters: r=3.8 and gama=1.5} (2020).

\bibitem{gif_fig6}
L.~S. Flores, \href{https://doi.org/10.6084/m9.figshare.13366580.v1}{Temporal
  lattice evolution using parameters: r=3.8 and gama=1.5} (2020).

\bibitem{Cazaubiel2017}
A.~Cazaubiel, A.~F. L{\"{u}}tz, J.~J. Arenzon,
  \href{http://dx.doi.org/10.1016/j.jtbi.2017.07.002
  https://linkinghub.elsevier.com/retrieve/pii/S0022519317303272}{{Collective
  strategies and cyclic dominance in asymmetric predator-prey spatial games}},
  J. Theor. Biol. 430 (2017) 45--52.
\newblock \href {https://doi.org/10.1016/j.jtbi.2017.07.002}
  {\path{doi:10.1016/j.jtbi.2017.07.002}}.

\bibitem{nakamaru2006}
M.~Nakamaru, Y.~Iwasa,
  \href{https://www.sciencedirect.com/science/article/pii/S0022519305004509}{The
  coevolution of altruism and punishment: Role of the selfish punisher},
 J. Theor. Biol. ~(3) (2006) 475--488.
\newblock \href {https://doi.org/https://doi.org/10.1016/j.jtbi.2005.10.011}
  {\path{doi:https://doi.org/10.1016/j.jtbi.2005.10.011}}.

\end{thebibliography}