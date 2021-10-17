## data cleaning, subsetting

source("~/Desktop/MSSP Consulting/G2-Consulting-Project/facial_zone_dummy.R")

rownames(mmc_data)

mmc_data <- mmc_data[-c(319),]

mmc_data$Age.18 <- ifelse(mmc_data$Age.18 == "*", 1, 0)
mmc_data$Age.89 <- ifelse(mmc_data$Age.89 == "*", 1, 0)

mmc_data[mmc_data=="                       "] <- NA
mmc_data[mmc_data=="                        "] <- NA

data.frame(colnames(mmc_data))

mmc_subset_ICD10 <-  mmc_data[c(264:266, 1:10, 48:80, 262)]

data.frame(colnames(mmc_subset_ICD10))


mmc_subset_ICD10 <- mmc_subset_ICD10[complete.cases(mmc_subset_ICD10$ICD10.diagnosis.codes.1),]

## ____________________

mmc_subset_ICD9_ICD10 <- mmc_data[c(264:266, 1:10, 22:80, 262)]





