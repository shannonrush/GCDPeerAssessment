## run_analysis.R contains a set of functions that tidies a data set collected from a study 
## on accelerometer sensors. 
##
## The data has been pre-downloaded and is available for run_analysis 
## in the UCI HAR Dataset in the working directory. 
## 
## The main function, RunAnalysis, calls the other functions, each of which have 
## a specific task. RunAnalysis returns the tidy data set as a txt file.

RunAnalysis <- function() {
    test <- GetData("test")
    train <- GetData("train")
    merged <- MergeSets(test,train)
    filtered.data <- FilterData(merged)
    names(filtered.data) <- HeaderNames(names(filtered.data))
    with.activity <- cbind(GetActivity(),filtered.data)
    with.subject <- cbind(GetSubject(),with.activity)
    averaged.data <- AveragedData(with.subject)
    write.table(averaged.data,file="averaged_data.txt")
}

## Takes a string to specify test or train data.
## Reads the appropriate text file from the UCI HAR Dataset and returns the data frame

GetData <- function(set) {
    if (!set %in% c("test","train")) {
        ## return NULL if an inappropriate string passed in
        warning("GetData accepts only 'test' or 'train'")
        return(NULL)
    }
    
    file <- paste0("UCI HAR Dataset/",set,"/X_",set,".txt")
    
    if (file.exists(file)) {
        read.table(file)
    } else {
        ## return NULL if file not found
        warning("File not found. Please ensure UCI HAR Dataset is in working directory.")
        return(NULL)
    }
}

## Takes test and train data frames and returns a merged data frame

MergeSets <- function(test,train) {
    rbind(test,train)    
}

## Takes the merged data frame and extracts the mean and standard deviation measurements

FilterData <- function(data) {
    features <- read.table("UCI HAR Dataset/features.txt")
    columns <- apply(features,1,CheckFeature)
    data[,columns]
}

## Takes a feature name. 
## Returns TRUE if the name contains -mean() or -std(), otherwise returns FALSE.

CheckFeature <- function(feature) {
    grepl("-mean\\(\\)|-std\\(\\)",feature[2])
}

## Takes a character vector of the original header names
## Looks up the descriptive header names in the UCI HAR Data Set features.txt
## Tidies the header names to conform to text variable tidy data rules
## Returns a character vector with tidy header names

HeaderNames <- function(old.names) {
    features <- read.table("UCI HAR Dataset/features.txt")
    feature.ids <- as.numeric(sapply(old.names, function(old.name) gsub("V","",old.name)))
    names <- sapply(feature.ids, function(id) features[id,2])
    tidy.names <- sapply(names, TidyName)
}

## Takes a name from features.txt (e.g. "fBodyAccJerk-std()-X")
## Removes parentheses and transforms to lower case
## Returns tidied name

TidyName <- function(name) {
    tolower(gsub("[\\(\\)-]","",name))
}

## Fetches and merges the activity feature for test and train
## Updates the numeric values to descriptive activity names
## Returns a one column data frame with the Activity feature

GetActivity <- function() {
    y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
    y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
    merged <- rbind(y.test,y.train)
    
    ## Update activity values to descriptive values
    activity <- apply(merged,1,UpdateValue)
    data.frame(activity)
}

## Takes a row from the data frame containing numeric activity values
## Returns a descriptive activity name to replace numeric value

UpdateValue <- function(activity) {
    c("walking","walking upstairs","walking downstairs","sitting","standing","laying")[activity]
}

## Fetches and merges the subject feature for test and train
## Returns a data frame with column name "Subject"

GetSubject <- function() {
    subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    merged <- rbind(subject.test,subject.train)
    data.frame(subject=merged$V1)
}

## Takes a data frame consisting of the 66 mean and std measurements plus the activity label and subject 
## identifier
## Returns a data frame with averages for each measurement for each activity/subject combination

AveragedData <- function(data) {
    require(reshape2)
    molten <- melt(data,id.vars=c("activity","subject"))     
    reshaped <- dcast(molten,subject + activity ~ variable,mean)
}

RunAnalysis() 

