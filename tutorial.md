ggplot2 tutorial
========================================================
author: Amelia McNamara
date: 4/22/2015

ggplot2
========================================================

ggplot2 is an R package by Hadley Wickham that lets you make beautiful graphics in R (relatively) easily.

Getting started
========================================================
First, we need to install and load the package

```r
#install.packages("ggplot2")
library(ggplot2)
```

qplot()
========================================================
Then, if you want to take the easiest way out, you can use qplot()

```r
qplot(carat, data=diamonds)
```

![plot of chunk unnamed-chunk-2](tutorial-figure/unnamed-chunk-2-1.png) 

ggplot2 syntax
========================================================

```r
qplot(carat, data=diamonds)
```
Already, this might seem a little different, because you're not using the $ operator. 

Instead, you're listing the name of the variable(s) and then telling R where to "look" for that variable with data=. This is like what we do when modeling using functions like lm().

More qplot()
========================================================


```r
qplot(clarity, fill=cut, data=diamonds)
```

![plot of chunk unnamed-chunk-4](tutorial-figure/unnamed-chunk-4-1.png) 

Resources for ggplot2
========================================================
* [ggplot2 cheatsheet](http://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)
* [R graphics cookbook](http://www.cookbook-r.com/Graphs/)