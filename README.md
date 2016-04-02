My tidy Project
========================================================
The aim of this Coursera project is to clean and extract usable data from the dataset on 
the Human Activity Recognition Using Smartphones (HARUS) [1]. 
The dataset contain data on experiments carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person (SUBJECT) performed six ACTIVITIEs (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
_____________________________________________________________________________

The following computation have been done on the original dataset HARUS
a. The training and the test sets of HARUS experiment have been merged in a unic dataset.
b. Among the set of measurements considered by researchers only the mean and standard deviation have been selected 
   in the coursera project. 
c. The descriptive ACTIVITIES have been employed to name the activities in the data set obtained in step b.
d. The original labels have been substitutes with their descriptive variable names. The labels not clear have been
   modified
e. Finally a tidy data set with the average of each variable for each ACTIVITIE and each SUBJECT have been generated.

The repo tozzitidy includes the following files:
1. 'tidy.txt': the tidy data set in txt format: file
2. 'features_info.txt': original file containing information about the variables used.
3. 'run_analysis.R': the R script to generate the tidy.txt
4. 'oldnew.names.txt': It containes the old (HARUS) and new labels (Coursera Project). 
______________________________________________________________________________

[1] Human Activity Recognition Using Smartphones (version 1.0). Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws
www.smartlab.ws 



