wd<-'C:/data/coursera/tidy4_1' # set the work directory on my pc
setwd(wd)
library(RCurl); library(data.table); library(dplyr) #libray used 
# download the requested zip files
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dest="HAR.zip") 
unzip("HAR.zip")
list.dirs(, full.names = TRUE, recursive = TRUE); list.files(, full.names = TRUE, recursive = TRUE) # check repos & files

# 1.Merges the training and the test sets to create one data set.
# train set
tra.set.feat <- read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/train/X_train.txt', header = FALSE)
tra.set.activ<- read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/train/y_train.txt',header = FALSE)
tra.set.sub <- read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/train/subject_train.txt',header = FALSE)
# test set
tes.set.feat <- read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/test/X_test.txt',header = FALSE)
tes.set.activ <- read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/test/y_test.txt', header = FALSE)
tes.set.sub <- read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/test/subject_test.txt', header = FALSE)
# name of the features and the name of the activities.
feat.nam <- read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/features.txt')
activ.lab <- read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/activity_labels.txt', header = FALSE)
str(feat.nam);str(activ.lab)
# merge the rispective files
features <- rbind(tra.set.feat, tes.set.feat)
activity <- rbind(tra.set.activ, tes.set.activ)
subject <- rbind(tra.set.sub, tes.set.sub)
# columns in the features data set can be named from the metadata "feat.nam" the remaining two data set are renamed
colnames(features) <- t(feat.nam[2])
colnames(activity) <- "activity"
colnames(subject) <- "subject"
# merging
data <- cbind(features,activity,subject)
str(data); head(data, n=3); names(data)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
data.mean.sd <-grep(".*Mean.*|.*Std.*", names(data), ignore.case=TRUE)
# add the columns of activity and subject to the "grep list" of variables including mean & std
col <- c(data.mean.sd, 562, 563)
extr.data <- data[,col]
str(extr.data)

# 3.Uses descriptive activity names to name the activities in the data set
# Convert the numeric type activity variable into character type variables using activityLabels names.
x<-extr.data$activity
y <- factor(x)
levels(y)
l=length(levels(y))
extr.data$activity <- as.character(extr.data$activity)
for (i in 1:l){
  extr.data$activity[extr.data$activity == i] <- as.character(activ.lab[i,2])
}
extr.data$activity <- as.factor(extr.data$activity)
#check readability 
names(extr.data)
old.name<-names(extr.data)
#new names 
names(extr.data)<-gsub("Acc", "accelerometer", names(extr.data))
names(extr.data)<-gsub("Gyro", "gyroscope", names(extr.data))
names(extr.data)<-gsub("BodyBody", "body", names(extr.data))
names(extr.data)<-gsub("Mag", "magnitude", names(extr.data))
names(extr.data)<-gsub("^t", "time", names(extr.data))
names(extr.data)<-gsub("^f", "frequency", names(extr.data))
names(extr.data)<-gsub("tBody", "timebody", names(extr.data))
names(extr.data)<-gsub("-mean()", "mean", names(extr.data), ignore.case = TRUE)
names(extr.data)<-gsub("-std()", "std", names(extr.data), ignore.case = TRUE)
names(extr.data)<-gsub("-freq()", "frequency", names(extr.data), ignore.case = TRUE)
names(extr.data)<-gsub("angle", "angle", names(extr.data))
names(extr.data)<-gsub("gravity", "gravity", names(extr.data))
names(extr.data)
new.name<-names(extr.data)
cbind(old.name,new.name)
write.table(cbind(new.name,old.name), 'C:/data/coursera/tidy4_1/UCI HAR Dataset/oldnew.names.txt', row.names = TRUE)
read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/oldnew.names.txt')



# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
extr.data$subject <- as.factor(extr.data$subject)
extr.data <- data.table(extr.data)
tidy.data <- aggregate(. ~subject + activity, extr.data, mean)
tidy.data <- tidy.data[order(tidy.data$subject,tidy.data$activity),]
write.table(tidy.data, 'C:/data/coursera/tidy4_1/UCI HAR Dataset/tidy.txt', row.names = TRUE)
read.table('C:/data/coursera/tidy4_1/UCI HAR Dataset/tidy.txt') #check
