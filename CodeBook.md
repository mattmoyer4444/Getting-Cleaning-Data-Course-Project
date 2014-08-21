## CodeBook - tidy.txt

The goal is to prepare tidy data that can be used for later analysis.

### Variables

   ID of the subject (30 subjects)
   Activity label :
        Walking,
        Walking Upstairs,
        Walking Downstairs,
        Sitting,
        Standing,
        Laying
   Mean and standard deviation of measurements from :
        Accelerometer (units : g),
        Gyroscope (units : radians/second)

### Getting and cleaning data

The data for the project is available at :
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made available here:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	
The dataset used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script run_analysis.R does the following:
	
Note: Please set the working directory where you would like to place the data. 
Relative paths are used in the script and will use the current working directory as the base path.

- Creates the necessary file structure to hold the data (./human_activity_data/)
- Downloads the data zip file from the internet
- Unzips the file into ./human_activity_data/UCI HAR Dataset/
- Build a data set for the Activities
- Build a data set for the Measurements
- Build a data set for the Subjects
- Merge data (Subjects, Activities and Measurements)
- Extract only the measurements for the mean and standard deviation
- Create an aggregate data set (mean)
- Write output files

- Additional package required : No

By merging the train and test data set, we get 10,299 rows and 563 variables (561
measurements, activity labels and subject identifier).

After extracting the mean and standard deviation of the measurements, the number of
variable is reduced to 68 (33 means of measurements, 33 standard deviations of
measurements, activity labels and subject identifier).

By aggregating by subject and activities, the final data set has 180 rows (30 subjects
and 6 activities) and 68 variables.

One file is produced:

   * tidy.txt : Aggregate using mean for each activity and each subject
                     (180 rows by 68 variables).

### Experimental study design used

The description of the experimental study design is available at :

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones