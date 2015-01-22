##This script downloads, cleans, and tidies the data from the course project 
##for Getting and Cleaning Data (Johns Hopkins, Coursera)

##Download and timestamp data, create necessary directories,
##change working directory to match 

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./project_1"))
      dir.create("./project_1")
if (!file.exists("./project_1//smartactivity.zip"))
      download.file(fileURL, destfile="./project_1//smartactivity.zip", method="auto")
if (!file.exists("./project_1//smartactivity"))
      unzip(zipfile = "./project_1//smartactivity.zip", exdir = "./project_1")
dateDownloaded <- date()
setwd("./project_1/UCI HAR Dataset")

##Load necessary packages

library(plyr)
library(dplyr)


##Merge "training" and "test" data sets into a single large dataframe

activityData <- rbind(read.table("./test/X_test.txt", colClasses="numeric"),
                      read.table("./train/X_train.txt", colClasses="numeric"))


##Extract a new dataframe containing only the -std() and -mean() variables 
##using indices from the "features" data set 

features <- read.table("features.txt", stringsAsFactors=FALSE)
stdMeanIndex <- grep("std|mean[^F]", features$V2)
stdMeanData <- (select(activityData, (stdMeanIndex)))


##Attach "subject" and "y" (activity) data sets as columns of the dataframe 

subjects <- rbind(read.table("./test/subject_test.txt"),
                  read.table("./train/subject_train.txt"))
names(subjects) <- c("subject")
labels <- rbind(read.table("./test/y_test.txt"),
                read.table("./train/y_train.txt"))
names(labels) <- c("activity")
stdMeanData <- cbind(subjects, labels, stdMeanData)


##Standardize variable names from the "activity_labels" data set to 
##camelCase with extraneous characters removed and assign as names 
##to the "activity" variable

actLab <- read.table("activity_labels.txt")
stdMeanData$activity <- gsub('\\_(\\w?)', '\\U\\1', 
                              tolower(
                              mapvalues(stdMeanData$activity,
                                        from = c(1:6), 
                                        to = as.character(actLab$V2))),
                             perl=TRUE)


##Standardize variable names selected from the "features" data set to 
##camelCase with extraneous characters removed and assign as names
##to the columns of the data frame

cleanDesc <- gsub("-", "", gsub(".)", "",
                  gsub("mean", "Mean", gsub("std", "Std", 
                  gsub("BodyBody", "Body", 
                  grep("std|mean[^F]", features$V2, value=TRUE))))))
names(stdMeanData)[3:68] <- cleanDesc


##Calculate means for each variable by subject and activity in the data frame, 
##and create a new tidy data set (cleanAverages.txt)

tidyData <- aggregate(stdMeanData[,3:68],
                      list(subject = stdMeanData$subject, 
                           activity = stdMeanData$activity),
                      mean)
write.table(tidyData, "CleanAverages.txt", row.name=FALSE)