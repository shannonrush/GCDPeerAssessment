Style

R Style in this project makes all attempts to be consistent with Google's R Style Guide
* https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml

Tests

Tests were written using the testthat package and can be found in the tests directory. 

Packages

Requires reshape2

Downloading the Data

The data files have been downloaded using download_data.R. This script downloads the zip file from the URL provided in the project instructions and saves it to a file called data.zip.  This file is unzipped and the resulting directory, UCI HAR Dataset, is available in the working directory.

Running the Analysis

RunAnalysis calls task specific methods and returns a tidied data set in the file averaged_data.txt
It calls the following methods:

* GetData("test") and GetData("train")
** GetData takes a string("test" or "train") specifying the target data and returns the appropriate data frame
** If an inappropriate string is passed in the function produces a warning and returns NULL
** If "test" or "train" is passed in, the appropriate text file is read and the data frame is returned
** If the file is not found the function produces a warning and returns NULL

* MergeSets
** MergeSets takes the test and train data frames and returns a merged data frame

* FilterData
** From the project instructions: "Extracts only the measurements on the mean and standard deviation for each measurement."
** Most of the features in the accelerometer data set have many measurements, indicated by a dash and the measurement's abbreviation.  For example: fBodyBodyGyroJerkMag-mean()
** FilterData takes the merged data frame and returns a data frame that includes only measurements for mean and standard deviation, indicated by -mean() and -std(), respectively.
** FilterData uses the function CheckFeature to check for the "-mean()" or "-std()" substring 

* HeaderNames
** Takes a character vector of the original header names
** Looks up the descriptive header names in the UCI HAR Data Set features.txt
** Tidies the header names to conform to text variable tidy data rules
*** lower case
*** descriptive
*** no underscores, dots or white spaces
*** no duplication
*** See slide 16 of https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/04_01_editingTextVariables.pdf
*** In addition, parentheses and hyphens are removed to avoid parsing errors for anyone using the resulting data
** Returns a character vector with tidy header names
** More explanation for each variable can be found in the Code Book
** HeaderNames uses TidyName to tidy the string (removes parentheses and transforms to lower case)
** It is assumed that the somewhat descriptive nature of the names in features.txt combined with the explanation in the accompanying Code Book satisfies the Tidy Data rule that column names be descriptive

* GetActivity
** The activity values are stored in separate files in the original UCI HAR Dataset.
** GetActivity fetches and merges these files from the test and train directories.
** GetActivity uses the function UpdateValue to replace the numeric values with the descriptive names found in the UCI HAR Dataset file activity_labels.txt
** A one column data frame with the column name "Activity" is returned to be column bound to the data in RunAnalysis

* GetSubject
** The subject identifiers are stored in separate files in the original UCI HAR Dataset
** GetSubject fetches and merges these files from the test and train directories
** A one column data frame with the column name "Subject" is returned to be column bound to the data in RunAnalysis

* AveragedData
** AveragedData takes the tidied data frame with the activity and subject features
** A data frame with the means of the measured variables for each activity/subject combination is returned