library(dplyr)

activity = read.table(file = "./data/activity_labels.txt", col.names = c("key", "activity"))
functions = read.table(file = "./data/features.txt", col.names = c("n", "features"))
subject_test = read.table(file = "./data/subject_test.txt", col.names = "subject")
subject_train = read.table(file = "./data/subject_train.txt", col.names = "subject")
X_test = read.table(file = "./data/X_test.txt", col.names = functions$features)
X_train = read.table(file = "./data/X_train.txt", col.names = functions$features)
Y_test = read.table(file = "./data/Y_test.txt", col.names = "key")
Y_train = read.table(file = "./data/Y_train.txt", col.names = "key")

## Merges the training and the test sets to create one data set
X = rbind(X_train, X_test)
y = rbind(Y_train, Y_test)
subject = rbind(subject_train, subject_test)
merged = cbind(subject, y, X)

## Extracts only the measurements on the mean and standard deviation for each measurement
tidy1 = merged %>% select(subject, key, contains("mean"), contains("std"))

## Uses descriptive activity names to name the activities in the data set
tidy1$key = activity[tidy1$key, 2]

## Appropriately labels the data set with descriptive variable names
names(tidy1) = gsub(pattern = "BodyBody", replacement = "Body", x = names(tidy1))
names(tidy1) = gsub(pattern = "angle", replacement = "Angle", x = names(tidy1))
names(tidy1) = gsub(pattern = "Gyro", replacement = "Gyroscope", x = names(tidy1))
names(tidy1) = gsub(pattern = "Mag", replacement = "Magnitude", x = names(tidy1))
names(tidy1) = gsub(pattern = "Freq", replacement = "Frequency", x = names(tidy1))
names(tidy1) = gsub(pattern = "gravity", replacement = "Gravity", x = names(tidy1))
names(tidy1) = gsub(pattern = "std", replacement = "STD", x = names(tidy1))
names(tidy1) = gsub(pattern = "^t", replacement = "Time", x = names(tidy1))
names(tidy1) = gsub(pattern = "^f", replacement = "Frequency", x = names(tidy1))
names(tidy1) = gsub(pattern = "tBody", replacement = "TimeBody", x = names(tidy1))
names(tidy1) = gsub(pattern = "Acc", replacement = "Accelerometer", x = names(tidy1))
names(tidy1) = gsub(pattern = "Mean", replacement = "mean", x = names(tidy1))
names(tidy1)[2] = "activity"

## Create a second independent tidy data (final) set with the average of each variable for each activity and each subject
final = tidy1 %>% group_by(subject, activity) %>% summarise_all(mean)
write.table(final, "final.txt", row.name=FALSE)