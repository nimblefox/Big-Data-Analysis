library(forcats)
library(tidyverse)
library(patchwork)
library("readxl")
library("ggpubr")

data <- read_excel("Anova fodder.xlsx")

ggboxplot(data, x = "Model", y = "Mpg", 
          color = "Model", palette = c("#00AFBB", "#E7B800", "#A8C900"),
          ylab = "Mpg", xlab = "")

summary(aov(Mpg ~ Model, data=data))
# assume alpha = 0.01 i.e 99% C.I.
# now look at Pr(>F) value
# Probability that there is difference is 0.000904

TukeyHSD(aov(Mpg ~ Model, data=data))

aggregate(data$Mpg, by=list(data$Model), FUN=mean)
