##Introduction

This repository and script fulfill the course project requirement of the Johns Hopkins "Getting and Cleaning Data" course on Coursera.

#Project requirements:
1. a script called run_analysis.R that
  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names. 
  * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
2. a code book called CodeBook.md that describes the data, variables, and any transformations or work performed to clean them up.
3. a README.md file that explains how the files work and how they are connected.

#Repo contents:
1. run_analysis.R -- downloads (if necessary) and processes data from the Human Activity Recognition Using Smartphones Dataset, Version 1.0 [1].
2. CodeBook.md -- describes data, variables, and the steps in run_analysis.R
3. README.md -- describes the overall project, gives instructions for running the script, discusses the programming choices I made, provides references.

##Running the script:

IMPORTANT: The script assumes that the user may not already have the necessary data or a dedicated folder for the project. Set your working directory to the folder where you want the project folder to be created, and the script will create, download, and unzip the necessary files. To run the script:

>source("run_analysis.R")

If you have already downloaded and unzipped the data: Set your working directory to the "UCI HAR Dataset" folder and use a program like RStudio to run the script from line 17.

The "cleanAverages.txt" file will be created in the "UCI HAR Dataset" directory. To access it:

>cleanAverages <- read.table("cleanAverages.txt", header=TRUE)
>view(cleanAverages)

##Discussion of programming:

1. "Wide" vs "narrow" data. Since the assignment said that both the wide and narrow forms of data were acceptable, I chose narrow because it seemed the most natural in context.

2. Selection of "mean variables". I chose not to include the meanFreq variables because they are part of the processing data from the original study, not means of actual measurements. Similarly, I chose not to include the *Mean variables that were noted as "for application to the angle() variable" in the "features_info.txt" file provided by the original researchers.

3. Variable names. I chose to use camelCase on the column variables. Although the capital letters mean that there are more opportunities for a missed uppercase letter to cause a bug, I think that with such similar variable names the trade-off in clarity is worth it. The activity labels are in camelCase for consistency across the data set.

##References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones