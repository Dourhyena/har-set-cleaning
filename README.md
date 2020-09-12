### Aim

This project aims to create a tidy data set from the raw data provided in the data folder.

### Data Set

[Human Activity Recognition using Smartphones Data Sets](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


The data is downloaded using the above link and the required data for analysis is identified and specified in the ```data``` folder 

### Files

* ```CodeBook.md```: A codebook that describes the variables, data, and any transformations or work performed to clean up the data

* ```run_analysis.R```: The script which performs the required steps to tidy the data which are:
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive variable names.
  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
* ```final.txt```: The tidy data set after performing the above steps


