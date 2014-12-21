### Introduction

This document explains the run_analysis.R script step by step.

We are using data from the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we are using the "Human Activity Recognition Using Smartphones Data Set":


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Human Activity Recognition Using Smartphones Data Set</a>

* <b>Description</b>: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.



#### Loading the data

After the files have been downloaded from the above link, We load the data from these files into R using read.table().

* First we load the training data which has 7352 observations and values for 561 features(variables), then we load the training labels(activities) corresponding to the observations in training data. Finally we load the training subjects corresponding to the observations in training data.

* Similarly we load the test data which has 2947 observations and values for 561 features(variables), then we load the test labels(activities) corresponding to the observations in test data. Finally we load  the test subjects corresponding to the observations in test data.

* Finally we load the names of the 561 features(variables).


#### Merging the Data

Our goal here is simply to merge the data loaded from different files in to one big dataframe so we can work easily.

* First we column bind the training labels(activities) and training subjects to the training data using cbind() function.

* Similarly we column bind the test labels(activities) and test subjects to the test data using cbind() function.

* Now we row bind the training data and test data to form one big data frame called fullData

* Finally, we add column names to fullData using the strings "subject" and "Activity" appended to the feature names vector we loaded above. We also clean up the mistakes in the column names to make them descriptive.


#### Extracting only the mean and standard deviation measurements. 

Our goal here is to extract only the mean and standard deviation variables out of the 561 variables for each observation.

* First we identifying the columns (indices) in fullData that have the strings "mean()" or "std()" as part of the column names and call this list as "wantedFeat"

* Next, we add the indices 1 and 2 to the above list to get the "Subject" and "Activities" columns

* Finally we subset the fullData using the above column indices and assigning it to a data frame called msData


#### Giving descriptive activity names to the activities in the data set

* This we achieve by making the "Activity" column a factor variable and add appropriate labels for each activity using the description provided along with the dataset. 


#### Appropriately label the data set with descriptive variable names

* We completed this already in the merging part when we gave the column names using features data we loaded.


####  Create a tidy data set with averages of each variable for each activity and each subject

* We achieve this by aggregating the msData data frame by calculating the means of each variable for each Subject and Activity using the aggregate() function.

* We call this aggregated data frame "meanmsData"

* Finally, we write this data frame "meanmsData" to the file "finalData.txt" which will be submitted as the final output for this script.

