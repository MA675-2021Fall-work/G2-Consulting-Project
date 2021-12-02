source("cleaning_and_code_conversion.R")
source("facial_zone_dummy.R")
source("data_cleaning_subsetting.R")

library(rstanarm)

options(mc.cores = parallel::detectCores())

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
otherff_sub <- subset(cleaned_set, otherff == 1)


ggplot(midface_sub, aes(x = Urban.Rural, fill = Urban.Rural))+
  geom_bar(stat = "count", position = "dodge")+
  facet_wrap(~Injury.Mech.category)+
  ggtitle("Midface area injured patient number vs. demographic information")

ggplot(superior_sub, aes(x = Urban.Rural, fill = Urban.Rural))+
  geom_bar(stat = "count", position = "dodge")+
  facet_wrap(~Injury.Mech.category)+
  ggtitle("Superior area injured patient number vs. demographic information")

ggplot(mandible_sub, aes(x = Urban.Rural, fill = Urban.Rural))+
  geom_bar(stat = "count", position = "dodge")+
  facet_wrap(~Injury.Mech.category)+
  ggtitle("Mandible area injured patient number vs. demographic information")



ggplot(cleaned_set,aes(x = Urban.Rural, y= Age, color = Injury.Mech.category))+
  geom_jitter(width = 0.25)+
  ggtitle("Jitter plot for Injury mech vs. Age at different area")


ggplot(cleaned_set)+
  aes(x = Gender, fill = Injury.Mech.category)+
  geom_bar(stat = "count", position = "dodge")+
  ggtitle("Distribution for injury mech for different gender")

ggplot(cleaned_set)+
  geom_jitter(aes(x=Gender, y= Urban.Rural, color= Urban.Rural), width = 0.25)+
  facet_wrap(~Injury.Mech.category)+
  ggtitle("Gender vs. Residency", subtitle = "Injury Mechanism")



visual_subset <-cleaned_set %>% 
  subset(Injury.Mech.category=="MVC" | Injury.Mech.category=="Falls")
ggplot(visual_subset)+
  geom_jitter(aes(x=Urban.Rural, y= Age, color=Injury.Mech.category), width=0.25)+
  ggtitle("Residency vs. Age", subtitle="Falls and MVC cases")


ggplot(cleaned_set,aes(x = Age))+
  geom_bar(stat = "count",position = "dodge")+
  geom_density(aes(x = Age))

hist(cleaned_set$Age, breaks = 5,col = "lightblue", xlab = "Patient Age", ylab = "Frequency", main = "Histogram for distribution for patients' AGE")

trausite <- cleaned_set[, c(1, 8, 9, 10,11)]
trausite<- trausite%>%
  pivot_longer(!Study.ID.., names_to = "trauma_site", values_to = "level")
trausite <- filter(trausite, trausite$level==1)

trausite1 <- cleaned_set %>% inner_join(trausite, by="Study.ID..")

ggplot(trausite1)+
  geom_bar(aes(x=Urban.Rural, fill=Injury.Mech.category), stat="count")+
  facet_wrap(~trauma_site)+
  ggtitle("Number of patients with different trauma sites ")

  
ggplot(cleaned_set)+
  geom_bar(aes(x=Gender,fill=Gender))+
  coord_polar()+
  ggtitle("Proportion of Gender")


ggplot(cleaned_set)+
  geom_bar(aes(x=Urban.Rural,fill=Urban.Rural))+
  coord_polar()+
  ggtitle("Proportion of Location")


ggplot(cleaned_set)+
  geom_bar(aes(x=Injury.Mech.category,fill=Injury.Mech.category))+
  ggtitle("Proportion of Injury Mechanism")
