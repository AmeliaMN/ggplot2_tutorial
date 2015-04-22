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

## ----, message=FALSE, fig.height=3---------------------------------------
p1 + geom_bar()

## ------------------------------------------------------------------------
p1 + geom_bar(position="dodge")

## ------------------------------------------------------------------------
p1 + geom_bar(position="fill")

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
p2 + facet_wrap(~color)

## ------------------------------------------------------------------------
p2 + facet_grid(color~clarity)

## ------------------------------------------------------------------------
# install.packages("lubridate")
# install.packages("dplyr")
library(lubridate)
library(dplyr)

## ------------------------------------------------------------------------
econ <- economics
str(econ)
econ$date <- ymd(econ$date)
old <- filter(econ, year(date)<"1970")
old$date <- ymd(old$date)

## ------------------------------------------------------------------------
p3 <- ggplot(data=old) + geom_line(aes(x=date, y=pce))
p3

## ------------------------------------------------------------------------
# install.packages("scales") 
library(scales)

## ------------------------------------------------------------------------
p3 + 
  scale_x_datetime(breaks = date_breaks("6 months"), 
                   labels = date_format("%b %Y"))

## ------------------------------------------------------------------------
p3 + 
  scale_x_datetime(breaks = date_breaks("6 months"), 
                   labels = date_format("%B %y"))

## ------------------------------------------------------------------------
#install.packages("ggmap")
library(ggmap)

## ------------------------------------------------------------------------
str(crime) # crime data from ggmap package

## ------------------------------------------------------------------------
midlat <- mean(crime$lat, na.rm=TRUE)
midlon <- mean(crime$lon, na.rm=TRUE)
m1 <- get_map(source='stamen', location=c(midlon, midlat), 
              maptype="watercolor", zoom=11)
p4 <- ggmap(m1)
p4 

## ------------------------------------------------------------------------
p4 + geom_point(aes(x=lon, y=lat), data=crime)

## ------------------------------------------------------------------------
p4 + geom_hex(aes(x=lon, y=lat), data=crime, alpha=0.8) + 
  guides(fill=guide_legend(alpha=0.5, title="Number of crimes")) + 
  xlab("") + ylab("") + theme(axis.line=element_blank(), 
                              axis.text=element_blank(), 
                              axis.ticks=element_blank(),
                              axis.title=element_blank())

## ----, eval=FALSE--------------------------------------------------------
## baseplot <- ggplot() +
##   aes(x=citystate, y=Freq, fill = Response, order=Response) +
##   facet_wrap(~year, nrow=3)+geom_bar(data = trial2$neg, stat = "identity") +
##   scale_fill_manual(breaks=c("Not at all satisfied", "2", "3", "4",
##                              "Extremely satisfied"), values=colorsB,
##                     name="Response") +
##   geom_bar(data = trial2$pos, stat = "identity") + coord_flip() +
##   ggtitle("Community satisfaction") + xlab("") +ylab("") +
##   scale_y_continuous(limits=c(-0.5, 1),
##                      breaks=seq(from=-0.5, to=0.75, by=0.25),
##                      labels=c("50%", "25%", "0", "25%", "50%", "75%")) +
##   theme(legend.text=element_text(size=14),
##         legend.title=element_text(size=16),
##         axis.text=element_text(size=14),
##         strip.text=element_text(size=14))
## baseplot

## ------------------------------------------------------------------------
# install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all(n=5, type="qual")

## ------------------------------------------------------------------------
p1 + geom_bar(position="dodge") + scale_fill_brewer(palette="Dark2")

## ----, echo=FALSE--------------------------------------------------------
p4 <- p4 + geom_hex(aes(x=lon, y=lat), data=crime, alpha=0.8) + 
  guides(fill=guide_legend(alpha=0.5, title="Number of crimes")) + 
  xlab("") + ylab("") + theme(axis.line=element_blank(), 
                              axis.text.x=element_blank(), 
                              axis.text.y=element_blank(), 
                              axis.ticks=element_blank(),
                              axis.title.x=element_blank(), 
                              axis.title.y=element_blank())

## ----, eval=FALSE--------------------------------------------------------
## ggsave("beautiful_hex_map.jpg", plot=p4)

