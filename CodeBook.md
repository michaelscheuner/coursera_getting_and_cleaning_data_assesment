# Code Book for Coursera Getting and Cleaning Data Assignment

## Input Files

Following files are Read:

* features.txt for reading the column names und filtering to the
wanted mean() - and std() - columns.
* activity_labels.txt for labeling the activites in a human readable manner.
* for test and train data:
  * subject_xxxx.txt the subject column
  * y_xxxx.txt the activities column
  * X_xxxx.txt the features columns


## Used Transformations
* After train or test data is read, the columns(features) of the dataset 
will be filtered by a regexp, so that only the wanted mean- and std-columns 
remain.
* Then the subject and activities-columns will be added.
* After that, train- and testdata will be merged into a single dataframe.
* The activities column (which is a factor) will then be transformed to 
hold the readable activity-descriptions from the activity_lables.txt file.
* The dataset is melt with ids subject and activity.
* Finally with the molten result the mean of all variables is calculated
via a dcast call.
* The resulting dataset is written to the working directory as "tidy.txt"


## Ouput File
The Output File "tidy.txt" is written by write.table as textfile. The first
two columns hold the subject and the activity in human readable form. The
other columns are named after the source columns, but hold the mean grouped
by subject and activity.

Here ist the complete field-list:

1 subject

2 activity

3 tBodyAcc-mean()-X

4 tBodyAcc-mean()-Y

5 tBodyAcc-mean()-Z

6 tBodyAcc-std()-X

7 tBodyAcc-std()-Y

8 tBodyAcc-std()-Z

9 tGravityAcc-mean()-X

10 tGravityAcc-mean()-Y

11 tGravityAcc-mean()-Z

12 tGravityAcc-std()-X

13 tGravityAcc-std()-Y

14 tGravityAcc-std()-Z

15 tBodyAccJerk-mean()-X

16 tBodyAccJerk-mean()-Y

17 tBodyAccJerk-mean()-Z

18 tBodyAccJerk-std()-X

19 tBodyAccJerk-std()-Y

20 tBodyAccJerk-std()-Z

21 tBodyGyro-mean()-X

22 tBodyGyro-mean()-Y

23 tBodyGyro-mean()-Z

24 tBodyGyro-std()-X

25 tBodyGyro-std()-Y

26 tBodyGyro-std()-Z

27 tBodyGyroJerk-mean()-X

28 tBodyGyroJerk-mean()-Y

29 tBodyGyroJerk-mean()-Z

30 tBodyGyroJerk-std()-X

31 tBodyGyroJerk-std()-Y

32 tBodyGyroJerk-std()-Z

33 tBodyAccMag-mean()

34 tBodyAccMag-std()

35 tGravityAccMag-mean()

36 tGravityAccMag-std()

37 tBodyAccJerkMag-mean()

38 tBodyAccJerkMag-std()

39 tBodyGyroMag-mean()

40 tBodyGyroMag-std()

41 tBodyGyroJerkMag-mean()

42 tBodyGyroJerkMag-std()

43 fBodyAcc-mean()-X

44 fBodyAcc-mean()-Y

45 fBodyAcc-mean()-Z

46 fBodyAcc-std()-X

47 fBodyAcc-std()-Y

48 fBodyAcc-std()-Z

49 fBodyAccJerk-mean()-X

50 fBodyAccJerk-mean()-Y

51 fBodyAccJerk-mean()-Z

52 fBodyAccJerk-std()-X

53 fBodyAccJerk-std()-Y

54 fBodyAccJerk-std()-Z

55 fBodyGyro-mean()-X

56 fBodyGyro-mean()-Y

57 fBodyGyro-mean()-Z

58 fBodyGyro-std()-X

59 fBodyGyro-std()-Y

60 fBodyGyro-std()-Z

61 fBodyAccMag-mean()

62 fBodyAccMag-std()

63 fBodyBodyAccJerkMag-mean()

64 fBodyBodyAccJerkMag-std()

65 fBodyBodyGyroMag-mean()

66 fBodyBodyGyroMag-std()

67 fBodyBodyGyroJerkMag-mean()

68 fBodyBodyGyroJerkMag-std()

