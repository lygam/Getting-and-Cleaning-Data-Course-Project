# Getting and Cleaning Data Course Project
This repository contains the R script and documentation in partial fulfillment of requirements for Data Science Specialization Course 3: Getting &amp; Cleaning Data, offered by Johns Hopkins University through Coursera.

## Overview
The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Source Data
A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained. Moreover, the data for the project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Contents
`CodeBook.md` describes the variables, the data and any transformations or work performed to clean up the data.  

`run_analysis.R` is an R script that performs the following steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each actvity and each subject.

`tidydata.txt` is the output of the final step from above.
