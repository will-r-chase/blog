---
title: 'Friday Fails #2: Educated Guess'
author: Will
date: '2018-07-27'
slug: friday-fails-2-educated-guess
categories:
  - General
tags:
  - Friday Fails
  - Ramblings
  - Real Life Science
header:
  caption: ''
  image: ''
---

Recently, as part of my work characterizing plant cell walls, I needed to express a few proteins that would serve as molecular probes. I read a couple of papers and the boss man gave me the green light. The first step is to find the protein sequence and have the gene synthesized so that we can transform it into some E. coli and start expression tests. So to order the synthesized gene I went to the paper that described the protein, scoured the methods, and found that--as expected--they didn't give the sequence, they simply referred to a previous paper, which referred to a previous paper, and after going down the rabbit hole I finally found the original reference. To my surprise, they actually gave (semi) detailed information: a GenBank accession number for the gene, and the exact amino acid positions of that gene that they used to express the protein. Confidently, I went to GenBank, found the specified protein, and discovered that the positions they listed in the paper did not match up with the GenBank annotation for this protein (it was close, but several residues at termini didn't match and genes were slightly different lengths)... hmmm what do :thinking::thinking:? A-hah, I know, I'll check the crystal structure of the protein! Well just my luck that the crystal structure sequence didn't match with either the GenBank annotation or the positions they listed in the paper. Ok, well maybe the other two genes I need to synthesize will have clearer info. Nope! At this point I raised my fist to the air and yelled: "CURSE YOU AUTHORS THAT DON'T PROVIDE ALL RELEVANT DATA!!!!" Actually that's a lie, in reality I did something more like this:
<div style="width:100%;height:0;padding-bottom:100%;position:relative;"><iframe src="https://giphy.com/embed/l2QEaAl7cBvQJQ6go" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>

So what do now? Well the truth is that I compared sequences from all three sources, tried to minimize differences between them, and then just sent that off for synthesis. Does the sequence I sent off match any of the sources exactly? No. But with three sources of data that all disagree with each other, it's simply the best I could do, and the truth is it's just a guess. In reality, it's quite common that we guess on things like this when doing real science. I wish I could say that there were sophisticated methods and fancy whiteboard scribbling that could give us all the answers, but more often than not, figuring out new procedures involves a lot of "educated" guessing.

As a side note, if you happen to be someone who publishes on recombinantly expressed proteins, take this as a public service announcement: please please please provide the full sequence of your constructs as supplementary data. GenBank annotations change, accession numbers change, and it's a thousand times easier to reproduce your work if you just provide your data. Plus it will probably save some poor graduate student a lot of agony. 