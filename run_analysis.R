ptm <- proc.time()

features <- read.table('./data/UCI HAR Dataset/features.txt', header=FALSE, col.names=c("feature_id","feature_name"))
features <- features[,2]

activities <- read.table('./data/UCI HAR Dataset/activity_labels.txt', header=FALSE, col.names=c("activity_id","activity_name"))
activities <- activities[,2]

columnWidths <- replicate(length(features), 16)

# get test data
testSubject <- read.table('./data/UCI HAR Dataset/test/subject_test.txt', header=FALSE, col.names=c("Subject"))
testActivity <- read.table('./data/UCI HAR Dataset/test/y_test.txt', header=FALSE, col.names=c("Activity"))
testTimeFrequency <- read.table('./data/UCI HAR Dataset/test/X_test.txt', header=FALSE, col.names=features, check.names=FALSE)
testData <- cbind(testSubject, type='TEST', testActivity, testTimeFrequency)
testData$Activity <- activities[testData$Activity]

# get training data
trainingSubject <- read.table('./data/UCI HAR Dataset/train/subject_train.txt', header=FALSE, col.names=c("Subject"))
trainingActivity <- read.csv('./data/UCI HAR Dataset/train/y_train.txt', header=FALSE, col.names=c("Activity"))
trainingTimeFrequency <- read.table('./data/UCI HAR Dataset/train/X_train.txt', col.names=features, check.names=FALSE)
trainingData <- cbind(trainingSubject, type='TRAINING', trainingActivity, trainingTimeFrequency)
trainingData$Activity <- activities[trainingData$Activity]

# combine test and training data
combinedData <- rbind(testData, trainingData)

# get a subset of mean and standard deviation columns
meanStdColumns <- c("Subject","Activity", grep("(mean|std)\\(\\)", names(combinedData), value=TRUE))
meanStdData <- combinedData[, meanStdColumns]

# tidy up variable column names
names(meanStdData) <- gsub("^t", "Time", names(meanStdData))
names(meanStdData) <- gsub("^f", "Frequency", names(meanStdData))
names(meanStdData) <- gsub("-mean\\(\\)", "Mean", names(meanStdData))
names(meanStdData) <- gsub("-std\\(\\)", "StdDev", names(meanStdData))
names(meanStdData) <- gsub("-", "", names(meanStdData))
names(meanStdData) <- gsub("BodyBody", "Body", names(meanStdData))

# get mean values for subject - activity pairs
library(reshape2)
melted <- melt(meanStdData, id.vars=c("Subject","Activity"))
tidyMeans <- dcast(melted, Subject+Activity ~ variable, mean)

# write file
write.table(tidyMeans, "./data/tidyMeans.txt", row.names=FALSE)

proc.time() - ptm
