# Plot (Facet Grid)
library(ggplot2)
setwd("~/nBox/Courseware/3.StatsBootCamp/_Runs/CP Workshops/Day2 Luminus (Apr2020)")
titanic = read.csv("titanic3.csv")
# data.frame(titanic) no need

attach(titanic)

#create categorical variables
titanic$survived = factor(survived, labels=c("no","yes"))
titanic$sex = factor(sex)
titanic$pclass = factor(pclass)

# you will get a warning- 263 rows have missing data for age
# so lets remove all those records
# titanic2 = titanic[!is.na(titanic$age),]

## FACET_GRID()
# What was the Survival rate on the Titanic?
ggplot(titanic) +
  aes(x = age, fill = survived) +
  geom_histogram(binwidth=5,colour = "black") + 
  #scale_fill_brewer(palette = "Accent") +
  labs(title = "Survival by Age, Class and Gender",
       y = "Survived") +
  theme_bw()+
  facet_grid(sex~pclass, scales = "free") #plot diff scales

