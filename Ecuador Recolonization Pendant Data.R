##Plotting Pendant Data from Ecuador Recolonization Expt 2017
##Last Edited by Erin Larson on 4 April 2017
##clearing workspace
rm(list=ls())

##setting working directory
setwd("/Users/erinlarson/Dropbox/Documents/Dissertation Projects/Ecuador Recolonization Experiments/R Directory") #modify this to reflect your directory

##if you don't have these packages, download/install them using command: install.packages("package name")
library(ggplot2)
library(lattice)
library(RColorBrewer)
##picking color palette
display.brewer.all()

##reading in pendant data
all.pendant<-read.csv("All_Pendant_Data.csv")
head(all.pendant)
summary(all.pendant)

##lattice plot of temperature
#setting colors
mycolors<-brewer.pal(5, "Set1")
my.settings <- list(superpose.line=list(col=mycolors, lwd=17),strip.background=list(col="black"),
  strip.border=list(col="black"))
  
  TempYLims<-list(c(0,40), c(5, 25))
  
  temp.plot<-xyplot(Temp_C~as.POSIXct(Unix_Time, origin="1970-01-01")|Type, data=all.pendant, type="l", lwd=3, group=Site, scales=list(relation="free"), ylim=TempYLims, xlab="Date", ylab="Temperature (Degrees Celsius)", main= "2017 Recolonization Experiment", strip=strip.custom(var.name="Type", factor.levels=c("Air", "Water"), strip.levels=rep(TRUE,3)), auto.key=list(space="top", columns=5, title="Site", lines=TRUE, points=FALSE),  par.settings = my.settings, par.strip.text=list(col="white", font=2))
temp.plot

##lattice plot of light
LightYLims<-list(c(0,331000), c(0, 331000))
  light.plot<-xyplot(Intensity_Lux~as.POSIXct(Unix_Time, origin="1970-01-01")|Site, data=all.pendant, type="l", lwd=3, group=Type, scales=list(relation="free"), ylim=LightYLims, xlab="Date", ylab="Light Intensity (Lux)", main= "2017 Recolonization Experiment", strip=strip.custom(var.name="Location", factor.levels=c("Edwin's", "Guango", "Pap 4", "Pap 129", "San Isidro"), strip.levels=rep(TRUE,3)), auto.key=list(space="top", columns=2, title="Type", lines=TRUE, points=FALSE),  par.settings = my.settings, par.strip.text=list(col="white", font=2))
light.plot


