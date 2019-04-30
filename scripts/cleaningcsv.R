library(tidyverse)
##Reading the file file 
a <- "X:/Hayks_Materials/Genetics of DSD/Exome/Gene Lists/DSD_Draft_terms.csv"
r1<- read.csv(a)
###Getting the dataset to clean
terms <- as.character(r1$Terms)
###trimming leading and trailing white spaces per cell.
###example " A gene", would be changed to "A gene"
r1$Terms <- str_trim(terms)
###trimming extra spaces between the words in a cell.
###example "A  gene", would be changed to "A gene"
###Note: str_squish() can perform the two functions together.
### So str_aquish() would change " A  gene", would be changed to "A gene"
r1$Terms <- str_squish(terms)
###Changing the transformed values to characters
r1$Terms <- as.character(r1$Terms)
###Writing them out as csv files
write.table(r1, "X:/Hayks_Materials/Genetics of DSD/Exome/Gene Lists/DSD_Draft_terms_cleaned.csv", row.names = FALSE)

