chemlambda-gui
==============

The official page of all chemlambda projects is https://chemlambda.github.io/index.html

The repository chemlambda-gui is kept because of the content, otherwise, for new experiments, go to the official page.

The active branch of this repository is https://github.com/chorasimilarity/chemlambda-gui/tree/gh-pages/dynamic



In this repository you find a collection of scripts and experiments with chemlambda. 

See more at
- chemlambda index: http://chorasimilarity.github.io/chemlambda-gui/index.html
- the demos page http://chorasimilarity.github.io/chemlambda-gui/dynamic/demos.html
- the moves and explanations, references http://chorasimilarity.github.io/chemlambda-gui/dynamic/moves.html
- the vision page http://chorasimilarity.github.io/chemlambda-gui/dynamic/vision.html

Short posts with animated gifs at the chemlambda collection salvaged from google+ https://chemlambda.github.io/collection.html

How to use what's in there:

1. download the gh-pages branch of the repo from this link https://github.com/chorasimilarity/chemlambda-gui/archive/gh-pages.zip
2. unzip it and go to the folder "dynamic"
3. there are pairs of scripts, like quiner.sh and quiner.awk. The parameters (number of cycles, weights of moves, visualisation parameters, see comments in the .awk script) are set by editing the script. 
4. use the command “bash quiner.sh” (same for all other pairs script.sh, script.awk)
5. you shall see the list of all .mol files from the “dynamic” folder. Each mol file represents a chemlambda molecule. If you want to reproduce a demo, then choose the file.mol which corresponds to the file.html name of the demo page http://chorasimilarity.github.io/chemlambda-gui/dynamic/demos.html In case you set the weights in the quiner.awk different than 0, then you'll get the result of the random algorithm. If all weights are set to 0 then you shall obtain the result of a deterministic algorithm, which is the same no matter what.

An explanation of the algorithm embedded in the main script is here

https://chorasimilarity.wordpress.com/2015/04/27/a-short-complete-description-of-chemlambda-as-a-universal-model-of-computation/

but in quiner.awk there are additioned new moves for a busy beaver Turing machine, see the explanations in the work in progress

http://chorasimilarity.github.io/chemlambda-gui/dynamic/turingchem.html

I use all the time my open notebook https://chorasimilarity.wordpress.com/ for more explanations and details. However, the open notebook contains as well older variants of chemlambda. In any case, the moves page is the one which holds the latest version.



See also my channel for short videos about chemlambda https://www.youtube.com/channel/UCO2CcqUKORdyXd_CdgEdvVQ/videos
