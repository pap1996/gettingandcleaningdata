# gettingandcleaningdata
This the final project for the course "Getting and Cleaning Data" by by Johns Hopkins University from Coursera

My task for this project is to make a tidy version of given datasets about the topic "Human Activity Recognition Using Smartphones"

Some characteristics of input datasets:

1. There are two sets of data (including the test dataset and the train dataset) with 102999 observations
2. Each observation includes the subject no. (i.e. the person taking the experiments), the type of activities, 561 measurements.
3. The subject no. range from 1 to 30, corresponding to 30 people taking part in experiments. The type of activities can fall into 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 561 measurements (you can find further information about 561 measurements in "features_info.txt")

Hereunder is the requirements:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

My output is a dataframe show the average MEAN and STD of each measurement for each subject and activity. You can find out more about the process I work out the result in "codebook.md" in the same repository.
