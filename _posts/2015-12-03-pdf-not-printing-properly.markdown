---
layout: post
title:  "Printing PDF Documents as Images"
date:   2015-12-03
tags: [bug]
---

I recently ran into an issue where a PDF document wasn't printing properly from my Mac no matter what I tried. The text changed to a monospaced font with messed-up kerning. 

![Ugly PDF](/images/2015-12-03-ugly-pdf.jpg)

<!--more-->

I tried to re-export the PDF in an attempt to convert the text into outlines. I tried printing using different PDF viewers. I even tried exporting a PostScript file. None of these worked. 

Eventually, I found a quick fix. In Adobe Reader, you have the option to print a PDF document as an image (under Print > Advanced > Print as Image). This way, you're basically guaranteed to get what you see on your screen. The resulting printed document is high enough resolution that you don't really notice it was converted into an image. 

![Print as Image](/images/2015-12-03-print-as-image.png)
