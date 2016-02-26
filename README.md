#Getting and Cleaning Data Course Project

The data files are in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The directory "UCI HAR Dataset" has test and train data.

##Main File run_analysis.R


This R script does the below:


1. Reads and stores the subject from the file subject_test.txt.


2. Reads and stores the features from the file features.txt, by 
	   transposing the rows to columns.

3. Read and build the X values from X_train.txt and X_test.txt. 
	 The columns are from the features data above which are either 
	 mean or std (Std Deviation) in their names.

4. Read and build the Y values from y_train.txt and y_test.txt.

5. Combine the subjects, Y data, and X data with cbind (Column bind)

6. Compute the means for (mean and std) columns 3-81 by calling 
	 aggregate function. The means are by Subject and Activity.

7. Set the Group namesi.

8. Write the final tidy data to "tidy_final_activity_data.csv".


###Details
