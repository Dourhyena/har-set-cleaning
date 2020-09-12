The following steps are performed to obtain a Tidy Data Set:

### 1. Classifying and assigning the data into tables

* ```activity```(6 rows, 2 columns): contains the activities possible indexed
* ```functions``` (561 rows, 2 columns): contains the variables of the accelerometer and    gyrosope
* ```subject_test``` (2947 rows, 1 column): contains the observed subjects for testing
* ```subject_train``` (7352 rows, 1 column): contains the observed subjects for training
* ```X_test``` (2947 rows, 561 columns): contains predictor variable values to be tested
* ```y_test``` (2947 rows, 1 column): contains target variable values to be trained
* ```X_train``` (7352 rows, 561 columns): contains predictor variable values to be trained
* ```X_test``` (2947 rows, 561 columns): contains predictor variable values to be tested

### 2. Merge Training and Testing Data Sets into a single Data Sets

* ```X``` (10299 rows and 561 columns): table created by combining ```X_train``` and ```X_test``` table values by using ```rbind()```
* ```y``` (10299 rows and 1 column): table created by combining ```y_train``` and ```y_test``` table values by using ```rbind()```
* ```subject``` (10299 rows and 1 column): table created by combining ```subject_test``` and ```subject_train``` table values using ```rbind()```
* ```merged``` (10299 rows, 563 columns): table created by combining ```y```, ```x```, ```subject_table``` as one table using ```cbind()```

### 3. Extract only the measurements on the mean and standard deviation for each measurement

* ```tidy1``` (10299 rows, 88 columns): table created by selecting only columns whose column name contains *std* and *mean*

### 4. Use descriptive activity names to name the activities in the data set

* Replace column **key** in tidy1 containing activity keys with activity names by looking up the corresponding indices in ```activity``` table

### 5. Appropriately labels the data set with descriptive variable names

* Replace all **BodyBody** in tidy1 column names into **Body**
* Replace all **angle** in tidy1 column names into **Angle**
* Replace all **Gyro** in tidy1 column names into **Gyroscope**
* Replace all **Mag** in tidy1 column names into **Magnitude**
* Replace all **Freq** in tidy1 column names into **Frequency**
* Replace all **gravity** in tidy1 column names into **Gravity**
* Replace all **std** in tidy1 column names into **STD**
* Replace all **t** found as the beginning character in tidy1 column names into **Time**
* Replace all **f** found as the beginning character in tidy1 column names into **Frequency**
* Replace all **tBody** in tidy1 column names into **TimeBody**
* Replace all **Acc** in tidy1 column names into **Accelerometer**
* Replace all **mean** in tidy1 column names into **Mean**
* Rename column 2 name (key) as **activity**

### 6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

* ```final``` (180 rows, 88 columns): created by first grouping ```tidy1``` table based on subject and activities by using ```group_by()``` and then compute the mean for all the variables
* Export table ```final``` as **final.txt** which is the required Tidy Data Set

