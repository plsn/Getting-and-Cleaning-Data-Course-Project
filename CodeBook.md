# Introduction

The R script called "run_analysis.R" does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Variables
* xTrain, yTrain, subjectTrain, xTest, yTest, subjectTest reads (via read.table function) the data from the respective files in UCR HAR Dataset.
* xData, yData, subjectData combine the rows of training and test data sets.
* "features" contain the proper column names for the xData combined data set only for column names containing mean() or std()
* Assign the numbers in yData to their respective activity names and the assign proper column name 
* Column bind all the data into one big single data set
* tidyData contain the average of each variable for each activity => A second independent tidy data set