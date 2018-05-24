# Codebook

The output is a dataframe with the size 66 rows x 36 columns. The column names is the subject from 1 to 30 and the activity including `walking`, `walking_upstairs`, `walking_downstairs`, `sitting`, `standing`, `laying`. The row names is the measurements in terms of average values `Mean` and standard deviation values `Std`.

Column names: 
* `subject.1`
`subject.2`
`subject.3`
`subject.4`
`subject.5`
`subject.6`
`subject.7`
`subject.8`
`subject.9`
`subject.10`
`subject.11`
`subject.12`
`subject.13`
`subject.14`
`subject.15`
`subject.16`
`subject.17`
`subject.18`
`subject.19`
`subject.20`
`subject.21`
`subject.22`
`subject.23`
`subject.24`
`subject.25`
`subject.26`
`subject.27`
`subject.28`
`subject.29`
`subject.30`
`activity.laying`
`activity.sitting`
`activity.standing`
`activity.walking`
`activity.walking_downstairs`
`activity.walking_upstairs`

Row names: 
* `tBodyAcc.Mean.X`
`tBodyAcc.Mean.Y`
`tBodyAcc.Mean.Z`
`tBodyAcc.Std.X`
`tBodyAcc.Std.Y`
`tBodyAcc.Std.Z`
`tGravityAcc.Mean.X`
`tGravityAcc.Mean.Y`
`tGravityAcc.Mean.Z`
`tGravityAcc.Std.X`
`tGravityAcc.Std.Y`
`tGravityAcc.Std.Z`
`tBodyAccJerk.Mean.X`
`tBodyAccJerk.Mean.Y`
`tBodyAccJerk.Mean.Z`
`tBodyAccJerk.Std.X`
`tBodyAccJerk.Std.Y`
`tBodyAccJerk.Std.Z`
`tBodyGyro.Mean.X`
`tBodyGyro.Mean.Y`
`tBodyGyro.Mean.Z`
`tBodyGyro.Std.X`
`tBodyGyro.Std.Y`
`tBodyGyro.Std.Z`
`tBodyGyroJerk.Mean.X`
`tBodyGyroJerk.Mean.Y`
`tBodyGyroJerk.Mean.Z`
`tBodyGyroJerk.Std.X`
`tBodyGyroJerk.Std.Y`
`tBodyGyroJerk.Std.Z`
`tBodyAccMag.Mean`
`tBodyAccMag.Std`
`tGravityAccMag.Mean`
`tGravityAccMag.Std`
`tBodyAccJerkMag.Mean`
`tBodyAccJerkMag.Std`
`tBodyGyroMag.Mean`
`tBodyGyroMag.Std`
`tBodyGyroJerkMag.Mean`
`tBodyGyroJerkMag.Std`
`fBodyAcc.Mean.X`
`fBodyAcc.Mean.Y`
`fBodyAcc.Mean.Z`
`fBodyAcc.Std.X`
`fBodyAcc.Std.Y`
`fBodyAcc.Std.Z`
`fBodyAccJerk.Mean.X`
`fBodyAccJerk.Mean.Y`
`fBodyAccJerk.Mean.Z`
`fBodyAccJerk.Std.X`
`fBodyAccJerk.Std.Y`
`fBodyAccJerk.Std.Z`
`fBodyGyro.Mean.X`
`fBodyGyro.Mean.Y`
`fBodyGyro.Mean.Z`
`fBodyGyro.Std.X`
`fBodyGyro.Std.Y`
`fBodyGyro.Std.Z`
`fBodyAccMag.Mean`
`fBodyAccMag.Std`
`fBodyAccJerkMag.Mean`
`fBodyAccJerkMag.Std`
`fBodyGyroMag.Mean`
`fBodyGyroMag.Std`
`fBodyGyroJerkMag.Mean`
`fBodyGyroJerkMag.Std`

Hereunder is the process to work out the above-mentioned output:

<b>`STEP 1`</b> Download dataset and unzip the file

<b>`STEP 2`</b> Modify the names of measurements
 
 For example, after loading the `features.txt` into R by `features <- read.delim("features.txt", header = FALSE)`, the result will be `1 tBodyAcc-mean()-X`. I must use `gsub()` to eliminate the `1`
 
<b>`STEP 3`</b> Import train dataset and make the dataframe `train`
 
<b>`STEP 4`</b> Import test dataset and make the dataframe `test`
 
<b>`STEP 5`</b> Combine `train` and `test` into `dataset`, then filter `dataset` with only measurements of mean and standard deviation, leading to `dataset_extracted` which is also the dataframe I work with in next steps

<b>`STEP 6`</b> Assign descriptive names for activities

For example, `1` stands for `walking`, so I replace `1` with `walking`

<b>`STEP 7`</b> Modify the names of column in `dataset_extracted`

For example, after <b>`STEP 6`</b>, the name of such a column will be like `fBodyGyro-mean()-Y`. I will modify into `fBodyGyro.Mean.Y`. Some column names have repeated strings of characters such as `fBodyBodyGyroJerkMag-mean()`, which are changed into something like that `fBodyGyroJerkMag.Mean`

<b>`STEP 8`</b> Make `dataset_step5` to calculate the average of each measurement for each activity and each subject, then write into `DATA.txt`
