# Project Code Book

# Input Data

The data for the project is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The full description of the data is located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and also in the README.txt file located in the zip download.

The data can be sumarised as follows:

1. Raw set of measurements for two sets, one for "test" data and the other for "training" data:
  * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
  * Triaxial Angular velocity from the gyroscope. 
  * A 561-feature vector with time and frequency domain variables.
  * Its activity label. 
  * An identifier of the subject who carried out the experiment.
2. A list of "features". This a descriptive representation of each measurement in the raw data file.
3. A list of "activities". These are:
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

# Variables and Transformations

The data frame variables are sumarised as:
* Variables starting with "test" relate to the test data set:
  - testFrame: Loading of raw measurements from file ".\UCI HAR Dataset\test\X_test.txt".
  - testLabelFrame: Loading of test labels from file ".\UCI HAR Dataset\test\y_test.txt".
  - testSubjectFrame: Loading of test subjects from file ".\UCI HAR Dataset\test\subject_test.txt".
* Variables starting with "train" relate to the training data set:
  - trainFrame: Loading of raw measurements from file ".\UCI HAR Dataset\train\X_train.txt".
  - trainLabelFrame: Loading of training labels from file ".\UCI HAR Dataset\train\y_train.txt".
  - trainSubjectFrame: Loading of training subjects from file ".\UCI HAR Dataset\train\subject_train.txt".
* Activities and feature which related to both data sets are contained in the following variable:
  - activityLabelFrame: Loading activity labels from file ".\UCI HAR Dataset\activity_labels.txt".
  - featuresFrame: Loading features from file ".\UCI HAR Dataset\features.txt".
* Variables starting with "merged" relate to the merging of the test and training data sets:
  - mergedLabelFrame: Merge of testLabelFrame and trainLabelFrame.
  - mergedSubjectFrame: Merge of testSubjectFrame and trainSubjectFrame.
  - mergedFrame: Merge of testFrame and trainFrame with user-friendly "subject" and "activity" columns.

Once the mergedFrame was constructed the following additional transformations were made:

1. All measurements expect for those containing "mean()" and "std()" were removed. This was because we are only interested in the mean and standard deviation measurements.
2. A tidy data set was constructed. This is the mean (average) for each measurement feature for each activity and each subject.
  
# Output Data

The script produces the file ".\UCI_means.txt" which contains the tidy data set.

