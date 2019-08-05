---
title: How I'm Learning D3.js
author: Will
date: '2019-08-03'
slug: how-i-m-learning-d3-js
categories:
  - D3
  - dataviz
  - Web Development
tags:
  - D3
  - dataviz
  - Javascript
  - tutorials
authors: []
header:
  caption: ''
  image: ''
  preview: yes
---

Since I started learning D3.js as part of the 100 Days of Code project the number one question I've gotten is: how are you learning D3? I've had lots of people that want to know what learning resources I'm using, what my process is, and what I suggest for how to start on D3. I don't think I'm any sort of expert, and I certainly don't claim to have the ultimate learning process, but now that I'm halfway through the project I decided to share what I've learned. By the way, if you're looking for a list of links, Nadieh Bremer has a <a href="https://www.visualcinnamon.com/resources/learning-data-visualization" target="_blank">wonderful list</a>. 

In April, after months of flirting with the idea, I decided to commit to learning D3.js and Javascript. Prior to that I knew HTML and CSS (sort of), but I had not written a line of Javascript until I started the project. I post progress updates on Twitter and often get replies asking what guides I'm following, what book I'm reading, or what course I'm taking--I'm afraid I can't really help those of you. My learning process has been quite unstructured, I'm not following any sort of linear course or guide, and I'm sort of just making it up as I go along. My strategy is basically to learn by doing. I don't necessarily think this is the best way to do things, it doesn't work for everyone, and I wouldn't recommend it outright. But through this process I have made *a lot* of mistakes so I figure I can at least share with you what NOT to do. What follows will be my own experience, I will outline how I have been learning D3, the mistakes I've made, and the things I wish I had known when I started. 

**Disclaimer:** This is merely an account of my own personal experience learning D3. It does not constitute professional advice and has not been vetted or researched at all. This is certainly not the *right way* to learn D3; it worked for me, and it may work for you, but there is nothing objectively correct about it.


## Learning resources
Before I started my official 100 days, I started reading Scott Murray's book "Interactive Data Visualization for the Web". I read about half the book and it gave me a great primer on the lingo and common patterns in D3. One downside of the book is that it's written for D3v4, but now we're on to D3v5, so there's some key differences that aren't covered in the book. **Sidenote:** if you're a book person, Amelia Wattenbergers new <a href="https://www.fullstack.io/fullstack-d3" target="_blank">Fullstack D3 book</a> looks amazing. I haven't read it yet but the preview looks great and it's brand new so likely the most up-to-date book you'll find.

I enjoyed Scott's book, it's funny, clear, and well written. But I'm really much more of an example-based learner, so I quickly jumped into code. I chose <a href="https://observablehq.com/" target="_blank">Observable</a> as my playground. Observable is a web-based notebook environment for writing Javascript. The wonderful thing is that Observable notebooks can be forked and edited and will update in real time. It's an easy way to jump into coding without having to set up a dev environment or worry about web servers and such. But there are a couple of gotcha's to watch out for.

### Observe and learn
Here's what I wish I had known when I started using Observable: 

+ Observable is not Javascript. On the surface it seems like Observable is just the same as vanilla Javascript, but there are several key differences and it's important to understand them. 
+ Observable cells are reactive and run in topological order. That means that anytime one cell updates, it will trigger a re-run of any cells that depend on it. This means you really need to think about how you code things like the D3 `enter-update-exit` pattern. 
+ Cells that are longer statements need curly braces and always need `return` statements. Still today I forget to `return` things when working in Observable. 
+ There're several functions that are baked in to the Observable namespace and are useful ways around doing things that you would often do differently in a normal Javascript program. 

To avoid frustration and make your learning experience as smooth as possible I recommend you go through the <a href="https://observablehq.com/collection/@observablehq/introduction" target="_blank">introduction notebooks</a> very carefully, and pay special attention to the "Introduction to Code" and "Observable's not Javascript" notebooks. For me as a beginner, these differences were very hard to understand. I think the easiest way to make sure everything works, is to *only follow examples that you find on Observable*. Most of the problems I had were when I found something on a blog or a <a href="https://bl.ocks.org/" target="_blank">block</a> and tried to port it to Observable--sometimes this works, but when it doesn't it can be really frustrating and tricky for a beginner to debug. The good news is there's tons of material on Observable for you to follow. 

## My process
Having introduced Observable, here's my typical process for learning D3. I decide on a new chart I want to make, let's say I want to make a Sankey diagram. I search Observable for a Sankey diagram example and give it a read. Then I search for some blogs on how Sankey's work in D3, with special attention on how to prepare my data for the chart. As with ggplot, having your data in the right format is often half the battle, so it's important to pay close attention to data preparation. Then I will go back to Observable, spend some time getting my data in the right format, and then try to emulate the chart, using the example notebook as a guide. Finally, I'll play around with various parameters, colors, and other options to personalize the chart. There're a few steps along this process where things can go wrong, here's how to get the most out of it:

+ Beware version differences. A lot of tutorials I find on blogs are written in v4 or v3 of D3, but a lot of the content on Observable is written in v5. The differences between versions are not difficult to parse for longtime users, but for beginners it can really throw you off. A lot of code is portable between versions, but it's something to be careful about. 
+ As stated above, be very careful in trying to port code you find on blogs or Blocks to Observable, always keep in mind the Observable quirks. 
+ Don't *just* copy-and-paste code. I see no problem in copying-and-pasting in certain cases, but it's not a great way to learn, or at least it's not a great way to learn if it's all that you do. Even if you're going to entirely reproduce an example, I think there's some benefit in typing it out yourself. And even more important than typing the code, is making sure you understand it. Sometimes I'll copy examples to get something working, but it's so so important to go back and walk through the code line by line to make sure you really understand what each line is doing. Observable is perfect for this because you can tweak parameters, change variables, comment things out, and see what happens. 

## Some final tips
I've talked a lot about what not to do, so here's some things I think you *should* do:

+ Work with the same dataset a lot. I think it's really helpful to find one dataset (preferably something large that has lots of options for plotting) and work with that throughout your learning process. You become more familiar with the data as you go along, and it helps reduce cognitive fatigue to have to worry about data cleaning and stuff when you're also trying to learn D3. 
+ Learn some Javascript basics before you start D3. I did a teensy bit, but I really wish I had a better grasp of Javascript when I started, it makes it really difficult to learn D3 when you are still taking baby steps with Javascript. Especially helpful is knowing how to work with data structures, manipulate arrays, and access variables. 
+ Ask for help. People in the D3 community are very nice, and I am very grateful to all of the lovely people that have helped me along the way. Join the Data Visualization Society Slack, or the D3 Slack, and if you're stuck, just ask, more than likely someone will fix your code and tell you what was wrong. 







