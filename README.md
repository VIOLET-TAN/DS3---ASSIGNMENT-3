# DS3---ASSIGNMENT-3

This repo was created for the assignment of Getting and Cleaning Data Coursera course.

* First, download and unzip the data file into your R working directory. There are two ways to unzip the zipped file from URLlink.
1st, click the link to download it and extract it to local folder.
2nd, coding to unzip the file and save it to local file like following
#> if (!file.exists("./UCI_HAR_Dataset")){
#+     
 # +     unzip(destFile)
#+     
#  + }
#> dateDownloaded <- date()
#

#> Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#> tail(sub_train)
#Error in tail(sub_train) : object 'sub_train' not found
#open sub_train, it is ㄱㄊ਱ㄱㄊ symbols, this is the reason not found because it it not table file.
 Use read.delim() to open the .txt data file
#> read.delim("./sub_train.txt")

* Second, download the R source code into your R working directory.

* Finally, execute R source code to generate tidy data file.


### Data description

The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording. variables in features are measured figure types, while in acitivity_label are activity types.


### Code explaination

The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

### New dataset

The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subject feature types.

## The code was written based on the instruction of this assignment

Starts with Reading all the data and data names into R environment.

Read variable names into R envrionment.

Read subject index into R environment.


1. Merges the training and the test sets to create one data set.

Use command rbind to combine training and test set
2. Extracts only the measurements on the mean and standard deviation for each measurement.

Use grep command to get column indexes for variable name contains "mean()" or "std()" 

3. Uses descriptive activity names to name the activities in the data set

Convert activity labels to characters and add a new column as factor

4. Appropriately labels the data set with descriptive variable names.

Give the selected descriptive names to variable columns

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package

