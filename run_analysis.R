# project for peer assessment by Matt Moyer

# the working directory should be set by the user

# create the directory structure
if(!file.exists("activity_data"))
{dir.create("activity_data")}

fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# download data file
download.file(fileUrl1, destfile="./human_activity_data/human_activity_data.zip", mode="wb")

# unzip files
unzip("./human_activity_data/human_activity_data.zip", overwrite = TRUE, exdir = "./human_activity_data", unzip = "internal")


setwd("./human_activity_data/")

getwd()


y_train <- read.csv("UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
y_test <- read.csv("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
activity_label <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
x_train <- read.table ("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
x_test <- read.table ("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
var_label <- read.csv("UCI HAR Dataset/features.txt", sep = "", header = FALSE)
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)

# Build a data set for the Activities
y <- rbind(y_train,y_test)
colnames(y) <- c("ID")
colnames(activity_label) <- c("ID", "Activities")
ylabel <- data.frame(activity_label[y$ID, "Activities"])
colnames(ylabel) <- c("Activities")

# Build a data set for the Measurements
x <- rbind(x_train,x_test)
colnames(x) <- var_label[[2]]

# Build a data set for the Subjects
subject <- rbind(subject_train,subject_test)
colnames(subject) <- c("Volunteers")

# Merge data (Subjects, Activities and Measurements)
dataset <- cbind(subject,ylabel)
dataset <- cbind(dataset,x)

# Extract only the measurements for the mean and standard deviation
tidy <-dataset[c(1,2,grep("mean\\(", colnames(dataset)),
                 grep("std\\(", colnames(dataset)))]

# Create an aggregate data set (mean)
tidy.mean <- aggregate(tidy[3:68], 
                       by=list(Volunteers=tidy$Volunteers,
                               Activities=tidy$Activities),
                       FUN=mean)

# Write output file
write.table(tidy.mean, "tidy.txt", sep="\t", row.name=FALSE)
