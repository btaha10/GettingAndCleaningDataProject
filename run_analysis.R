
# Getting and Cleaning data Project
# library package to run statistical analysis
library(plyr)

# download data sets source
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
projectDir <- "project"
if(!file.exists("./project")) {dir.create("./project")}
zFile <- "./project/dataset.zip"
download.file(url, zFile)
unzip(zFile, exdir = projectDir)

# Step 1
# Merge the training and test sets to create one data set
##########################################################################
xtrain <- read.table("project/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("project/UCI HAR Dataset/train/y_train.txt")
xtest <- read.table("project/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("project/UCI HAR Dataset/test/y_test.txt")
subjtrain <- read.table("project/UCI HAR Dataset/train/subject_train.txt")
subjtest <- read.table("project/UCI HAR Dataset/test/subject_test.txt")
# read 'x' data set
xdata <- rbind(xtrain, xtest)
# read 'y' data set
ydata <- rbind(ytrain, ytest)
# read 'subject' data set
subjdata <- rbind(subjtrain, subjtest)

# Step 2
# Extract only the measurements on the mean and standard deviation for 
# each measurement
##########################################################################
features <- read.table("project/UCI HAR Dataset/features.txt")
# filter out columns with mean() or std() in their names
filtfeatures <- grep("-(mean|std)\\(\\)", features[, 2])
xdata <- xdata[, filtfeatures]
# swap in the correct column names
names(xdata) <- features[filtfeatures, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set
##########################################################################
activities <- read.table("project/UCI HAR Dataset/activity_labels.txt")
# update values with correct activity names
ydata[, 1] <- activities[ydata[, 1], 2]

# Step 4
# Appropriately label the data set with descriptive variable names
##########################################################################
# Reword column name for descriptive clarification
names(xdata) <- gsub("-mean\\(\\)", "Mean", names(xdata))
names(xdata) <- gsub("-std\\(\\)", "StdDev", names(xdata))
names(xdata) <- gsub("^t", "Time", names(xdata))
names(xdata) <- gsub("^f", "Frequency", names(xdata))
names(xdata) <- gsub("-", "", names(xdata))
# add subject column name
names(subjdata) <- "subject"
# add activity column name
names(ydata) <- "activity"
# bind all data in one single data set
tidydata <- cbind(subjdata, ydata, xdata)
write.table(tidydata, "tidyData.txt", row.name=FALSE,  sep="\t")

# Step 5
# Create a second, independent tidy data set with the average of each
# variable for each activity and each subject
##########################################################################
# average all 68 columns but first two (subject & activity)
avgdata <- ddply(tidydata, .(subject, activity), function(x) colMeans(x[, 3:68]))
write.table(avgdata, "averageData.txt", row.name=FALSE,  sep="\t")

