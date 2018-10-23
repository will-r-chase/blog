---
title: 'How to Phylogeny (Part 2: Maximum Likelihood Tree Building)'
author: Will
date: '2018-10-22'
slug: how-to-phylogeny-part-2-ML-tree-building
categories:
  - Bioinformatics
tags:
  - Molecular Evolution
  - Phylogeny
header:
  caption: ''
  image: ''
---

*Disclamer: I'm a trained microbiologist/biochemist, which means most of my bioinformatics knowledge was self-taught. What you're about to see may not be pretty; the code might be janky or the workflow inefficient. But I have gone through countless hours of googleing, reading, and trial/error to learn this, and it works pretty well for me, so it might for you too. Let me know if you spot errors or have suggestions for improvement!*

# Intro/Installation
Yes, hello, you've arrived. Finally, we're ready to build a phylogenetic tree. By this point you should have a nice clean multiple sequence alignment (if not, read my previous posts in this series). This post is an introduction to building a maximum likelihood (ML) phylogeny using the IQ-TREE software. There are many choices for building a ML tree, so why use IQ-TREE? 

1. It's fast 
2. It's accurate 
3. It has great documentation 
4. It integrates many extra tools, models, and options

Overall I'm just incredibly impressed with the quality of the software, with the algorithms, thought that went into the tools, and the incredible user-experience, IQ-TREE is just :100: 

To install the program, simply download the <a href="http://www.iqtree.org/#download" target="_blank">mac or windows binaries</a>, unzip them in a location of your choice, and you're ready to go.

# Model selection
The first step in building a phylogeny is to select your model of evolution. If you're totally unfamiliar with how to model the evolution of a protein, I recommend you read <a href="https://www.frontiersin.org/articles/10.3389/fgene.2015.00319/full" target="_blank">this freely available review on the topic</a>. IQ-TREE has excellent documentation on the models you have to choose from, but a quick glance will reveal that there are a dizzying number, so how do you know which one is right? Well, you may have some intuition based on your protein sequences, but more often than not you will need to test which model best fits your data. IQ-TREE has developed a program that can do this called ModelFinder. There are generally two main parts to an evolutionary model: the substitution matrix, and the parameters for rate heterogeneity across sites (RHAS). The substitution matrix defines for each amino acid, the probability that it will mutate into each other amino acid (that's 20 probabilities per amino acid, stored as a 20x20 matrix). Substitution matricies are great, but we also have to consider that not every site in a protein evolves at the same rate: some will be highly conserved (ie. active site residues), and some will be more variable. To account for this, we incorporate a parameter that estimates which sites evolve at which rates, this is the RHAS parameter. This is usually done by defining a number of rate categories and binning your data into these categories, then the values for the rate of each category are drawn from a distribution. One of the biggest benefits of IQ-TREE and ModelFinder is that they can implement the FreeRates model of RHAS. This is an improvement of the very popular gamma distributed rates model which relaxes the assumption of strictly gamma distributed rates and can also automatically choose the best number of rate categories for your data (impossible for the gamma model). The issue is that if you have a large dataset, it can take a long time to test many substitution models with the FreeRates model, as each model might test up to 10 different rate categories per substitution model. To get around this, we can break up our model-finding by first testing for the best substitution model without considering the FreeRates model, then testing only the best-fitting substitution model with the FreeRates RHAS model. 

We can invoke IQ-TREE using the terminal (mac) or command prompt (windows). First, find the folder where you downloaded IQ-TREE, and make sure that you put your sequence alignment in the "bin" folder. Then open your terminal or command prompt and navigate to the "bin" folder in the IQ-TREE directory. To first test for the correct model of substitution, type 

`iqtree -s "my_alignment.txt" -m TESTONLY`

This will output a .iqtree file that will contain the results of your model. Open this file with a text editor (notepad++) and inspect your results. You will see that the models are scored using the bayesian information criterion (BIC) and Akaike information criterion (AIC). These metrics try to balance the accuracy of the model with the number of parameters to avoid overfitting. Hopefully these metrics will agree, but if they don't, I recommend choosing the model with the best AIC. After selecting the best substitution model, you can identify the best RHAS parameter by typing

`iqtree -s "my_alignment.txt" -m TESTNEWONLY -mset MY_MODEL`

Where MY_MODEL is the best substitution model (ie. WAG, LG, JTT, etc.). This will output another .iqtree file where you can now see which RHAS parameter best fits your data. 

# Tree building
Now that we know which model of evolution to use, we can actually construct the tree! For a typical dataset, this is easy, just type

`iqtree -s "my_alignment" -m MY_MODEL -alrt 1000 -bb 1000 -wbtl` 

Here, MY_MODEL should be the combination of your best-fitting substition matrix and RHAS parameter. So if you got WAG for your best substitution model and R6, your model is "WAG+R6". The -alrt flag tells IQ-TREE to perform a Shimodaira-Hasegawa-like alternative likelihood ratio test on each node to calculate the statistical support (with 1000 pseudoreplicates), and the -bb flag tells IQ-TREE to use the Ultrafast Bootstrap to calculate node support (1000 pseudoreplicates). The -wbtl flag will save all of the trees from the bootstrap pseudoreplicates to a separate file in case you want to use them later. You can view some parameters in the .iqtree output file, and the final maximum likelihood tree will be in the .treefile. 

# Tips and more!
This guide barely scratched the surface of what you can do with IQ-TREE. Partitioned analysis, mixture models, heterotachy, different bootstraps, likelihood mapping, statistical tests on trees, the list goes on. A few tips that have been helpful in my own analyses:

- The interpretation of the Ultrafast Bootstrap is different than traditional parametric bootstrapping. In the Ultrafast Bootstrap, a node that reaches 95% is considered well supported (read more in the documentation)
- If you have a large number of short sequences, try using the options `-pers 0.2` and `-nstop 500` to improve accuracy
- It is recommended to run the same tree-building 10 times to ensure that independent runs converge on the same tree

My favorite thing about IQ-TREE is by far the <a href="http://www.iqtree.org/doc/" target="_blank">documentation</a>. I highly highly encourage anyone reading this who wants to learn more to just go over and browse the documentation section of the IQ-TREE website. They have a great basic and advanced tutorial that takes you through all the steps of model selection and tree building in detail much greater details than I could cover here and explains the rationale for all kinds of choices you could make in your analysis. The command reference, substitution models, and FAQ section are also great resources for learning more about practical phylogenetics. 

Well, that's it for ML inference. I hope you learned something, and stay tuned for bayesian!





