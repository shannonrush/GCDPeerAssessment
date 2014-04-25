* The Study

This data was collected during a study of 30 individuals instructed to wear a smartphone equipped with an accelerometer and gyroscope while performing 6 different activities. The device sensors recorded a variety of measurements, a subset of which will be described in the Variables section.

More information about the study and this data can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* The Data

This data was downloaded on April 22, 2014 at approximately 4pm MST from the Coursera project instruction page: 
https://class.coursera.org/getdata-002/human_grading/view/courses/972080/assessments/3/submissions
More information on downloading the data can be found in this project's README.md file under 'Downloading the Data' and in the file download_data.R

* Variables

From the project instructions: "Extracts only the measurements on the mean and standard deviation for each measurement."

My assumption, after reviewing the project instructions and the explanatory data set files, was to interpret this to mean include only the measurements with -mean() or -std()

The variable names were originally represented with non-descriptive labels such as "V1". These were replaced with the feature names found in the UCI HAR Data Set features.txt. The features names were also tidied according to tidy data rules, including lowering the case and stripping punctuation. More details on this process can be found in the README in the section HeaderNames 

This filtering resulted in 66 measurement variables. The text file produced by running the run_analysis.R script also includes activity and subject features.

averaged_data.txt includes the mean of each measurement for each activity/subject combination, as each subject performed each activity multiple times.  From the project instructions: "Creates a second, independent tidy data set with the average of each variable for each activity and each subject."

* Variables In Detail

* "activity"
** The activity labels originally existed in separate files in the UCI HAR Data Set with numeric values. 
** These values were mapped to a given set of descriptive labels: "walking", "sitting", "standing", "laying", "walking downstairs" and "walking upstairs"

* "subject"
** There were 30 subject participants in the study, identified numerically 1-30. 
** The subject identifiers originally existed in separate files in the UCI HAR Data Set.

* "tbodyaccmeanx"            
** Mean of the body acceleration time domain signal on the X axis

* "tbodyaccmeany"
** Mean of the body acceleration time domain signal on the Y axis

* "tbodyaccmeanz"
** Mean of the body acceleration time domain signal on the Z axis 

* "tbodyaccstdx"
** Standard Deviation of the body acceleration time domain signal on the X axis

* "tbodyaccstdy"
** Standard Deviation of the body acceleration time domain signal on the Y axis

* "tbodyaccstdz"  
** Standard Deviation of the body acceleration time domain signal on the Z axis

* "tgravityaccmeanx"
** Mean of the gravity acceleration time domain signal on the X axis

* "tgravityaccmeany"
** Mean of the gravity acceleration time domain signal on the Y axis

* "tgravityaccmeanz"
** Mean of the gravity acceleration time domain signal on the Z axis 

* "tgravityaccstdx"      
** Standard Deviation of the gravity acceleration time domain signal on the X axis

* "tgravityaccstdy"
** Standard Deviation of the gravity acceleration time domain signal on the Y axis

* "tgravityaccstdz"
** Standard Deviation of the gravity acceleration time domain signal on the Z axis

* "tbodyaccjerkmeanx"        
** Mean of the body acceleration jerk time domain signal on the X axis

* "tbodyaccjerkmeany"
** Mean of the body acceleration jerk time domain signal on the Y axis

* "tbodyaccjerkmeanz"
** Mean of the body acceleration jerk time domain signal on the Z axis

* "tbodyaccjerkstdx"
** Standard Deviation of the body acceleration jerk time domain signal on the X axis

* "tbodyaccjerkstdy"
** Standard Deviation of the body acceleration jerk time domain signal on the Y axis

* "tbodyaccjerkstdz"  
** Standard Deviation of the body acceleration jerk time domain signal on the Z axis

* "tbodygyromeanx"
** Mean of the body gyroscope time domain signal on the X axis 

* "tbodygyromeany"          
** Mean of the body gyroscope time domain signal on the Y axis

* "tbodygyromeanz"          
** Mean of the body gyroscope time domain signal on the Z axis

* "tbodygyrostdx"     
** Standard Deviation of the body gyroscope time domain signal on the X axis 

* "tbodygyrostdy"            
** Standard Deviation of the body gyroscope time domain signal on the Y axis

* "tbodygyrostdz"
** Standard Deviation of the body gyroscope time domain signal on the Z axis

* "tbodygyrojerkmeanx"
** Mean of the body gyroscope jerk time domain signal on the X axis

* "tbodygyrojerkmeany"
** Mean of the body gyroscope jerk time domain signal on the Y axis

