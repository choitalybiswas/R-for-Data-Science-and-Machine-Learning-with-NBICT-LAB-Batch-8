# installing packages
#install.packages(c("tidyverse", "car", "emmeans", "effectsize", "performance", "broom", "kableExtra"))
library(tidyverse)
library(dplyr)
d <- read.csv("cropdata.csv")
summs <- d %>%
  group_by(fert, irr) %>%
  summarise(mean = mean(y), se = sd(y)/sqrt(n()), .groups = "drop")
library(ggplot2)
ggplot(summs, aes(irr, mean, group = fert))+
  geom_line() +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin = mean-se, ymax = mean+se), width = .2) +
  facet_wrap(~fert, nrow = 1) +
  labs(x="Irrigation", y="Mean yield",
       title="Interaction of Fertilizer and Irrigation") +
  theme_classic(base_size = 12)
m <- aov(y ~ fert + irr + fert * irr, data = d)
summary(m)

# assumption visual checks
plot(m)
par(mfrow=c(2,2))
plot(m)
par(mfrow=c(1,1))

#shapoiro-wilk on residuals (normality)
residuals(m)
res <- residuals(m)
shapiro.test(res)


# levene's test foe equal variances
library(car)
leveneTest(y ~ fert*irr, data = d, center = median)
car::leveneTest(y ~ fert*irr, data = d, center = median)

#interaction contrasts (simple effects):
# effect of fert at each level of irr
library(emmeans)
contrast(emmeans(m, ~ fert | irr), method = "pairwise", adjust = "tukey")
contrast(emmeans(m, ~ fert | irr), method = "pairwise", adjust = "tukey")
library(emmeans)
contrast(emmeans(m, ~ irr | fert), method = "pairwise", adjust = "tukey")

# main effect comparison ( if the interaction in negligible)
contrast(emmeans(m, ~ irr), method = "tukey")
contrast(emmeans(m, ~ fert), method = "tukey")

# CLD letters
# install.packages("multcomp")
library(multcomp)
#install.packages("multcompView")
library(multcompView)

