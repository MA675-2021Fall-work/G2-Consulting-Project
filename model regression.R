source("cleaning_and_code_conversion.R")
source("facial_zone_dummy.R")
source("data_cleaning_subsetting.R")
pacman::p_load(
  "ggplot2",
  "knitr",
  "arm",
  "rstanarm",
  "foreign",
  "bayesplot",
  "glmx",
  "reshape2",
  "VGAM",
  "dplyr",
  "magrittr",
  "tidyverse",
  "lme4"
  )

# mandible 
ml_mandible <- stan_glmer(mandible ~ as.numeric(Age) + Gender  + Injury.Mech.category + 
                            (1+Urban.Rural|Injury.Mech.category), data = cleaned_set, family = binomial(link="logit"), refresh=0)
summary(ml_mandible)
p1<- plot(ml_mandible)+ggtitle("mandible")
q1 <-pp_check(ml_mandible)+ggtitle("mandible")
r1<- binnedplot(fitted(ml_mandible), resid(ml_mandible, type = "response"),main="Binned residual plot for mandible")

kable(fixef(ml_mandible), "pipe")
# superior
ml_superior <- stan_glmer(superior ~as.numeric(Age) + Gender  + +Injury.Mech.category + 
                            (1 + Urban.Rural| Injury.Mech.category), data = cleaned_set, 
                          family=binomial(link = "logit"), refresh=0)
summary(ml_superior)
p2<-plot(ml_superior) +ggtitle("superior")
q2<- pp_check(ml_superior) +ggtitle("superior")
r2 <- binnedplot(fitted(ml_superior), resid(ml_superior, type = "response"),main="Binned residual plot for superior")

kable(fixef(ml_superior), "pipe")
# midface
ml_midface <- stan_glmer(midface ~as.numeric(Age) + Gender + Injury.Mech.category + 
                            (1 + Urban.Rural| Injury.Mech.category), data = cleaned_set, 
                          family=binomial(link="logit"), refresh=0)
summary(ml_midface)
p3<- plot(ml_midface)+ggtitle("midface")
q3 <- pp_check(ml_midface) +ggtitle("midface")
r3<- binnedplot(fitted(ml_midface), resid(ml_midface, type = "response"), main="Binned residual plot for midface")

kable(fixed(ml_midface))
# otherff
ml_other <- stan_glmer(otherff ~as.numeric(Age) + Gender  + Injury.Mech.category + 
                           (1 + Urban.Rural| Injury.Mech.category), data = cleaned_set, 
                         family=binomial(link="logit"), refresh=0)
summary(ml_other) 
p4<-plot(ml_other)+ggtitle("other")
q4 <- pp_check(ml_other)+ggtitle("other")

r4<- binnedplot(fitted(ml_other), resid(ml_other, type = "response"), main="Binned residual plot for other")

kable(fixed(ml_other), "pipe")
grid.arrange(p1,p2,p3,p4, ncol=2)

grid.arrange(q1,q2,q3,q4,ncol=2)


library(gridExtra)


## test models below

fit_lm <- lm(midface ~ as.numeric(Age) + Gender + Urban.Rural + Injury.Mech.category, data = cleaned_set)
par(mfrow=c(2,2))
plot(fit_lm)


## regression
fit_midface <- stan_glm(midface ~ as.numeric(Age) + Gender + Urban.Rural + Injury.Mech.category,  family = binomial(link = "logit"), data = cleaned_set, refresh = 0)
round(coef(fit_mandible), digits = 5)
plot(fit_midface)
pp_check(fit_midface)
# zero inflation

## validation
jitter_binary <- function(a,jitt=0.05){
  ifelse(a==0, runif(length(a),0,jitt), runif(length(a),1-jitt,1))
}
df$mandible_jitter <- jitter_binary(df$mandible)

ggplot(df)+
  geom_point(aes(x=Urban.Rural, y=mandible_jitter, color=Injury.Mech.category))+
  curve(invlogit(cbind(1,18,0,x,0,0,1,0,0)%*%coef(fit_mandible)),col="red")
  
predict(fit_mandible, newdata = cleaned_set, type = "response")



##



# glmer_function<- function(para1){
#   df<- cleaned_set  
#   facial_trauma<- stan_glmer(para1 ~ as.numeric(Age) + Gender  + Injury.Mech.category + (1+Urban.Rural|Injury.Mech.category), 
#                              data= df, family = binomial, refresh=0)
#   return(facial_trauma)
# }

