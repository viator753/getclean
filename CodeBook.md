##Overview

The run_analysis.R script uses a data set from the Human Activity Recognition Using Smartphones Dataset, Version 1.0. See README.md for full citation and link to the original data set.

This script produces a clean and tidy data set which shows the means (calculated by subject and activity) of the standard deviation and mean variables calculated by the original researchers.

The original data set consists of:

>'train/X_train.txt': Training set. <br>
>'train/y_train.txt': Training [class] labels.<br>
>'test/X_test.txt': Test set.<br>
>'test/y_test.txt': Test [class] labels.<br>
>'activity_labels.txt': Links the class labels with their activity name.<br>
>'train/subject_train.txt': Identifies the subject who performed the activity. Its range is from 1 to 30. [Also 'test/subject_test.txt']<br>
>'features.txt': List of all features [variables calculated from raw measurements].<br>

##Description of script
####Preliminary steps

1. From user's working directory, checks for project directory and data.
2. Creates project directory and downloads/unzips data if necessary.
3. Changes working directory to project directory for the remainder of script.

####Data cleaning and transformations applied

1. Merges "training" and "test" data sets into a single large dataframe.
2. Extracts a new dataframe containing only the -std() and -mean() variables from the results of Step 1 using indices from the "features" data set.
3. Attaches "subject" and "y" (activity) data sets as columns of the data frame from Step 2.
4. Standardizes variable names from the "activity_labels" data set to camelCase with extraneous characters removed, then assigns as names to the "activity" variable in the data frame from Step 3.
5. Standardizes variable names selected from the "features" data set to camelCase with extraneous characters removed, then assigns to the columns of the data frame from Step 4.
6. Calculates means for each variable by subject and activity in the data frame from Step 5, and creates a new tidy data set (cleanAverages.txt) from this information.

##Variables

1. "subject" -- number assigned to study participent; 1:30             
2. "activity" -- descriptor for activity measured           
  - "walking"
  - "walkingUpstairs"
  - "walkingDownstairs"
  - "sitting"
  - "standing"
  - "laying"
3. "tBodyAccMeanX"        
4. "tBodyAccMeanY"       
5. "tBodyAccMeanZ"        
6. "tBodyAccStdX"        
7. "tBodyAccStdY"         
8. "tBodyAccStdZ"        
9. "tGravityAccMeanX"     
10. "tGravityAccMeanY"    
11. "tGravityAccMeanZ"     
12. "tGravityAccStdX"     
13. "tGravityAccStdY"      
14. "tGravityAccStdZ"     
15. "tBodyAccJerkMeanX"    
16. "tBodyAccJerkMeanY"   
17. "tBodyAccJerkMeanZ"    
18. "tBodyAccJerkStdX"    
19. "tBodyAccJerkStdY"     
20. "tBodyAccJerkStdZ"    
21. "tBodyGyroMeanX"       
22. "tBodyGyroMeanY"      
23. "tBodyGyroMeanZ"       
24. "tBodyGyroStdX"       
25. "tBodyGyroStdY"        
26. "tBodyGyroStdZ"       
27. "tBodyGyroJerkMeanX"   
28. "tBodyGyroJerkMeanY"  
29. "tBodyGyroJerkMeanZ"   
30. "tBodyGyroJerkStdX"   
31. "tBodyGyroJerkStdY"    
32. "tBodyGyroJerkStdZ"   
33. "tBodyAccMagMean"      
34. "tBodyAccMagStd"      
35. "tGravityAccMagMean"   
36. "tGravityAccMagStd"   
37. "tBodyAccJerkMagMean"  
38. "tBodyAccJerkMagStd"  
39. "tBodyGyroMagMean"     
40. "tBodyGyroMagStd"     
41. "tBodyGyroJerkMagMean" 
42. "tBodyGyroJerkMagStd" 
43. "fBodyAccMeanX"        
44. "fBodyAccMeanY"       
45. "fBodyAccMeanZ"        
46. "fBodyAccStdX"        
47. "fBodyAccStdY"         
48. "fBodyAccStdZ"        
49. "fBodyAccJerkMeanX"    
50. "fBodyAccJerkMeanY"   
51. "fBodyAccJerkMeanZ"    
52. "fBodyAccJerkStdX"    
53. "fBodyAccJerkStdY"     
54. "fBodyAccJerkStdZ"    
55. "fBodyGyroMeanX"       
56. "fBodyGyroMeanY"      
57. "fBodyGyroMeanZ"       
58. "fBodyGyroStdX"       
59. "fBodyGyroStdY"        
60. "fBodyGyroStdZ"       
61. "fBodyAccMagMean"      
62. "fBodyAccMagStd"      
63. "fBodyAccJerkMagMean"  
64. "fBodyAccJerkMagStd"  
65. "fBodyGyroMagMean"    
66. "fBodyGyroMagStd"
67. "fBodyGyroJerkMagMean" 
68. "fBodyGyroJerkMagStd"

####Notes:

t- indicates a time measurement<br>
f- indicates a frequency measurement<br>
-X,-Y, and -Z indicate the tri-axial direction of the measurement<br>
