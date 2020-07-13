This is a collection of scripts and experiments with chemlambda. 

See the page of all chemlambda projects https://chemlambda.github.io/index.html

![alt tag](tape_long_4653_2.gif)


The active branch is https://github.com/chorasimilarity/chemlambda-gui/tree/gh-pages/dynamic

## Chemlambda

Is an artificial chemistry based on a graph rewrite system and various (random or deterministic) algorithms for applications of rewrites. The graphs in chemlambda are called "molecules" and they are stored as .mol files. Each mol file is a list of nodes, one node/line. Each line is a list of: type of node, port variables. For details see

Graph rewrites, from emergent algebras to chemlambda. © Marius Buliga (2020), https://mbuliga.github.io/quinegraphs/history-of-chemlambda.html


or the older http://chorasimilarity.github.io/chemlambda-gui/dynamic/moves.html 

Chemlambda works at the level of graphs, or molecules, not at the level of decoration of those, be them lambda terms, types, etc. By design chemlambda stays at this graphical level, with the price that there is no global semantics. Any semantics is seen as a collection of rules of local decorations of nodes and arrows. No global semantics means that there is no rejection of graphs which do not admit a global decoration by following a set of local decoration rules. 

## Relations with other models of computation

Chemlambda is related to interaction nets, as explained in 

Alife properties of directed interaction combinators vs. chemlambda. © Marius Buliga (2020), https://mbuliga.github.io/quinegraphs/ic-vs-chem.html#icvschem


Chemlambda it is not especially related to lambda calculus. The backbone of chemlambda is made by the triple of FI, FO, FOE nodes and their rewrites. Those are not specific to a particular well known model of computation or theory, like lambda calculus. It happens that chemlambda also contains two nodes A (application) and L (lambda), a specific rewrite A-L (akin to BETA reductions) and distributive rewrites for A and L wrt the backbone nodes. Chemlambda can be easily modified to have nothing to do with lambda calculus. For example in the article http://chorasimilarity.github.io/chemlambda-gui/dynamic/turingchem.html we see  a chemlambda version which uses Turing Machines (busy beavers) instead of lambda calculus. Moreover, one can add at will new nodes and mix models of computation (for example TMs with multiple heads and lambda calculus) in the same machine. Several examples are provided which show that we can mix busy beavers and lambda calculus Church numbers. 

Chemlambda is not a tool for better understanding lambda calculus, as there is nothing special in the chemlambda formalism which restricts it to molecules coming from lambda terms. On the contrary, one of the interesting class of graphs in chemlambda are "quines", molecules which have a periodic evolution under deterministic reduction algorithms. These chemlambda quines are good proposals for living organisms when reduced randomly. There is nothing similar in interaction nets. 


Another class of relations concerns chemistry like models of computation. The Alchemy of Fontana and Buss comes to mind, as well as the work of Christoph Flamm. The Alchemy proposes that a chemical reaction is of the type

 A + B - - > AB
 
 where A, B are lambda terms and AB is A applied to B. 
 
 Flamm's models are very close to real chemistry. The chemical reactions are of the type 
 
 A + B - - > C + D
 
 which can be understood as a rewrite of the unconnected pattern obtained from the union of A and B. I
 
 n chemlambda the rewrites model a chemical reaction 
 
 A + Enzyme - - > B  + Enzyme

where A is the pattern before a rewrite, B is the pattern after a rewrite and Enzyme is associated to the rewrite. In th eoriginal chemlambda Enzymes are invisible, appearing only as probabilities associated to the rewrites. 



## Applications, long term

There are three possible applications of chemlambda: 
- in real chemistry, for building molecular computers, or for understanding living organisms as molecular computers, see http://chorasimilarity.github.io/chemlambda-gui/dynamic/molecular.html or https://arxiv.org/abs/1811.04960
- in decentralized computing, because chemlambda with the random reduction algorithm is an asynchronous graph rewrite automaton. 
- both worlds united: see http://chorasimilarity.github.io/chemlambda-gui/dynamic/vision.html for a sketch of the idea to build chemlambda based chemical computers which work both in the virtual and meat spaces. For achieving this goal we need to solve the previous two applications and to use, perhaps, an (open version of) Digital Biological Converter, of the kind Craig Venter has already. Bringing the digital biological converters to the molecular size (i.e. as artificial rybosomes) would open both wonderful and worrying applications, as evoked in https://chorasimilarity.wordpress.com/2017/03/23/pharma-meets-the-internet-of-things/ and https://chorasimilarity.wordpress.com/2015/10/30/after-the-iot-comes-gaia/ and https://chorasimilarity.wordpress.com/2015/06/12/the-internet-can-be-your-pet/


