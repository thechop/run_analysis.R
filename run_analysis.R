library(reshape2)

# Load all of the needed data into frames
testFrame <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabelFrame <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubjectFrame <- read.table("./UCI HAR Dataset/test/subject_test.txt")

trainFrame <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabelFrame <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubjectFrame <- read.table("./UCI HAR Dataset/train/subject_train.txt")

activityLabelFrame <- read.table("./UCI HAR Dataset/activity_labels.txt")
featuresFrame <- read.table("./UCI HAR Dataset/features.txt")

# Merge the test and training labels and convert to names
mergedLabelFrame <- rbind(testLabelFrame, trainLabelFrame)
mergedLabels <- merge(mergedLabelFrame, activityLabelFrame, by=1)[,2]

# Merge the test and training subjects and set the column name
mergedSubjectFrame <- rbind(testSubjectFrame, trainSubjectFrame)

# Merge the test and training data and set the features as the column headings
mergedFrame <- rbind(testFrame, trainFrame)
colnames(mergedFrame) <- featuresFrame[,2]

# Add the subject and label columns and name them, also merge the data
mergedFrame <- cbind(mergedSubjectFrame, mergedLabels, mergedFrame)
colnames(mergedFrame)[1] <- "subject"
colnames(mergedFrame)[2] <- "activity"

# Extract the column names which have "-std()" or "-mean()" but leave the first 2 columns
validColIndexes <- grep("-std\\(\\)|-mean\\(\\)", colnames(mergedFrame))
mergedFrame <- mergedFrame[c(1, 2,validColIndexes)]

meltedFrame = melt(mergedFrame, id.var = c("subject", "activity"))
means = dcast(meltedFrame , subject + activity ~ variable, mean)

write.table(means, "UCI_means.txt", row.names = FALSE)

# Clean up data that isn't used anymore
rm(testFrame, trainFrame, activityLabelFrame, featuresFrame, means, meltedFrame,
   mergedFrame, mergedLabelFrame, mergedSubjectFrame, testLabelFrame, testSubjectFrame,
   trainLabelFrame, trainSubjectFrame, mergedLabels, validColIndexes)

