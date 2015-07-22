---
title: "Project2 exploDatan"
output: html_document
---

```r{}
setwd("C:/Coursera/DataScience/ExploratoryDataAnalysis/Project")
dir() ## to check if the working file are  in the directory
```
#Data acquisition and Processing
```{r}
library("plyr")
library("dplyr")
```
## Loading and Reading dataset
if(!file.exists("exdata-data_NEI_data.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%Fdata%2FNEI_data.zip", temp)
        unzip(temp)
        unlink(temp)
}
```{r}
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
head(NEI)
head(SCC)
str(SCC)

## Here we want to extract SCC related columns.
dtf <- subset(SCC, select = c("SCC", "Short.Name"))
head(dtf)
## Merge NEI and SCC
NS <- merge(NEI, dtf, by.x = "SCC", by.y = "SCC", all = TRUE)

#------
```
## Questions

>1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008 using the base plot system
showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

```{r}
yearNS_emiss <- aggregate(Emissions ~ year, NS, sum)
head(yearNS_emiss)
```
  year |Emissions
  ---------------
1 1999 | 7332967
2 2002 | 5635780
3 2005 | 5454703
4 2008 | 3464206

plot(yearNS_emiss$Emissions ~ yearNS_emiss$year, main = "Total US PM2.5 Emissions",
        type = "b", xlab = "Year", ylab = "Emissions (in tons)", xaxt = "n")
axis(side = 1, at = c("1999", "2002", "2005", "2008"))

par(mar=c(5.1, 5.1, 4.1, 2.1))
dev.copy(png, file = "plot1.png", width = 720, height = 480)
dev.off()
#---------------------------------------

#> 2 Having 


