###DS3_CODE
##Download UCI data files from the web, unzip them, and specify time/date settings

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

destFile <- "CourseDataset.zip"

if (!file.exists(destFile)){
  
  download.file(URL, destfile = destFile, mode='wb')
  
}

if (!file.exists("./UCI_HAR_Dataset")){
  
  unzip(destFile)
  )
}
dateDownloaded <- date()

# read train data

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read data description

variable_names <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")


# 1. Merges the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total <- X_total[,selected_var[,1]]
# 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activity"

Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_total) <- variable_names[selected_var[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.

colnames(Sub_total) <- "subject"
total <- cbind(X_total, activitylabel, Sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE)
###



#> if (!file.exists("./UCI_HAR_Dataset")){
#+     
 # +     unzip(destFile)
#+     
#  + }
#> dateDownloaded <- date()
#> X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
#> Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
#> Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#> tail(sub_train)
#Error in tail(sub_train) : object 'sub_train' not found
#open sub_train, it is ㄱㄊ਱ㄱㄊ symbols, this is the reason not found.
#so does sub_test too. Use read.delim() to open the .txt data file
#> tidydata <- read.delim("./tidydata.txt")
#> makeCodebook(tidydata)
#Data report generation is finished. Please wait while your output file is being rendered.

#Is codebook_tidydata.docx open on your computer? Please close it as fast as possible to avoid problems! 
  
#  Warning message:
#  package 'pander' was built under R version 4.0.2 

#> head(X_test)
#V1          V2          V3        V4         V5         V6
#1 0.2571778 -0.02328523 -0.01465376 -0.938404 -0.9200908 -0.6676833
#V7         V8         V9        V10        V11       V12
#1 -0.9525011 -0.9252487 -0.6743022 -0.8940875 -0.5545772 -0.466223
#V13       V14       V15        V16        V17        V18
#1 0.7172085 0.6355024 0.7894967 -0.8777642 -0.9977661 -0.9984138
