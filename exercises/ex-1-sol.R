attach(mtcars)
names(mtcars)

# Set margins for error "figure margins too large"
par(mar=c(2,2,2,2))

# Plot 1 (Bar Chart)
barplot(table(gear), col="green",
        main='Distribution of Gears', 
        xlab='Number of Gears', 
        ylab='Frequency Count')

# Plot 2 (Pie Chart)
pie(table(carb), main='Cars With Specific no. of Carburetors')


# Plot 3 (Histogram)
hist(hp, col=rainbow(5),
        main="Distribution of Horsepower",
        xlab='Horsepower',
        ylab='Frequency Count')

#Plot 4 (Boxplot)
boxplot(disp~cyl, 
        col = c('red','green','blue'),
        xlab="No. of Cyclinders",
        ylab="Engine Displacement",
        main = "Displacement vs Cylinder")


#Plot 5 (Boxplot)
gears34= gear == 3 | gear == 4
g34 = gear[gears34]
mpg34 = mpg[gears34]
boxplot(mpg34~g34, col = c('red','blue'), 
        xlab="3 and 4 Gears",
        ylab="Miles per Gallon",
        main = "3 & 4 Gears")

#plot 6 (Line Chart)
cyl8= cyl == 8
d8 = disp[cyl8]
m8 = mpg[cyl8]
plot(d8, m8,
     main="Disp vs. MPG (8-cyl Cars)", # title
     xlab="Displacement",          # x axis label
     ylab="Miles Per Gallon",               # y axis label
     font.lab=2,                            # bold label
     cex.axis=0.8,                          # shrink axis size
     pch=16,                                # change point symbol
     col="blue")                            # set point colour

## add a line to fit the data
abline(lm(mpg~disp),                        # add a regression line
       col="red",                           # set line colour
       lty=3,                               # set line type
       lwd=2)                               # set line width

# Alternative:
scatter.smooth(d8,m8,main="Disp vs. MPG (8-cyl Cars)",
      xlab="Displacement",          # x axis label
      ylab="Miles Per Gallon",               # y axis label
      font.lab=2,                            # bold label
      cex.axis=0.8,                          # shrink axis size
      pch=16,                                # change point symbol
      col="blue")                            # set point colour


# Plot 7 (Facet Grid)
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

