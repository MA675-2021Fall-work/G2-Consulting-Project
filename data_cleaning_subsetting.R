source("cleaning_and_code_conversion.R")
source("facial_zone_dummy.R")

## data cleaning, subsetting

## creating first subset, only contains ICD10 code columns, with our Categorized column J
mmc_subset_ICD10 <-  mmc_data[c(1:9, 264:268, 48:80)]

mmc_subset_ICD10$sum_dummy <- mmc_subset_ICD10$otherff + mmc_subset_ICD10$mandible + mmc_subset_ICD10$superior + mmc_subset_ICD10$midface

mmc_subset_ICD10 <- subset(mmc_subset_ICD10, sum_dummy > 0)

mmc_subset_ICD10 <- mmc_subset_ICD10[, -c(48)]

#visualization_subset <- mmc_subset_ICD10[c(9:13,47)]

cleaned_set <- mmc_subset_ICD10[c(1:6, 9:14)]

cleaned_set$Injury.Mech.category[is.na(cleaned_set$Injury.Mech.category)] <- "Others"

write.csv(cleaned_set, "cleaned_set.csv", row.names = F)


# ____________________

## creating another subset which includes both the ICD9 and ICD10 code columns
#mmc_subset_ICD9_ICD10 <- mmc_data[c(1:9, 264:268, 22:80)]

## removing rows that do not have a value in ICD.9.diagnosis.code.1 variable
#mmc_subset_ICD9 <- mmc_data[c(1:9, 264:268, 22:47)]
#mmc_subset_ICD9$sum_dummy <- mmc_subset_ICD9$mandible + mmc_subset_ICD9$superior + mmc_subset_ICD9$midface
#mmc_subset_nonc_ICD9 <- subset(mmc_subset_ICD9, sum_dummy == 0)

#mmc_subset_ICD9 <- mmc_subset_ICD9[complete.cases(mmc_subset_ICD9_ICD10$ICD9.diagnosis.codes.1),]

## Creating test data frame to observe mechanisms vs category
#categories <- mmc_data[c(10, 8, 267)]

