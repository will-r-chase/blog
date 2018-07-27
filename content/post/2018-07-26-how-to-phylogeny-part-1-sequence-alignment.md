---
title: 'How to Phylogeny (Part 1: Sequence Alignment)'
author: Will
date: '2018-07-26'
slug: how-to-phylogeny-part-1-sequence-alignment
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

{{% toc %}}

# Introduction
Hi, in this series of posts, I'll introduce a general workflow for estimating a phylogenetic tree for a single gene. When learning phylogenetics, I often got lost in the dizzying array of tools and methods available for sequence alignment and tree building. In these posts I'll talk about why I use the tools I currently do, and how they work. This walkthrough is meant for tricky phylogenies, where you may have a very large and divergent gene family for which it is hard to identify orthologues, align the sequences accurately, and infer an accurate phylogeny. Thus, a lot of these methods may be overkill if you have a more straightforward problem.

I'll assume you already have a set of related sequences in fasta format. If that's not the case, read my post on [getting and cleaning sequence data]({{< ref "post/2018-07-26-how-to-phylogeny-part-0-getting-and-cleaning-data.html" >}}). I'm using amino acid sequences here, but DNA sequences can be used as well, you'll just have to consider the differences that brings. 

For 90% of my work I use MAFFT to align sequences. I like MAFFT because it's flexible, it's fast, it's accurate, and the documentation is excellent. MAFFT also has a fast <a href="https://mafft.cbrc.jp/alignment/server/" target="_blank">webserver</a> which is convenient if you are performing just a few alignments. If you want to align many fasta files as part of a pipeline, MAFFT is available as a command line program. MAFFT offers several algorithms that are optimized to balance speed and performance. I recommend reading their <a href="https://mafft.cbrc.jp/alignment/software/algorithms/algorithms.html" target="_blank">algorithms documentation</a>. 

***
# Workflow
If you have many sequences (over 1000) you should use one of the fast-fourier-transform (FFT) methods at least initially, as they're much more efficient and can handle thousands of sequences. If you have less than 1000 sequences, I recommend the iterative algorithms with WSP and consistency score (E-ins-i, L-ins-i, and G-ins-i). The iterative algorithms are particularly useful for trimming and finalizing alignments. In my example, I have about 500 sequences, which may have some extraneous sequence (not the domains I'm interested in) tacked on the termini.

We need to align our sequences and trim off the excess. If you know that your sequences contain multiple conserved domains separated by long stretches of unalignable sequence, you should start with E-ins-i; if you know that you have one main stretch of homologous sequence which may have unalignable termini, start with L-ins-i. Upload your sequence file to the MAFFT server and submit, or use the command (`mafft --reorder --maxiterate 1000 --retree 1 --localpair input > output`) to execute the command line version. When finished, download your sequences by clicking the "fasta format" option at the top of the MAFFT output page, then copying the sequences (ctrl+A to select all, ctrl+C to copy). ![MAFFT result](/img/mafft_result.png)

Next, open BioEdit (see my previous post for [info on BioEdit]({{< relref "post/2018-07-26-how-to-phylogeny-part-0-getting-and-cleaning-data.html#bioedit" >}})), and go to `File > New from Clipboard`. Now you can use BioEdit to manually inspect and trim your alignment. Make sure to set the "Mode" in the top left corner of BioEdit to "Edit", and then use the markers at the top to select positions you want to delete and hit the delete button on your keyboard, it's that easy! ![BioEdit trim](/img/bioedit_trim.png)

After you've trimmed the termini of your alignment, you can remove the gaps to save it as a normal sequence file. Do this by selecting all sequences (ctrl+A), unlocking gaps (ctrl+shift+space), and removing gaps (ctrl+space). Then save your trimmed sequences to a new file (maintain the original untrimmed file for reference). You should now re-align your trimmed sequences using L-ins-i algorithm, copy the alignment and paste it to a text file, then save for future use. The re-alignment step is unnecessary if your original alignment was good quality and you did not have lots of extraneous sequence. Now your alignment is ready for phylogenetic reconstruction (stay tuned for part 3 of this series)! ...well, maybe

## A Rant About Alignment Trimming
The (optional) final step is removing any poorly aligned positions from your dataset. The idea is simple: any multiple sequence alignment will contain inaccuracies; by removing the inaccurately aligned positions, we can improve the alignment quality. Many tools exist to do this, the most popular is <a href="http://trimal.cgenomics.org/" target="_blank">trimAl</a>. Seems like a no-brainer, right? Well, here's the catch: by removing positions from your alignment, you are removing useful data, which reduces your evolutionary signal and can make it harder to infer the correct phylogeny. Consider that highly diverged positions are the hardest to align, but they also contain a significant portion of the evolutionary signal, so removing them can make phylogenetic inference impossible. In fact, an <a href="https://academic.oup.com/sysbio/article/64/5/778/1685763" target="_blank">important paper in 2015</a> showed that current methods of automatic filtering reduced the accuracy of single-gene phylogenies in simulated and empirical data. It's my belief based on much review of the literature that divergent positions and insertions/deletions contain important information for inferring correct phylogenetic relationships and that current methods of alignment filtering are too simplistic. There are more sophisticated methods that are being developed (<a href="https://academic.oup.com/sysbio/advance-article-abstract/doi/10.1093/sysbio/syy036/4996308?redirectedFrom=fulltext" target="_blank">see here</a>), and I'm excited to give these a try, but they are so new that I can't recommend them yet. But don't just take my word for it! trimAl is ubiquitous in phylogeny pipelines and has been used successfully by countless respected studies, so I recommend that you read about this topic and consider your dataset when deciding to filter or not. Even better, you could filter your final alignment, then use both a filtered and non-filtered version in phylogeny reconstruction and inspect the differences between the two trees--this is my preferred approach if time permits. 