* "tbodygyrojerkmeanz"
** Mean of the body gyroscope jerk time domain signal on the Z axis

* "tbodygyrojerkstdx"
** Standard Deviation of the body gyroscope jerk time domain signal on the X axis

* "tbodygyrojerkstdy"
** Standard Deviation of the body gyroscope jerk time domain signal on the Y axis

* "tbodygyrojerkstdz"       
** Standard Deviation of the body gyroscope jerk time domain signal on the Z axis

* "tbodyaccmagmean"
** Mean of the body acceleration magnitude time domain signal

* "tbodyaccmagstd"
** Standard Deviation of the body acceleration magnitude time domain signal

* "tgravityaccmagmean"
** Mean of the gravity acceleration magnitude time domain signal

* "tgravityaccmagstd" 
** Standard Deviation of the gravity acceleration magnitude time domain signal

* "tbodyaccjerkmagmean"
** Mean of the body acceleration jerk magnitude time domain signal

* "tbodyaccjerkmagstd"
** Standard Deviation of the body acceleration jerk magnitude time domain signal

* "tbodygyromagmean"
** Mean of the body gyroscope magnitude time domain signal

* "tbodygyromagstd"  
** Standard Deviation of the body gyroscope magnitude time domain signal

* "tbodygyrojerkmagmean"
** Mean of the body gyroscope jerk magnitude time domain signal 

* "tbodygyrojerkmagstd"
** Standard Deviation of the body gyroscope jerk magnitude time domain signal 

* "fbodyaccmeanx"            
** Mean of the Fast Fourier Transform of the body acceleration on the X axis

* "fbodyaccmeany" 
** Mean of the Fast Fourier Transform of the body acceleration on the Y axis

* "fbodyaccmeanz"
** Mean of the Fast Fourier Transform of the body acceleration on the Z axis

* "fbodyaccstdx" 
** Standard Deviation of the Fast Fourier Transform of the body acceleration on the X axis

* "fbodyaccstdy" 
** Standard Deviation of the Fast Fourier Transform of the body acceleration on the Y axis

* "fbodyaccstdz"
** Standard Deviation of the Fast Fourier Transform of the body acceleration on the Z axis

* "fbodyaccjerkmeanx"
** Mean of the Fast Fourier Transform of the body acceleration jerk on the X axis

* "fbodyaccjerkmeany"
** Mean of the Fast Fourier Transform of the body acceleration jerk on the Y axis

* "fbodyaccjerkmeanz"
** Mean of the Fast Fourier Transform of the body acceleration jerk on the Z axis

* "fbodyaccjerkstdx"    
** Standard Deviation of the Fast Fourier Transform of the body acceleration jerk on the X axis

* "fbodyaccjerkstdy" 
** Standard Deviation of the Fast Fourier Transform of the body acceleration jerk on the Y axis

* "fbodyaccjerkstdz"
** Standard Deviation of the Fast Fourier Transform of the body acceleration jerk on the Z axis

* "fbodygyromeanx"
** Mean of the Fast Fourier Transform of the body gryoscope on the X axis

* "fbodygyromeany"
** Mean of the Fast Fourier Transform of the body gryoscope on the Y axis

* "fbodygyromeanz"
** Mean of the Fast Fourier Transform of the body gryoscope on the Z axis

* "fbodygyrostdx"
** Standard Deviation of the Fast Fourier Transform of the body gryoscope on the X axis

* "fbodygyrostdy"
** Standard Deviation of the Fast Fourier Transform of the body gryoscope on the Y axis

* "fbodygyrostdz"
** Standard Deviation of the Fast Fourier Transform of the body gryoscope on the Z axis

* "fbodyaccmagmean"
** Mean of the Fast Fourier Transform of the body acceleration magnitude

* "fbodyaccmagstd"
** Standard Deviation of the Fast Fourier Transform of the body acceleration magnitude

* "fbodybodyaccjerkmagmean"
** Mean of the Fast Fourier Transform of the body acceleration jerk magnitude

* "fbodybodyaccjerkmagstd"  
** Standard Deviation of the Fast Fourier Transform of the body acceleration jerk magnitude

* "fbodybodygyromagmean"     
** Mean of the Fast Fourier Transform of the body gryoscope magnitude

* "fbodybodygyromagstd"
** Standard Deviation of the Fast Fourier Transform of the body gryoscope magnitude

* "fbodybodygyrojerkmagmean"
** Mean of the Fast Fourier Transform of the body gryoscope jerk magnitude

* "fbodybodygyrojerkmagstd"
** Standard Deviation of the Fast Fourier Transform of the body gryoscope jerk magnitude
