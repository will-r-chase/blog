---
title: A responsive CV template with HTML/CSS (Hermione Granger's CV)
author: Will
date: '2018-08-10'
slug: a-responsive-cv-template-with-html-css-hermione-grangers-cv
categories:
  - Web Development
  - General
tags:
  - HTML
  - CSS
  - Fun
header:
  caption: ''
  image: ''
---

I've been going through the job application cycle recently, which meant updating my CV. You can write a CV with Microsoft Word, but I find it exceptionally frustrating to do any sort of fancy formatting in Word, and more imporantly, I want my CV to be a page on my website (not just a downloadable file), that has the responsiveness expected of any modern webpage. I found <a href="http://www.thomashardy.me.uk/free-responsive-html-css3-cv-template" target="_blank">this</a> excellent HTML/CSS template from Thomas Hardy, and decided it was the aesthetic I was going for. 

I adapted this template by incorporating a couple of changes made to the CSS by <a href="https://lmyint.github.io/" target="_blank">Leslie Myint</a>, and adding several changes of my own. Many of these were small stylistic changes, but the main updates were re-coding the key skills section to work better with skills that are longer than a couple words, and adding a references section that uses vcard formatting for reference information and puts these inside a CSS flex-flow grid. 

For funsies, I made the HTML template as Hermione Granger's CV. You can preview it <a href="https://codepen.io/will-r-chase/pen/Owdpmv?editors=1100" target="_blank">here</a>, and get the code on <a href="https://github.com/will-r-chase/CV_template" target="_blank">my GitHub</a>. 

This template is very easy to adapt. For example, you could add sections on teaching, presentations, or outreach by just adding new sections using the combination of selectors [.sectionTitle, .sectionContent, .contentHeader, .contentDate, .mainDetails, .subDetails.]. There are excellent examples of this on <a href="https://github.com/lmyint/lmyint.github.io/blob/master/cv/index.html" target="_blank">Leslie Myint's GitHub</a>. For tips on how to format the vcard references section, see <a href="http://microformats.org/wiki/hcard" target="_blank">here</a>.

I use Blogdown/Hugo with the Academic theme to build this website, so it was easy to make a page for my CV. I made a simple widget for the CV page (which you can copy from <a href="https://github.com/will-r-chase/blog/blob/master/content/home/cv.md" target="_blank">my github</a>), and put this widget in my /content/home folder. You also need to edit your config.toml file to include the CV widget as a page like this: ![CV_page](/img/CV_config.png) 

Then, you can make a folder in your /content directory called "cv" and name your HTML CV file index.html and put it in the new /content/cv folder. Finally you will need to make a new folder in /static called "css" and put the CSS file (named cv.css) in /static/css. If you want to include a PDF version (or download your CV as a PDF), just open the HTML version in chrome, go to print page (ctrl+P), and choose the destination as "save as PDF". Call your PDF version "cv.pdf" and place in your content/cv directory. 

I really like this CV template--I think it's stylish, but not too flashy to distract from the material. I worked out some bugs with the responsiveness and tested on all viewports, but let me know if there are any problems there. Big credit to Thomas Hardy for building the majority of this template, and Leslie Myint for helpful tips and edits. I hope you guys find some use for this, and feel free to take it and make it your own!

