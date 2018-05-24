# Codebook

The output is a dataframe with the size 66 rows x 36 columns. The column names is the subject from 1 to 30 and the activity including `walking`, `walking_upstairs`, `walking_downstairs`, `sitting`, `standing`, `laying`. The row names is the measurements in terms of average values `Mean` and standard deviation values `Std`.

Hereunder is the process to work out the above-mentioned output:

<b>`STEP 1`</b> Download dataset and unzip the file

<b>`STEP 2`</b> Modify the names of measurements
 
 For example, after loading the `features.txt` into R by `features <- read.delim("features.txt", header = FALSE)`, the result will be `1 tBodyAcc-mean()-X`. I must use `gsub()` to eliminate the `1`
 
 <b>`STEP 3`</b> Import train dataset and make the dataframe `train`
 
 <b>`STEP 4`</b> Import test dataset and make the dataframe `test`
 
 <b>`STEP 5`</b> Combine `train` and `test` into `dataset`, then filter `dataset` with only measurements of mean and standard deviation, leading to `dataset_extracted`
