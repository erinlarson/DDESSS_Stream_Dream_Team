
setwd('~/Downloads/')

landuse_data<-read.csv("LanduseComplete.csv")
landuse_data<-data.frame(landuse_data)



library(dplyr)
averages = group_by(landuse_data, HUC8) %>% 
    summarise(PFOR2 = mean(PFOR, na.rm = TRUE),
              PWETL2= mean(PWETL, na.rm = TRUE),
              PURB2= mean(PURB, na.rm = TRUE),
              PAGT2= mean(PAGT, na.rm = TRUE)) %>% write.csv("avg_landuse.csv")

head(averages)
