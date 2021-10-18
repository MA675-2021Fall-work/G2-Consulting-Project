source("cleaning_and_code_conversion.R")
source("facial_zone_dummy.R")

## data cleaning, subsetting

## creating first subset, only contains ICD10 code columns, with our Categorized column J
mmc_subset_ICD10 <-  mmc_data[c(1:9, 264:267, 48:80, 262)]

## removing rows that do not have a value in the ICD10.diagnosis.code.1 variable
mmc_subset_ICD10 <- mmc_subset_ICD10[complete.cases(mmc_subset_ICD10$ICD10.diagnosis.codes.1),]

# ____________________

## creating another subset which includes both the ICD9 and ICD10 code columns
mmc_subset_ICD9_ICD10 <- mmc_data[c(1:9, 264:267, 22:80, 262)]

## removing rows that do not have a value in ICD.9.diagnosis.code.1 variable
mmc_subset_ICD9 <- mmc_data[c(1:9, 264:267, 22:47, 262)]
mmc_subset_ICD9 <- mmc_subset_ICD9[complete.cases(mmc_subset_ICD9_ICD10$ICD9.diagnosis.codes.1),]

## Creating test data frame to observe mechanisms vs category
categories <- mmc_data[c(10, 8, 267)]



