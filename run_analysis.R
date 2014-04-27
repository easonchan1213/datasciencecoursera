library(reshape2)

# Merges the training and the test sets to create one data set.
collabel <- readLines("UCI HAR Dataset/features.txt")

test <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE,col.names=collabel)
test2 <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE,col.names="Activity")
tests <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names="Subject")
#test2 <- as.data.table(test2)
#tests <- as.data.table(tests)
#test <- as.data.table(test)
tests <- cbind(tests,test2,test)
tests <- cbind("Kind"="Test",tests)

train <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE,col.names=collabel)
train2 <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE,col.names="Activity")
trains <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names="Subject")
#train2 <- as.data.table(train2)
#trains <- as.data.table(trains)
#train <- as.data.table(train)
trains <- cbind(trains,train2,train)
trains <- cbind("Kind"="Train",trains)

mergedata <- rbind(trains,tests)


# Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std <- grep("mean|std",names(mergedata))
mean_std <- mergedata[,mean_std]
extract <- cbind(mergedata[,1:3],mean_std)

# Uses descriptive activity names to name the activities in the data set
for (i in 1:nrow(extract)){
  if(extract[i,3]==1){extract[i,3] <- "WALKING"}
  if(extract[i,3]==2){extract[i,3] <- "WALKING_UPSTAIRS"}
  if(extract[i,3]==3){extract[i,3] <- "WALKING_DOWNSTAIRS"}
  if(extract[i,3]==4){extract[i,3] <- "SITTING"}
  if(extract[i,3]==5){extract[i,3] <- "STANDING"}
  if(extract[i,3]==6){extract[i,3] <- "LAYING"}
}

# Appropriately labels the data set with descriptive activity names. 


# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data <- melt(extract,id=c("Kind","Subject","Activity"))
data <- dcast(cy,Subject+Activity~variable,mean)
write.table(data,file="tidy_data_set.txt")