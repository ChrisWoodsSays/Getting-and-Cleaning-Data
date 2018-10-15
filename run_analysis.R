# File
#   run_analysis.R
#
# Overview
#
#   Using the Human Activity Recognition Using Smartphones Data Set as input, this script
#   provides a:
#       - tidy data set, combining train and test data, with descriptive variable names and activity names
#           (tidy_human_activity.txt)

#       - summary of the above, with means by activity and subject
#           (tidy_human_activity_summary.txt)
#
#   See README.md for details.
#

library(readr)
library(dplyr)
setwd("/Users/Chris/Dropbox/Data Science/Coursera/3-Getting & Cleaning Data")

#######################
# 1. Download Zip Files
#######################

# download zip file containing data if it hasn't already been downloaded
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"
# zipFile will be unzipped to folder of same name less the .zip extension
dataDest <- gsub(".zip$", "", zipFile)

if (!file.exists(zipFile)) {
    download.file(zipUrl, zipFile, mode = "wb")
}

# unzip zip file containing data if data directory doesn't already exist
if (!file.exists(dataDest)) {
    unzip(zipFile)
}

#############################
# 2. Determine data locations
#############################

# Get File Names of SET, SUBJECT and ACTIVITY files to be merged
resultTypes <- c("test", "train")
setFilesForMerge <- lapply(resultTypes, function(resultType) {file.path(dataDest,resultType,paste0("X_",resultType,".txt"))})
subjectFilesForMerge <- lapply(resultTypes, function(resultType) {file.path(dataDest,resultType,paste0("subject_",resultType,".txt"))})
activityFilesForMerge <- lapply(resultTypes, function(resultType) {file.path(dataDest,resultType,paste0("y_",resultType,".txt"))})

########################################
# 3. Get Externally Defined Column Names
########################################

# Get Column Names for SET Files
columnNames <- fread(file.path(UCIPath,"features.txt"),
                     select = 2)$V2 # Name is in col 2 - don't need field number (col 1)
# Get column numbers that contain required terms so that we can select just those and then name them correctly
meanAndStdColumns <- grep("mean|std",columnNames)

# Remove special characters
columnNames <- gsub("[\\(\\)-]", "", columnNames)

# Expand abbreviations and clean up
columnNames <- gsub("mean", "Mean", columnNames)
columnNames <- gsub("std", "StandardDeviation", columnNames)
columnNames <- gsub("^f", "frequency", columnNames)
columnNames <- gsub("^t", "time", columnNames)
columnNames <- gsub("Acc", "Accelerometer", columnNames)
columnNames <- gsub("Gyro", "Gyroscope", columnNames)
columnNames <- gsub("Mag", "Magnitude", columnNames)
columnNames <- gsub("Freq", "Frequency", columnNames)
columnNames <- gsub("BodyBody", "Body", columnNames)

##################################
# 4. Get & Merge Train & Test Data
##################################

# Merge SET Data
mergedSetData <- 
    # Merge train and test data
    do.call(rbind,
            lapply(setFilesForMerge, function(fileForMerge) {
                read_table(fileForMerge,
                            col_names = FALSE)})) %>%

    # Get just Mean and Standard Variation columns
    # Do this by column number as exlcuded columns include duplicates
    select(meanAndStdColumns) %>%
    # Apply Column names
    setNames(columnNames[meanAndStdColumns]) 

# Merge SUBJECT Data
mergedSubjectData <- 
    # Merge train and test data
    do.call(rbind,
            lapply(subjectFilesForMerge, function(fileForMerge) {
                read_table2(fileForMerge,
                            col_names = FALSE)}))

# Name Subject Column
colnames(mergedSubjectData) <- "subject"

# Merge ACTIVITY Data
mergedActivityData <- 
    # Merge train and test data
    do.call(rbind,
            lapply(activityFilesForMerge, function(fileForMerge) {
                read_table2(fileForMerge,
                            col_names = FALSE)}))

# Name Activity Column
colnames(mergedActivityData) <- "activity"


# Get Activity Labels from Activity Labels file
activityLabels <- read.table(file.path(dataDest, "activity_labels.txt"),
           col.names = c("ID", "activityLabel"))

# Replace activity values with named factor levels
mergedActivityData$activity <- factor(mergedActivityData$activity, 
                                 levels = activityLabels[, 1], labels = activityLabels[, 2])

###########################################
# 5. Combine Set, Subject and Activity Data
###########################################

# Prefix Set Data with Subject and Columns
combinedData <- cbind(mergedSubjectData, mergedActivityData, mergedSetData)

# Remove unused tables to save memory
rm(mergedSubjectData, mergedActivityData, mergedSetData, activityLabels, columnNames, meanAndStdColumns)

#############################################################
# 6. Create Grouping by Subject with average of each variable
#############################################################

meansBySubject <-
    combinedData %>%
        group_by(activity, subject) %>%
        summarise_all(mean)

########################################
# 7. Write tidy data sets back to folder
########################################

write.table(combinedData, "tidy_human_activity.txt", 
            row.names = FALSE, 
            quote = FALSE)
write.table(meansBySubject, "combhuman_activity_summary.txt", 
            row.names = FALSE, 
            quote = FALSE)