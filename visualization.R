source("cleaning_and_code_conversion.R")
source("facial_zone_dummy.R")
source("data_cleaning_subsetting.R")

library(rstanarm)
cleaned_set$Age <- as.numeric(cleaned_set$Age)
cleaned_set$Gender <- as.factor(cleaned_set$Gender)
cleaned_set$Urban.Rural <- as.factor(cleaned_set$Urban.Rural)
cleaned_set$Injury.Mech.category <- as.factor(cleaned_set$Injury.Mech.category)

##fit model for mandible
fit_mandible <- stan_glm(formula = mandible ~ Age + Gender + Urban.Rural + Injury.Mech.category,  family = binomial(link = "logit"), data = cleaned_set, refresh = 0)
round(summary(fit_mandible), digits = 2)

fit_superior <- stan_glm(formula = superior ~ Age + Gender + Urban.Rural + Injury.Mech.category,  family = binomial(link = "logit"), data = cleaned_set, refresh = 0)
round(summary(fit_superior), digits = 2)

fit_midface <- stan_glm(formula = midface ~ Age + Gender + Urban.Rural + Injury.Mech.category,  family = binomial(link = "logit"), data = cleaned_set, refresh = 0)
round(summary(fit_midface), digits = 2)

mandible_sub <- subset(cleaned_set, mandible == 1)
superior_sub <- subset(cleaned_set, superior == 1)
midface_sub <- subset(cleaned_set, midface == 1)



ggplot(midface_sub, aes(x = Urban.Rural, fill = Urban.Rural))+
  geom_bar(stat = "count", position = "dodge")+
  facet_wrap(~Injury.Mech.category)+
  ggtitle("Midface barchart")


ggplot(cleaned_set,aes(x = Urban.Rural, y= Age, color = Injury.Mech.category))+
  geom_jitter(width = 0.25)+
  ggtitle("Jitter plot for Injury mech vs. Age")


ggplot(cleaned_set, aes(x = Urban.Rural, fill = Urban.Rural))+
  geom_bar(stat = "count", position = "dodge")+
  facet_wrap(~Injury.Mech.category)
  

ggplot(midface_sub)+
  aes(x = Urban.Rural, y = midface, fill = Injury.Mech.category)+
  geom_bar(stat = "identity")
  
  