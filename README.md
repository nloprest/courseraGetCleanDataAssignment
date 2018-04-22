In this scipt run_analysis.R:

I load the dplyr library

I read the training and testing datasets for the subjects and I merge them

Among the features names, I select only the ones where "mean()" or "std()" apper

I rename the variables with descriptive names (as given in the "features.txt" file)

I read and merge training and testing datasets for the target (activity)

I rename the label for the activity data so that it is descriptive

 I merge the activity column together with the "subject" table created above

For each activity and for each subject of the dataset I have build, I compute the mean and I store it in a new dataset.
