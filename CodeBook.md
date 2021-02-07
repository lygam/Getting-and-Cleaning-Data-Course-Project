# Getting and Cleaning Data Course Project
This code book describes the variables, the data and any transformations or work performed to clean up the given data.

## Source Data
A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained. 
Moreover, the data for the project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## R Script
### Preparation
The assigned file was downloaded into the set working directory and unzipped. 
Relevant packages were also loaded.
### Merging Training and Test Sets
The following text files from the archive file were imported individually:
* `features.txt`
* `activity_labels.txt`
* `subject_train.txt`
* `X_train.txt`
* `y_train.txt`
* `subject_test.txt`
* `X_test.txt`
* `y_test.txt`

Applicable files were then merged into their respective sets (*train* and *test*), both of which were merged into one full data set.
The `features.txt` and `activity_labels.txt` files were used for a later step.
### Extracting Mean and Standard Deviation
Mean and standard deviation columns were taken, as well as subject and activity columns with the aid of `features`. 
These were all stored in `subset`.
### Using Descriptive Activity Names
Indexing was utilized to apply activity names to respective activity numbers through information from `activity_labels.txt`.
### Appropriately Labelling Data Set
The *gsub* function was used to clean up the column names in the reduced data set, called `subset`.
### Creating an Independent Tidy Data Set
A new table, `tidydata.txt`, was created which contains the average variable for each activity and each subject.
