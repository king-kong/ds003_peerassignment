Getting and Cleaning Data Project
========================================================

This assignment cleans the following dataset 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

***Steps

1.  Combine test and training data  
2.  Load X_test.txt combined version
3.  Read the features.txt to get column name, use the loaded values to label cset
4.  Filter only the columns with '-mean()' or '-std()'
5.  merge the labels
6.  added Activity label to cset
7.  add Subject
8.  summarize - mean of each variable by subject and activity


*** Code Book
*** Output Columns

1. Subject number (1-30)
2. Activity
3. Variable ('the measurement taken')
4. Mean of the Variable
