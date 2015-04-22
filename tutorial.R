## ----, echo=FALSE, message=FALSE, warning=FALSE--------------------------
require(knitr)
opts_chunk$set(cache=TRUE, warning=FALSE, message=FALSE, fig.align='center')

## ------------------------------------------------------------------------
#install.packages("ggplot2")
library(ggplot2)

## ------------------------------------------------------------------------
str(diamonds)

## ----, plot.height=2-----------------------------------------------------
qplot(carat, data=diamonds)

## ----, eval=FALSE--------------------------------------------------------
## qplot(carat, data=diamonds)

## ------------------------------------------------------------------------
qplot(clarity, fill=cut, data=diamonds)

## ------------------------------------------------------------------------
p1 <- ggplot(aes(x=clarity, fill=cut), data=diamonds)

## ----, message=FALSE-----------------------------------------------------
p1 + geom_bar()

## ------------------------------------------------------------------------
p2 <- ggplot(aes(x=carat, y=depth), data=diamonds)
p2 + geom_point()

## ------------------------------------------------------------------------
p2 + geom_bin2d()

## ------------------------------------------------------------------------
p2 <- p2 + geom_bin2d()

## ------------------------------------------------------------------------
p2 <- p2 + xlab("Carat") + ylab("Depth") + 
 guides(fill=guide_legend(title="Number of diamonds"))
p2

## ------------------------------------------------------------------------
p2 + scale_fill_continuous(breaks=c(1500, 2500, 3500,4500))

## ------------------------------------------------------------------------
p2 + scale_fill_continuous(trans="log")

## ------------------------------------------------------------------------
p2 + scale_fill_continuous(trans="log", breaks=c(1,10,100,1000,5000))

## ------------------------------------------------------------------------
# install.packages("lubridate")
# install.packages("dplyr")
library(lubridate)
library(dplyr)

## ------------------------------------------------------------------------
econ <- economics
econ$date <- ymd(econ$date)
old <- filter(econ, year(date)<"1970")
old$date <- ymd(old$date)

## ------------------------------------------------------------------------
p3 <- ggplot(data=old) + geom_line(aes(x=date, y=pce))
p3

## ------------------------------------------------------------------------
# install.packages("scales") # For nicer dates
library(scales)

## ------------------------------------------------------------------------
p3 + 
  scale_x_datetime(breaks = date_breaks("6 months"), 
                   labels = date_format("%b %Y"))

## ------------------------------------------------------------------------
p3 + 
  scale_x_datetime(breaks = date_breaks("6 months"), 
                   labels = date_format("%B %y"))

