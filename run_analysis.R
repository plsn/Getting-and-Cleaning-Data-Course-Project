#Step 1: Merges the training and the test sets to create one data set.

setwd("C:/Users/User/datasciencecoursera/UCI HAR Dataset")

xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt")
subjectTrain <- read.table("./train/subject_train.txt")

xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")

#create combined "x" related data set
xAll <- rbind(xTrain, xTest)

#create combined "y" related data set
yAll <- rbind(yTrain, yTest)

#create combined "subject" related data set
subjectAll <- rbind(subjectTrain, subjectTest)


#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")

#Extract only columns having mean() or std() in their column names
features_mean_std <- grep("-(mean|std)\\(\\)", features[ , 2])

#Subsetting xAll to contain only mean() or std() in the column names
xAll <- xAll[ , features_mean_std]

#Assign proper column names
names(xAll) <- features[features_mean_std, 2]


#Step 3: Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

#Assign the numbers in yAll to their respective activity names
yAll[ , 1] <- activities[yAll[ , 1], 2]

#Assign proper column name 
names(yAll) <- "activity"


#Step 4: Appropriately labels the data set with descriptive variable names. 

#Assign a proper column name to subjectAll
names(subjectAll) <- "subject"

#Column bind all the data into one big single data set
dataAll <- cbind(xAll, yAll, subjectAll)


#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)

#Average of each variable for each activity and each subject
tidyData <- ddply(dataAll, .(subject, activity), numcolwise(mean))

#Export the tidy data set
write.table(tidyData, "./tidyData.txt", row.name=FALSE)
