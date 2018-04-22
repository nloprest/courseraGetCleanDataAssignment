# I load the dplyr library

library(dplyr)

# I read the training and testing datasets for the subjects 
# and I merge them

Xtest<-read.table("test/X_test.txt")
Xtrain<-read.table("train/X_train.txt")
Xall <- rbind(Xtest,Xtrain)

# among the features names, I select
# only the ones where "mean()" or "std()" apper

features<-read.table("features.txt")
featuresneeded<-grep("mean\\(\\)|std\\(\\)",features[,2])
Xonlymeanstd<-Xall[,featuresneeded]

# I rename the variables with descriptive names (as given in 
# the "features.txt" file)

oldvars <- names(Xall[featuresneeded])
newvars <- features[featuresneeded,2]
Xnewvars<-rename_at(Xonlymeanstd, oldvars, ~ newvars)

# I read and merge training and testing
# datasets for the target (activity)

ytest<-read.table("test/y_test.txt")
ytrain<-read.table("train/y_train.txt")
yall<-rbind(ytest, ytrain)

# I rename the label for the activity data so that it is descriptive

activitylabels<-read.table("activity_labels.txt")
yall2<-mutate(yall, activity = activitylabels[V1,2])

# I merge the activity column together with the "subject" table created above

merged<-cbind(Xnewvars, select(yall2,activity))

# for each activity and for each subject of the 
# dataset I have build, I compute the mean
# and I store it in a new dataset.

allaverages<-summarize_all(group_by(merged, activity),funs(mean))

