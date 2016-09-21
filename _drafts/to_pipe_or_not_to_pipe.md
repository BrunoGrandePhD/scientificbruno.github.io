---
title: "When (Not) to Use Pipes in R"
author: "Bruno Grande"
date: "2016-09-21"
output: 
  md_document:
    preserve_yaml: true
    variant: markdown_github
layout: post
tags: [r]
read_more: false
---

When I first learned about pipes in R, they seemed like an elegant solution for a common scenario: performing successive data transformations where only the final value is of use.

Traditionally, this was done...

My familiarity with Unix pipes accelerated my adoption of their R counterpart. Because I was already already leveraging various tidyverse packages—notably dplyr, tidyr and ggplot2—

<https://renkun.me/blog/2014/08/08/difference-between-magrittr-and-pipeR.html>

<http://www.fromthebottomoftheheap.net/2015/06/03/my-aversion-to-pipes/>

<http://stackoverflow.com/questions/35933272/why-is-using-dplyr-pipe-slower-than-an-equivalent-non-pipe-expression/35935105>

``` r
library(magrittr)
library(pipeR)

set.seed(1)

x <- rnorm(1000)

func <- function(x) {
  as.list(sqrt(abs(x^2)))
}

func2 <- function(x) {
  purrr::map(x, ~.x^2 %>% abs() %>% sqrt())
}

func3 <- function(x) {
  purrr::map(x, ~.x^2) %>% 
    purrr:::map(abs) %>% 
    purrr::map(sqrt)
}

func4 <- function(x) {
  purrr::map(x, ~sqrt(abs(.x^2)))
}

testthat::expect_identical(func(x), func2(x))
testthat::expect_identical(func(x), func3(x))
testthat::expect_identical(func(x), func4(x))

microbenchmark::microbenchmark(func(x), func2(x), func3(x), func4(x), times = 10)
```

    ## Unit: microseconds
    ##      expr        min         lq        mean     median         uq
    ##   func(x)     37.882     43.151     48.3112     45.738     57.066
    ##  func2(x) 132940.456 135694.429 137176.4763 137387.948 138491.903
    ##  func3(x)   1627.000   1663.744   1783.6085   1710.113   1784.737
    ##  func4(x)    999.043   1027.069   1034.6976   1030.501   1043.270
    ##         max neval cld
    ##      62.007    10  a 
    ##  143350.493    10   b
    ##    2379.833    10  a 
    ##    1079.469    10  a

**Disclaimer:** I'm by no means an R expert, so I might have gotten something wrong. This post is as much about informing others as it is about collecting people's thoughts on the topic.
