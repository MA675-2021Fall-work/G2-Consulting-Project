library(lme4)

df <- cleaned_set

## regression
fit_mandible <- stan_glm(formula = mandible ~ Age + Gender + Urban.Rural + Injury.Mech.category,  family = binomial(link = "logit"), data = cleaned_set, refresh = 0)
round(coef(fit_mandible), digits = 5)

## validation
jitter_binary <- function(a,jitt=0.05){
  ifelse(a==0, runif(length(a),0,jitt), runif(length(a),1-jitt,1))
}
df$mandible_jitter <- jitter_binary(df$mandible)

ggplot(df)+
  geom_point(aes(x=Urban.Rural, y=mandible_jitter, color=Injury.Mech.category))+
  curve(invlogit(cbind(1,18,0,x,0,0,1,0,0)%*%coef(fit_mandible)),col="red")
  
predict(fit_mandible, newdata = cleaned_set, type = "response")

## multilevel regression
ggplot(df) + geom_bar(aes(x=mandible,fill=Urban.Rural))

ml_mandible <- stan_glmer(mandible ~ Age + Gender + Urban.Rural + Injury.Mech.category + 
                           (1+Urban.Rural|Injury.Mech.category), df, family = binomial, refresh=0)
