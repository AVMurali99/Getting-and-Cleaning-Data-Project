
# Reading in the data required from files 

trData <- read.table("C:/Users/ASHA/Desktop/Coursera/UCI HAR Dataset/train/X_train.txt")
trLabels <- read.table("C:/Users/ASHA/Desktop/Coursera/UCI HAR Dataset/train/y_train.txt")
trSubjects <- read.table("C:/Users/ASHA/Desktop/Coursera/UCI HAR Dataset/train/subject_train.txt")
testData <- read.table("C:/Users/ASHA/Desktop/Coursera/UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("C:/Users/ASHA/Desktop/Coursera/UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("C:/Users/ASHA/Desktop/Coursera/UCI HAR Dataset/test/subject_test.txt")
features <- read.table("C:/Users/ASHA/Desktop/Coursera/UCI HAR Dataset/features.txt")

# Binding the activities and subjects to the test data
testData <- cbind(testLabels,testData) 
testData <- cbind(testSubjects,testData) 

# Binding the activities and subjects to the training data
trData <- cbind(trLabels,trData) 
trData <- cbind(trSubjects,trData)

# Combining the test data and training data into one data frame called fullData
fullData <- rbind(trData, testData)

# Adding the column names to fullData and cleaning up the mistakes in the column names 
fullFeatures <- c("Subject", "Activity", as.character(features$V2))
fullFeatures <- sub("BodyBody","Body", fullFeatures)
names(fullData) <- fullFeatures

# Identifying the columns that have mean and std data and picking only those 
# columns into another data frame called msData
wantedFeat <- grep("mean()|std()", fullFeatures)
newFeat <- c(1,2)
newFeat <- as.integer(newFeat)
wantFeatures <- c(newFeat, wantedFeat)
msData <- fullData[,wantFeatures]

# Making the Activity column a factor variable and adding appropriate labels
msData$Activity <- factor(msData$Activity, levels = c(1,2,3,4,5,6), 
                          labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", 
                                     "Sitting", "Standing", "Laying"))

# Aggregating this new data frame by calculating the means for each Subject and Activity
# and storing it in another data frame and then ordering it by Subject 
meanmsData <- aggregate(.~Subject+Activity, msData, mean)
meanmsData <- meanmsData[order(meanmsData$Subject, meanmsData$Activity),]

# Writing this Tidy data into a new file that will be submitted
write.table(meanmsData, file = "finalData.txt", row.names = FALSE)