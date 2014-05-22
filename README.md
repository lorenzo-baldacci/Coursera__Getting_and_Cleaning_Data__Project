###Coursera - Getting and Cleaning Data - Course Project
============================================

The repository holds the code requested for the Coursera Getting and Cleaning Data course project. 

The goal is to prepare tidy data that can be used for later analysis. One R script, named run_analysis.R, has been coded for performing the following steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

In order to run the code you should follow these steps:
1. Define a base path {base_path} you will set as your working directory within your R session.
2. Drop the run_analysis.R script into {base_path}
3. Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
4. Unzip the downloaded zip file within {base_path} keeping the folder structure. You should end up having a folder named "UCI HAR Dataset" within your {base_path}
5. Source the R script into your R session and get an output file named "tidy_data.txt" in your {base_path}