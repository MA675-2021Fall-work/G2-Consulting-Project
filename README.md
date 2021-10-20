# G2-Consulting-Project

# Background review:

The study population will include patients that were evaluated and treated at Maine Medical Center between January 1 2016-December 31, 2020 following facial trauma withICD9 diagnosis codes 802-802.9 and ICD10 diagnosis codes containing S02 (except S02.0 and S02.11). 

# Major reasons for data cleaning for this project:

1. For ICD codes: The major differences between the two coding systems include the number of characters involved. ICD-9 has up to five characters while ICD-10 has up to seven. ICD-10 adds laterality to the coding system, which ICD-9 lacks. ICD-10 offers much more specificity, including episode of care, body area, etc. Also, the ICD-10 coding structure utilizes a dummy placeholder, which ICD-9 does not. Because the clients plan to analyze the injury area differences in facial trauma patients in urban and rural settings. Transformation of ICD codes is very important. 

2. For cause of injury(Injury mechanism): From the data screening provided by the client, we found that there are 10 levels for injury mech in the dataset and some of them are same at some content, for example, there are several mechanism are falls but with different falling height. We need to categoried them in order to tidy the dataset for further use.

# The first step: Data cleaning

Firstly, we created a github repository under the orgnazation of MA675 works in order to do the project more efficiently. Every time we made some update for the codes, we will commit and push to this repository with what we've done in the descriptions. 

When it comes to data cleaning. We followed the instruction the clients gave us and put some of our understanding in it to select the variables for visualization.


1. ICD Code transformation
   Among 318 patients, 158 of them are recorded with ICD 9, while 160 takes ICD 10. When the client tried to convert ICD 9 code into ICD 10 code. He encounted two major problems: 
   A) Not Convertable: 75 out of 432 ICD 9 code can not be converted to ICD 10 code.
   B) Multiple Converted: 143 of the ICD 9 codes can be converted into multiple ICD 10 codes.
   
   In order to solve these two major problem. We plan to solve B first. After solving B, we can drop the codes mentioned in A and only leave the useful observations for further analysis.
   
   To solve problem B, we first let all the missing values to be blank. And use for loops for each ICD9 code column, when the ICD9 column has the code that can be converted to useful ICD10 codes, then we assign the converted ICD10 codes to the corresponding ICD10 code column. However, we found a more efficient way is design a function to do so, we will improve our codes after.


2. Categorization of codes (ICD10)
