##
## Getting and Cleaning Data Peer Assignment
##    -> gets and clean data from folder "UCI HAR Datatset"
##
library(knitr)
library(plyr)

## 1) Combine test and training data  
##  removded

## 2) Load X_test.txt combined version
cset <- rbind(read.table(file="UCI HAR Dataset/train/X_train.txt"), read.table(file="UCI HAR Dataset/test/X_test.txt")) 
label <- rbind(read.table(file="UCI HAR Dataset/train/y_train.txt"), read.table(file="UCI HAR Dataset/test/y_test.txt")) 
subjects <- rbind(read.table(file="UCI HAR Dataset/train/subject_train.txt"), read.table(file="UCI HAR Dataset/test/subject_test.txt")) 

## 3) Read the features.txt to get column name, use the loaded values to label cset
cnames <- read.table('UCI HAR Dataset/features.txt')
colnames(cset) <- cnames[2][[1]]

## 4) Filter only the columns with '-mean()' or '-std()'
cset_mean_only <- cset[,grep('(-mean[(][)])|(-std[(][)])', names(cset))]

## 5) merge the labels
label_values <- read.table('~/datascience/ds-003/week3/UCI HAR Dataset/activity_labels.txt')
labels_merged <- merge(labels, label_values, by.x="V1", by.y="V1", all=TRUE)

## 6) added label to cset
cset_mean_only["Activity"] <- labels_merged[2][[1]]

## 7) add subject
cset_mean_only["Subjects"] <- subjects[1][[1]]

## 8) summarize - mean of each variable by subject and activity
library(reshape2)
library(plyr)
m <- melt(cset_mean_only, id=c('Subjects','Activity'))
result <- ddply(m, c('Subjects', 'Activity', 'variable'), summarize, mean = mean(value))
write.table(result, file="./result.txt", sep="\t", row.names=FALSE)

result
