### Introduction

This document describes the variables, the data, and work that I performed to clean up and merge the data. A lot of information in this document comes from the README.txt file in the dataset we are using.

We are using data from the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we are using the "Human Activity Recognition Using Smartphones Data Set":


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Human Activity Recognition Using Smartphones Data Set</a>

* <b>Description</b>: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

#### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Each record has:

- An identifier of the subject who carried out the experiment.
- Its activity label.
- A 561-feature vector with time and frequency domain variables. 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 


#### Data that we need

We load data from the following files of the dataset:

- 'features.txt': List of all 561 features.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': Training subjects.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': Test subjects.


#### Merging the Data that we loaded above:

- First we column bind the training labels(activities) and training subjects to the training data using cbind() function.

- Similarly we column bind the test labels(activities) and test subjects to the test data using cbind() function.

- Now we row bind the training data and test data to form one big data frame called fullData

- Finally, we add column names to fullData using the strings "Subject" and "Activity" appended to the feature names we loaded above. We also clean up the mistakes in the column names to make them descriptive.


#### Steps to tidy-up the data

Our goal here is to extract only the mean and standard deviation variables out of the 561 variables for each observation and then aggregate these variables using mean values for each subject and activity.

* First we identifying and extract only those variables that are either mean or std variables, along with the subject and activity variables.

* We call this data the we extracted from "fullData" as "msData".

* We then aggregate it by calculating the means of each variable for each Subject and Activity using the aggregate() function.

* We call this aggregated data frame "meanmsData", which is our final tidy data set.

#### Variables in the final tidy data set (finalData.txt file)

- Subject: Subject for which these measurement means correspond to

- Activity: Activity performed by the subject when these measurements were taken

- 79 Variables: The mean and std variables we extracted from the original data set, except that the values are now aggregated means and not the individual measurements.  