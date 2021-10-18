library(tidyverse)

mmc_data <- read.csv("1717262_Data_5.10.2021_deidentified.csv")

# Removing blank columns
mmc_data <- mmc_data[, -c(264:369)] 

# Removing blank row 319
mmc_data <- mmc_data[-c(319),]

## creating dummy variables for age.18 and age.89 variables
mmc_data$Age.18 <- ifelse(mmc_data$Age.18 == "*", 1, 0)
mmc_data$Age.89 <- ifelse(mmc_data$Age.89 == "*", 1, 0)

## replacing blank values in data with NA
mmc_data[mmc_data=="                       "] <- NA
mmc_data[mmc_data=="                        "] <- NA


##Converting the exiting ICD9 code to ICD10


##Replace NA with 0s in order to convert ICD9 codes to ICD10 codes
mmc_data <- sapply(mmc_data, as.character) 
mmc_data[is.na(mmc_data)] <- " "

mmc_data <- data.frame(mmc_data)

##For the ICD9.diagnosis.codes.1 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.2 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.2[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.2[i] = "S09.93XA"
  }
}

##For the ICD9.diagnosis.codes.4 column

for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.1[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.1[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.3 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.3[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.3[i] = "S09.93XA"
  }
}



##For the ICD9.diagnosis.codes.5 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.5[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.5[i] = "S09.93XA"
  }
}

##For the ICD9.diagnosis.codes.6 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.6[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.6[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.7 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.7[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.7[i] = "S09.93XA"
  }
}

##For the ICD9.diagnosis.codes.8 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.8[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.8[i] = "S09.93XA"
  }
}



##For the ICD9.diagnosis.codes.9 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.9[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.9[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.10 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.10[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.10[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.11 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.11[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.11[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.12 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.12[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.12[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.13 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.13[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.13[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.14 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.14[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.14[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.15 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.15[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.15[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.16 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.16[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.16[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.17 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.17[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.17[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.18 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.18[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.18[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.19 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.19[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.19[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.20 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.20[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.20[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.21 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.21[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.21[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.22 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.22[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.22[i] = "S09.93XA"
  }
}



##For the ICD9.diagnosis.codes.23 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.23[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.23[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.24 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.24[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.24[i] = "S09.93XA"
  }
}


##For the ICD9.diagnosis.codes.25 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.25[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.25[i] = "S09.93XA"
  }
}



##For the ICD9.diagnosis.codes.26 column
for (i in 1:length(mmc_data)) {
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 802.20){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S02.609A"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 802.30){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S02.69XB"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 802.40){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S02.400A"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 802.50){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S02.400B"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 802.80){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S02.42XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 873.63){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S02.5XXB"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 910.00){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S00.512A"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 920.00){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S00.93XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 959.01){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S09.90XA"
  }
  if(mmc_data$ICD9.diagnosis.codes.26[i] == 959.09){
    mmc_data$ICD10.diagnosis.codes.26[i] = "S09.93XA"
  }
}