## Related work


- quinegraphs https://github.com/mbuliga/quinegraphs  which contain the work on quine graphs, directed interaction combinators, a parser from lambda calculus to chemlambda
- chemlambda-editor https://github.com/ishanpm/chemlambda-editor is a pure javascript version which I later modified and adapted for the actual use in the chemlambda page and in the quinegraphs repository
- chemlambda-hask https://github.com/synergistics/chemlambda-hask is a Haskell API for graph rewrite systems with animplementation of chemlambda. It has the potential to be a clear and creative product, good for  a stem of a future chemlambda library, for general purpose use.
- chemlambda-py https://github.com/4lhc/chemlambda-py is a Python implementation of chemlambda (has a problem concerning the identification of the correct pattern for the A-L rewrite). Maybe a Python afficionado could make it useful, by comparing it with the Haskell version. 
- chemlambda-yuva https://github.com/YuvaAthur/chemlambda-yuva is a Python implementation of chemlambda adapted from chemlambda-py. It has the same incorrect pattern for the A-L rewrite, namely it applies the rewrite both for the correct (L a b c, A c d e) pattern and the incorrect (L a b c, A d c e) pattern (as they appear written in the mol file convention).
- LPU https://github.com/MaiaVictor/LPU which is biased towards  interaction networks style, but very interesting to develop more. It introduces the idea to convert the asynchronous graph rewrite system into an asynchronous rewrite system, by using the mol-file like list of nodes for the graph, together with supplementary rewrites (using an automaton of choice) for shuffling this list. The graph rewrites are executed only when the nodes of the pattern are close enough in the list. 



## Fun short term projects

Things I long for: 
- a pure javascript version of chemlambda, make a game based on it? UPDATE: done now, see https://chemlambda.github.io/index.html
- produce a movie (or again a game-like demo) of a living cell, based on chemlambda, see the trailer I made https://vimeo.com/138476341 

## Fun links

See more at
- chemlambda index: http://chorasimilarity.github.io/chemlambda-gui/index.html
- the demos page http://chorasimilarity.github.io/chemlambda-gui/dynamic/demos.html
- the moves and explanations, references http://chorasimilarity.github.io/chemlambda-gui/dynamic/moves.html
- the vision page http://chorasimilarity.github.io/chemlambda-gui/dynamic/vision.html
- the chemlambda collection of more than 250 animated gifs obtained from simulations, now salvaged from G+  https://chemlambda.github.io/collection.html

## How to use what's in there

Follow the steps: 
- download the gh-pages branch of the repo from this link https://github.com/chorasimilarity/chemlambda-gui/archive/gh-pages.zip
- open a terminal window, change directory to the folder "dynamic"
- type "bash quiner_shuffle.sh" for the random rewrites algorithm. Type "bash moving_random_metabo.sh" for deterministic rewrites algorithm. Type "bash quiner_node.sh" for the random colored rewrites algorithm. There are several pairs of scripts, like quiner_shuffle.sh and quiner_shuffle.awk. The parameters (number of cycles, weights of moves, visualisation parameters, see comments in the .awk script) are set by editing the awk script called by the sh script. 
- you shall see the list of all .mol files from the "mol" folder. Each mol file represents a chemlambda molecule. If you want to reproduce a demo, then choose the file.mol which corresponds to the file.html name of the demo page http://chorasimilarity.github.io/chemlambda-gui/dynamic/demos.html 
- a file.html is produced, which you can see with a browser. It is a d3.js animation of the history of the computation. (I use safari for best results, then chrome, then firefox. All the animations from the chemlambda collection have been done by screencasting the file.html result. Sometimes I edit the file.html and play a little with charge, gravity, linkstrength, or with the speed parameter which multiplies the step from the function nextval() definition.)


See also my channel for short videos about chemlambda https://www.youtube.com/channel/UCO2CcqUKORdyXd_CdgEdvVQ/videos
