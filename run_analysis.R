#Preparing the environment...
library(data.table)
rm(list=ls())

#...and preparing the variables
test_set_file<-"./UCI HAR Dataset/test/X_test.txt"
test_labels_file<-"./UCI HAR Dataset/test/y_test.txt"
test_subject_file<-"./UCI HAR Dataset/test/subject_test.txt"
training_set_file<-"./UCI HAR Dataset/train/X_train.txt"
training_labels_file<-"./UCI HAR Dataset/train/y_train.txt"
training_subject_file<-"./UCI HAR Dataset/train/subject_train.txt"
features_file<-"./UCI HAR Dataset/features.txt"
activity_labels_file<-("./UCI HAR Dataset/activity_labels.txt")


#STEP 1: Merges the training and the test sets to create one data set.
test_set <- read.table(test_set_file, header=FALSE)
test_labels <- read.table(test_labels_file, header=FALSE)
test_subject <- read.table(test_subject_file, header=FALSE)
training_set <- read.table(training_set_file, header=FALSE)
training_labels <- read.table(training_labels_file, header=FALSE)
training_subject <- read.table(training_subject_file, header=FALSE)

obs_data_set <- rbind(training_set, test_set)
obs_labels <- rbind(training_labels, test_labels)
obs_subjects <- rbind(training_subject, test_subject)


#STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
feature_labels<-read.table(features_file, header=FALSE)
features_to_extract<-sort(c(grep("-mean\\(\\)",feature_labels[,2]),grep("-std\\(\\)",feature_labels[,2])))

obs_data_set<-obs_data_set[,features_to_extract]


#STEP 3: Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table(activity_labels_file, header=FALSE )

obs_labels<-merge(obs_labels, activity_labels, 1,1)


#STEP 4: Appropriately labels the data set with descriptive activity names
names(obs_data_set)<-feature_labels[features_to_extract,2]
names(obs_labels)<-c("Activity_Code","Activity_Label")
names(obs_subjects)<-c("Subject_Code")

observations<-cbind(obs_subjects,obs_labels, obs_data_set)


#STEP 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject
DT_Obs<-as.data.table(observations)
tidy_data<-DT_Obs[, lapply(.SD, mean, na.rm=TRUE), by=c("Subject_Code", "Activity_Label") ]


#Output tidy data
write.table(tidy_data, "tidy_data.txt", sep=",", quote=TRUE,row.names=FALSE)