
Overview:
---------
Source of the original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full Description at the site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Details:
--------
The script run_analysis.R downloads original data sets, clean up the data, and create tinydata sets per project specification.

1. Creates "project"" folder
2. Downloads file from the following url into above project folder "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
3. Unzip above file. It creates a directory "UCI HAR Dataset" including training & test datasets, featurelist, activity labels
4. Reads (x, y, subject) datasets, featurelist and activity labels from "UCI HAR Dataset"
5. Merges the training & test datasets to create combined X, Y, subject datasets
6. Extracts only the measurements that pertain to the mean and standard deviation for each measurement
7. Reads activity_labels.txt and renames activity names to human readable activities
8. Labels the data set with descriptive names (names with underscores & empty brackets were converted)
9. Merges subject ID, activity label with the features and saves the result in tidyData.txt
10. Creates a second dataset with the subject ID, activity label, the average of each measurement for each activity and saves the result as averageData.txt

Variables
---------
xtest - test/X_test.txt, measurement data
xtrain - train/X_train.txt, measurement data
xdata - Combined data set of above two variables
ytest - test/y_test.txt, measurement data
ytrain - train/y_train.txt, measurement data
ydata - Combined data set of above two variables
subjtest - test/subject_test.txt, measurement data
subjtrain - train/subject_train.txt, measurement data
subjdata - Combined data set of above two variables
features - features.txt
filtfeatures - mean & STD deviation data columns derived from above features
activities - activity_labels.txt
tidyData - subsetted, human-readable data ready per project description
averageData - second tinydata set with average of each variable for each activity & subject

Output
------
tidyData.txt
1. 10299x68 data frame
2. First column contains subject ID
3. Second column contains activity name
4. Remaining 66 columns contain measurements

averageData.txt
1. 180x68 data frame
2. First column contains subject ID
3. Second column contains activity name
4. Average for each of the 66 attributes included in columns 3-68
