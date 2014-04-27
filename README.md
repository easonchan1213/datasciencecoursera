datasciencecoursera
===================
Getting and Cleaning Data Peer Assessment Project

  How does my code work?
  ========

  First step: Merges the training and the test sets to create one data set. Appropriately labels the data set with      descriptive activity names. 
  --
  ReadLines from features.txt so I get all the names for the columns, then read test and train 
  dataset, respectively. Finally, rbind test and train dataset.

  ========

  Second step: Extracts only the measurements on the mean and standard deviation for each measurement. 
  --
  Use grep function to extract col.names which contains mean or std, subset the original merged dataset subsequently.

  ========
  
  Third step: Uses descriptive activity names to name the activities in the data set
  --
  Loop through the extract dataset, giive each number the corresponding activity name
  
  ========
  
  Final step:Creates a second, independent tidy data set with the average of each variable for each activity and each   subject.
  --
  Use functions from Reshape package, melt and dcast the extract dataset, so there you go!
