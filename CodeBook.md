#tidy_data.txt: Code Book
=========================

The file tidy_data.txt contains data from different human activities retrieved from accelerometer and gyroscope 3-axial raw signals. This dataset has been obtained by the original dataset available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip where some transformations have been applied. 

The original data set contains the data and few files providing further info (README.txt) and detailed feature information (fature_info.txt).

THE DATASET (tidy_data.txt)
---------------------------
The file contains 35 observations and 69 variables:
1 Subject_Code - this variable is sourced by the original subject identifier (i.e. an identifier of the subject who carried out the experiment)
2 Activity_Label - this variable is sourced by the original class labels for the activities being considered (i.e. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
3 Activity_Code - this variable is sourced by the original activity identifier
from variable 4 to 69, please refer to the original data set file fature_info.txt for detailed information.

THE TRANSFORMATIONS
-------------------
The original dataset underwent the following steps in order to obtain the resulting dataset (tydy_data.txt)
1. training and test sets have been merged in order to create one data set.
2. only feature containing mean and standard deviation for each measurement have been kept. Any other feature has been dropped.
3. data has been summarized by activity and subject, each variable has then been averaged within each group.

