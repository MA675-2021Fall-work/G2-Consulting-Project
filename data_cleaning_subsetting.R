## data cleaning, subsetting

## Sourcing dummy variables file
source("~/Desktop/MSSP Consulting/G2-Consulting-Project/facial_zone_dummy.R")

## removing blank row from mmc_data
mmc_data <- mmc_data[-c(319),]

## creating dummy variables for age.18 and age.89 variables
mmc_data$Age.18 <- ifelse(mmc_data$Age.18 == "*", 1, 0)
mmc_data$Age.89 <- ifelse(mmc_data$Age.89 == "*", 1, 0)

## replacing blank values in data with NA
mmc_data[mmc_data=="                       "] <- NA
mmc_data[mmc_data=="                        "] <- NA

# ____________________

## creating first subset, only contains ICD10 code columns
mmc_subset_ICD10 <-  mmc_data[c(264:266, 1:10, 48:80, 262)]

## removing rows that do not have a value in the ICD10.diagnosis.code.1 variable
mmc_subset_ICD10 <- mmc_subset_ICD10[complete.cases(mmc_subset_ICD10$ICD10.diagnosis.codes.1),]

# ____________________

## creating another subset which includes both the ICD9 and ICD10 code columns
mmc_subset_ICD9_ICD10 <- mmc_data[c(264:266, 1:10, 22:80, 262)]





