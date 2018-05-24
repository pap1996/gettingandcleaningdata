### DOWNLOAD THE DATASET AND UNZIP FILE
dir.create("./data")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/data.zip")
unzip("./data/data.zip")
setwd("./UCI HAR Dataset")

### MODIFY THE NAMES OF MEASUREMENTS
features <- read.delim("features.txt", header = FALSE)
features <- gsub("[0-9]+ ", "",features[,1])

### IMPORT TRAIN DATASET AND ASSIGN THE NAMES OF COLUMNS
subject_train <- read.delim("./train/subject_train.txt", header = FALSE)
y_train <- read.delim("./train/y_train.txt", header = FALSE)
X_train <- read.delim("./train/X_train.txt", header = FALSE, sep = "")
train <- cbind.data.frame(subject = subject_train, activity = y_train, X_train)
names(train) <- c("subject","activity", features)
names(train)

### IMPORT TEST DATASET AND ASSIGN THE NAMES OF COLUMNS
subject_test <- read.delim("./test/subject_test.txt", header = FALSE)
y_test <- read.delim("./test/y_test.txt", header = FALSE)
X_test <- read.delim("./test/X_test.txt", header = FALSE, sep = "")
test <- cbind.data.frame(subject_test, y_test, X_test)
names(test) <- c("subject","activity", features)
names(test)

### COMBINE TRAIN DATASET AND TEST DATASET INTO ONE DATAFRAME
dataset <- rbind.data.frame(train, test)
mean_variables <- grep("mean\\()",names(dataset))
std_variables <- grep("std\\()",names(dataset))
remained_variables <- names(dataset)[sort(c(mean_variables, std_variables))]
dataset_extracted <- dataset[,c("subject", "activity", remained_variables)]

### ASSIGN DESCRIPTIVE ACTIVITY NAMES
activity_labels <- read.delim("activity_labels.txt", header = FALSE)
install.packages("dplyr")
library(dplyr)
activity_labels <- mutate(activity_labels, activity = gsub("[0-9]+ ", "",activity_labels[,1]), class = as.numeric(sapply(strsplit(as.vector(activity_labels[,1])," "), function(x){x[1]})))

for (i in 1:nrow(dataset_extracted)) {
  for (j in 1:nrow(activity_labels)) {
    if (dataset_extracted$activity[i] == activity_labels$class[j]) {
      dataset_extracted$activity[i] <- activity_labels$activity[j]
    }
  }
}      

dataset_extracted$activity <- tolower(dataset_extracted$activity)


### CHANGE PROPER VARIABLE NAMES
names(dataset_extracted) <- gsub("mean","Mean", names(dataset_extracted)) #CAPITALIZE MEAN AND STD#
names(dataset_extracted) <- gsub("std","Std", names(dataset_extracted))
dulplicate_string <- grep("([A-Z]+)(.*)\\1",names(dataset_extracted), value = TRUE)
names(dataset_extracted)<- gsub("([A-Z]+)(.*)\\1", "\\1", names(dataset_extracted)) #ELIMINATE THE DUPLICATE SET OF STRING IN THE NAME#
names(dataset_extracted)<- gsub("\\W", "", names(dataset_extracted)) #ELIMINATE THE NON-WORD CHARACTER"
names(dataset_extracted)<- gsub("Mean", ".Mean", names(dataset_extracted)) #SEPERATE THE NAME OF MEASUREMENT AND MEAN OR STD#
names(dataset_extracted)<- gsub("Std", ".Std", names(dataset_extracted))
names(dataset_extracted)<- gsub("([XYZ]$)", "\\.\\1", names(dataset_extracted)) #SEPERATE THE AXIS FROM THE NAME#
names(dataset_extracted)

### CALCULATE THE AVERAGE OF VARIABLES FOR EACH ACTIVITY AND SUBJECT
subject_average <- split(dataset_extracted, dataset_extracted$subject)
subject_average <- sapply(subject_average, function(x) {colMeans(x[,-c(1,2)])})
activity_average <- split(dataset_extracted, dataset_extracted$activity)
activity_average <- sapply(activity_average, function(x) {colMeans(x[,-c(1,2)])})
dataset_step5 <- cbind.data.frame(subject_average, activity_average)

###RENAME THE NAMES OF DATAFRAME AND WRITE IT TO FILE
names(dataset_step5) <- gsub("([0-9]*[0-9]$)","subject\\.\\1",names(dataset_step5))
names(dataset_step5) <- gsub("([a-z](.*)[^0-9]$)","activity\\.\\1",names(dataset_step5))
file.create("DATA.txt")
write.table(dataset_step5, file = "DATA.txt", row.names = TRUE)

