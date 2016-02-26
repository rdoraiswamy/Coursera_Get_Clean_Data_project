#Assignment: Getting and Cleaning Data Course Project
setwd("/Users/rdoraiswamy/Downloads");

rm(list = ls());

#Read the subjects
#Read X values for test and train
read_subjects <- function()
{
  #Read test data
  dt1 <- read.table("./UCI HAR Dataset/test/subject_test.txt");
  #Read train data
  dt2 <- read.table("./UCI HAR Dataset/train/subject_train.txt");
  #Merge test and train
  Subjs <- rbind(dt1, dt2);
  names(Subjs) <- "Subjects"; #Set the names
  dim(Subjs);
  Subjs; # Return the subject Array
}


#Read the feature values
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, col.names=c('id', 'name'));
dim(features);

#Transpose the column names (only variable 2) so that we can pass the column names to the final table
new_cols <- t(features$name);
dim(new_cols);

#Read X values for test and train
read_x_data <- function()
{
  #Read test data
  dt1 <- read.table("./UCI HAR Dataset/test/X_test.txt");
  #Read train data
  dt2 <- read.table("./UCI HAR Dataset/train/X_train.txt");
  #Merge test and train
  Xtot <- rbind(dt1, dt2);
  dim(Xtot);

  #set the column name as the value form new_cols
  colnames(Xtot) <- new_cols;

  #Extract columns that have a mean or std in the name
  col_std_means <- grep("mean|std", colnames(Xtot));
  Xmean_std_vars <- Xtot[, col_std_means]; # Get the selected column values
  head(Xmean_std_vars);
  names(Xmean_std_vars) <- features[features$id %in% col_std_means, 2] ; #Get the names of the features
  Xmean_std_vars; #Return the array
}

#Read Y values for test and train
read_y_data <- function()
{
  #Read test data
  dt1 <- read.table("./UCI HAR Dataset/test/y_test.txt");
  #Read train data
  dt2 <- read.table("./UCI HAR Dataset/train/y_train.txt");
  #Merge test and train
  Ytot <- rbind(dt1, dt2);
  table(Ytot);
  Ytot; # Return the subject ids
}

# Get activity names to name the activities in the data set
act_names <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c('id', 'name'), header = FALSE);
act_names;

subjects <- read_subjects();
x_data <- read_x_data();
y_data <- read_y_data();

#set the data set with descriptive activity names
y_data[,1] <- act_names[y_data[,1],2] ;
names(y_data) <- "Activity";
complete_dataset <- cbind(subjects, y_data, x_data);
write.csv(complete_dataset, "./complete_activity_with_names.csv");

#Now build the tidy data set elements
# We will skip the first 2 columns
activ_array <- complete_dataset[,3:ncol(complete_dataset)];
#Let us compute the mean by calling the aggregate by subject and activity
activ_means <- aggregate(activ_array
                         , list(complete_dataset$Subjects, complete_dataset$Activity)
                         , mean);

#Replace the activ_means' Group.1 and Group.2 names with actual names
names(activ_means)[1:2] <- c("Subject", "Activity");
#Let us write the final Tidy data
write.csv(activ_means, "./tidy_final_activity_data.csv");
