# Load needed packages
library(dplyr)
library(data.table)
library(tidyr)

# Check if file already exists
# Download and extract zip file
filename <- "UCI HAR Dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists(filename)) { 
  unzip(filename) 
}

# Merge training and test sets
## Read activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
## Read train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
## Read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
## Combine subjects, activity labels, and features into their respective datasets (train, test)
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
## Combine train and test sets into a complete dataset
fulldata <- rbind(train, test)

# Extract mean and standard deviation of each measurement
## Take mean, std, subject, activity columns
colnames <- c("subject", "activity", as.character(features$V2))
meanstdcols <- grep("subject|activity|[Mm]ean|std", colnames, value = FALSE)
subset <- fulldata[,meanstdcols]

# Use descriptive activity names
names(activity_labels) <- c("activitynum", "activityname")
subset$V1.1 <- activity_labels$activityname[subset$V1.1]

# Appropriately label the dataset with descriptive variable names
subsetnames <- colnames[meanstdcols]
subsetnames <- gsub("mean", "Mean", subsetnames)
subsetnames <- gsub("std", "Std", subsetnames)
subsetnames <- gsub("gravity", "Gravity", subsetnames)
subsetnames <- gsub("[[:punct:]]", "", subsetnames)
subsetnames <- gsub("^t", "Time", subsetnames)
subsetnames <- gsub("^f", "Frequency", subsetnames)
subsetnames <- gsub("Acc", "Accelerometer", subsetnames)
subsetnames <- gsub("Gyro", "Gyroscope", subsetnames)
subsetnames <- gsub("Mag", "Magnitude", subsetnames)
subsetnames <- gsub("BodyBody", "Body", subsetnames)
names(subset) <- subsetnames

# Creates a second independent tidy data set with the 
# average of each variable for each activity and each subject
tidydata <- subset %>%
  group_by(activity, subject) %>%
  summarise_all(funs(mean))

# Saving the data table into file
write.table(tidydata, "tidydata.txt", row.names = FALSE)


