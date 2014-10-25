setwd("~/Documents/Coursera/Johns Hopkins Data Science Track/Getting and Cleaning Data")
features <- read.table('./data/UCI HAR Dataset/features.txt', header=FALSE, col.names=c("feature_id","feature_name"))
features <- features[,2]

activities <- read.table('./data/UCI HAR Dataset/activity_labels.txt', header=FALSE, col.names=c("activity_id","activity_name"))
activities <- activities[,2]

columnWidths <- replicate(length(features), 16)

testSubject <- read.table('./data/UCI HAR Dataset/test/subject_test.txt', header=FALSE, col.names=c("subject"))
testActivity <- read.table('./data/UCI HAR Dataset/test/y_test.txt', header=FALSE, col.names=c("activity"))
testTimeFrequency <- read.table('./data/UCI HAR Dataset/test/X_test.txt', header=FALSE, col.names=features)
testData <- cbind(testSubject, type='TEST', testActivity, testTimeFrequency)
testData$activity <- activities[testData$activity]

trainingSubject <- read.table('./data/UCI HAR Dataset/train/subject_train.txt', header=FALSE, col.names=c("subject"))
trainingActivity <- read.csv('./data/UCI HAR Dataset/train/y_train.txt', header=FALSE, col.names=c("activity"))
trainingTimeFrequency <- read.table('./data/UCI HAR Dataset/train/X_train.txt', col.names=features)
trainingData <- cbind(trainingSubject, type='TRAINING', trainingActivity, trainingTimeFrequency)
trainingData$activity <- activities[trainingData$activity]

combinedData <- rbind(testData, trainingData)

meanStdColumns <- c("subject","type","activity", grep("std|mean", names(combinedData), value=TRUE))
meanStdData <- combinedData[, meanStdColumns]



