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
                            (1+Urban.Rural|Injury.Mech.category), df, family = binomial, refresh=0)
summary(mandible)
plot(ml_mandible)
pp_check(ml_mandible)


# superior
ml_superior <- stan_glmer(superior ~as.numeric(Age) + Gender  + Injury.Mech.category + 
                            (1 + Urban.Rural| Injury.Mech.category), data = cleaned_set, 
                          family=binomial, refresh=0)
summary(ml_superior)
plot(ml_superior)
pp_check(ml_superior)

# midface
ml_midface <- stan_glmer(midface ~as.numeric(Age) + Gender  + Injury.Mech.category + 
                            (1 + Urban.Rural| Injury.Mech.category), data = cleaned_set, 
                          family=binomial, refresh=0)
summary(ml_midface)
plot(ml_midface)
pp_check(ml_midface)

# otherff
ml_other <- stan_glmer(otherff ~as.numeric(Age) + Gender  + Injury.Mech.category + 
                           (1 + Urban.Rural| Injury.Mech.category), data = cleaned_set, 
                         family=binomial, refresh=0)
summary(ml_other)
plot(ml_other)
pp_check(ml_other)








## test models below

fit_lm <- lm(midface ~ as.numeric(Age) + Gender + Urban.Rural + Injury.Mech.category, data = cleaned_set)
par(mfrow=c(2,2))
plot(fit_lm)


## regression
fit_midface <- stan_glm(midface ~ as.numeric(Age) + Gender + Urban.Rural + Injury.Mech.category,  family = binomial(link = "logit"), data = cleaned_set, refresh = 0)
round(coef(fit_mandible), digits = 5)
plot(fit_mandible)
pp_check(fit_mandible)
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

