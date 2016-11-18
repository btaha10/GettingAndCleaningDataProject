
Getting and Cleaning Data Course Project

run_analysis.R

This R script creates a directory named "project" in which will downloaded zip file. Next it extract the underlying zip file into a folder called "UCI HAR Dataset" then performs the analysis on the data sets within, per the project assignment instructions:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script assumes "UCI HAR Dataset" has the following files & folders:
1. activity_labels.txt
2. features.txt
3. test/subject_test.txt x_test.txt y_test.txt
4. train/subject_train.txt X_train.txt y_train.txt

Two data sets are formed and saved into 2 files namely "tidyData.txt" and "averageData.txt".

TidyData.txt includes 10299 rows by 68 columns. Each row contains the subject, activity and measurements of all required features.
AverageData.txt includes 180 rows by 68 columns. Each row contains the subject, activity and measures the mean of all required features. 
