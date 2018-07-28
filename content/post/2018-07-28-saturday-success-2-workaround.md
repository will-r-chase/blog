---
title: 'Saturday Success #2: Workaround'
author: Will
date: '2018-07-28'
slug: saturday-success-2-workaround
categories:
  - General
tags:
  - Ramblings
  - Saturday Success
  - Real Life Science
header:
  caption: ''
  image: ''
---

This week I've been ploughing through final figure revisions for a big paper that's been a couple years in the making :clap::clap::clap:. Everything was going (relatively) smooth until I got to a tree I was trying to plot with associated barcharts. The idea was to summarize some data on major clades in this tree by putting barcharts of summary statistics aligned with each major clade to the side of the tree. I came up with the brilliant solution of using `ggtree::inset()` to align each barchart with a particular clade. However, when I tried the code my plots refused to render, they kept coming out as weird grey squiggles. I spent about 4 hours reproducing the error and troubleshooting. I was about to start a github issue and probably spend days figuring out the bug (or my screwup), but then I got one of those lightbulb moments :bulb:. Instead of wasting time trying to troubleshoot, I could simply use a method for arranging my tree and barcharts on one page using a multiplotting method. Enter gridExtra. Simply define a grid layout, order your plots in a list to match your layout, and use `grid.arrange()`. I've used gridExtra before, but never really realized its full potential until now. Seriously, it's amazing, <a href="https://cran.r-project.org/web/packages/gridExtra/vignettes/arrangeGrob.html" target="_blank">go check it out</a>. Thanks to a workaround, I saved myself precious time this week and managed to finish most of the things on my To Do list, and that's a success!