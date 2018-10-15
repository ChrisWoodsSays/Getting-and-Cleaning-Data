# Code Book for Coursera Getting and Cleaning Data Course Project

## Summary

This code book relates to two datasets within this repository, tidy_human_activity.txt and human_activity_summary.txt.

See the README.md file of this repository for background information on this data set.

The source of data is described in the [Input Data](#input_data) section, the structure of the resultring data in the [Output Data](#output_data) section, its variables are listed in the [Variables](#variables) section and the transformations that were carried out to obtain the output data set based on the source data are presented in the [Transformations](#transformations) section.

## <a name="input_data"></a>Input Data

The source of this data is the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#). The data records experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## <a name="output_data"></a>Output Data

### Tidy Human Activity (tidy_human_activity.txt)

A text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the Variables section, and the following rows contain the values of these variables.

The dataset  has the following dimensions:


| Dimension | Size |
| --- | --- |
| Number of observations | 10,299 |
| Number of variables | 81 |

### Human Activity Summary (human_activity_summary.txt)

A further text file, containing space-separated values and first row, the names of variables.

Each row shows the mean values for a given Activity and Subject.
    
| Dimension | Size |
| --- | --- |
| Number of observations | 180 |
| Number of variables | 81 |

## <a name="variables"></a>Variables
### Identifiers
* `subject`

    Subject identifier, integer, ranges from 1 to 30.

* `activity`

    Activity identifier, string with 6 possible values:

    * WALKING: subject was walking
    * WALKING_UPSTAIRS: subject was walking upstairs
    * WALKING_DOWNSTAIRS: subject was walking downstairs
    * SITTING: subject was sitting
    * STANDING: subject was standing
    * LAYING: subject was laying
    
### Measurements
For the purposes of this assignment, for the measurement variables below, please refer to the [Input Data](#input_data) specification.

The body acceleration signal is obtained by subtracting the gravity from the total acceleration. The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
    
* Time Domain Measurements
    * `timeBodyAccelerometerMeanX`
    * `timeBodyAccelerometerMeanY`
    * `timeBodyAccelerometerMeanZ`
    * `timeBodyAccelerometerStandardDeviationX`
    * `timeBodyAccelerometerStandardDeviationY`
    * `timeBodyAccelerometerStandardDeviationZ`
    * `timeGravityAccelerometerMeanX`
    * `timeGravityAccelerometerMeanY`
    * `timeGravityAccelerometerMeanZ`
    * `timeGravityAccelerometerStandardDeviationX`
    * `timeGravityAccelerometerStandardDeviationY`
    * `timeGravityAccelerometerStandardDeviationZ`
    * `timeBodyAccelerometerJerkMeanX`
    * `timeBodyAccelerometerJerkMeanY`
    * `timeBodyAccelerometerJerkMeanZ`
    * `timeBodyAccelerometerJerkStandardDeviationX`
    * `timeBodyAccelerometerJerkStandardDeviationY`
    * `timeBodyAccelerometerJerkStandardDeviationZ`
    * `timeBodyGyroscopeMeanX`
    * `timeBodyGyroscopeMeanY`
    * `timeBodyGyroscopeMeanZ`
    * `timeBodyGyroscopeStandardDeviationX`
    * `timeBodyGyroscopeStandardDeviationY`
    * `timeBodyGyroscopeStandardDeviationZ`
    * `timeBodyGyroscopeJerkMeanX`
    * `timeBodyGyroscopeJerkMeanY`
    * `timeBodyGyroscopeJerkMeanZ`
    * `timeBodyGyroscopeJerkStandardDeviationX`
    * `timeBodyGyroscopeJerkStandardDeviationY`
    * `timeBodyGyroscopeJerkStandardDeviationZ`
    * `timeBodyAccelerometerMagnitudeMean`
    * `timeBodyAccelerometerMagnitudeStandardDeviation`
    * `timeGravityAccelerometerMagnitudeMean`
    * `timeGravityAccelerometerMagnitudeStandardDeviation`
    * `timeBodyAccelerometerJerkMagnitudeMean`
    * `timeBodyAccelerometerJerkMagnitudeStandardDeviation`
    * `timeBodyGyroscopeMagnitudeMean`
    * `timeBodyGyroscopeMagnitudeStandardDeviation`
    * `timeBodyGyroscopeJerkMagnitudeMean`
    * `timeBodyGyroscopeJerkMagnitudeStandardDeviation`
* Frequency Domain Measurements
    * `frequencyBodyAccelerometerMeanX`
    * `frequencyBodyAccelerometerMeanY`
    * `frequencyBodyAccelerometerMeanZ`
    * `frequencyBodyAccelerometerStandardDeviationX`
    * `frequencyBodyAccelerometerStandardDeviationY`
    * `frequencyBodyAccelerometerStandardDeviationZ`
    * `frequencyBodyAccelerometerMeanFrequencyX`
    * `frequencyBodyAccelerometerMeanFrequencyY`
    * `frequencyBodyAccelerometerMeanFrequencyZ`
    * `frequencyBodyAccelerometerJerkMeanX`
    * `frequencyBodyAccelerometerJerkMeanY`
    * `frequencyBodyAccelerometerJerkMeanZ`
    * `frequencyBodyAccelerometerJerkStandardDeviationX`
    * `frequencyBodyAccelerometerJerkStandardDeviationY`
    * `frequencyBodyAccelerometerJerkStandardDeviationZ`
    * `frequencyBodyAccelerometerJerkMeanFrequencyX`
    * `frequencyBodyAccelerometerJerkMeanFrequencyY`
    * `frequencyBodyAccelerometerJerkMeanFrequencyZ`
    * `frequencyBodyGyroscopeMeanX`
    * `frequencyBodyGyroscopeMeanY`
    * `frequencyBodyGyroscopeMeanZ`
    * `frequencyBodyGyroscopeStandardDeviationX`
    * `frequencyBodyGyroscopeStandardDeviationY`
    * `frequencyBodyGyroscopeStandardDeviationZ`
    * `frequencyBodyGyroscopeMeanFrequencyX`
    * `frequencyBodyGyroscopeMeanFrequencyY`
    * `frequencyBodyGyroscopeMeanFrequencyZ`
    * `frequencyBodyAccelerometerMagnitudeMean`
    * `frequencyBodyAccelerometerMagnitudeStandardDeviation`
    * `frequencyBodyAccelerometerMagnitudeMeanFrequency`
    * `frequencyBodyAccelerometerJerkMagnitudeMean`
    * `frequencyBodyAccelerometerJerkMagnitudeStandardDeviation`
    * `frequencyBodyAccelerometerJerkMagnitudeMeanFrequency`
    * `frequencyBodyGyroscopeMagnitudeMean`
    * `frequencyBodyGyroscopeMagnitudeStandardDeviation`
    * `frequencyBodyGyroscopeMagnitudeMeanFrequency`
    * `frequencyBodyGyroscopeJerkMagnitudeMean`
    * `frequencyBodyGyroscopeJerkMagnitudeStandardDeviation`
    * `frequencyBodyGyroscopeJerkMagnitudeMeanFrequency`

## <a name="transformations"></a>Transformations
The zip file containing the source data can be found at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The following transformations were then applied to the data:

1. The training and test data sets were appended to each other to create one data set.
2. The measurement variable names defined within features.txt were applied.
3. Measurement variable names were cleaned up (special charactyers and typos removed, abbrevaiations expanded) 
4. Only measurement variables containing means and standard deviations (taken as those containing 'mean' or 'std') were extracted, with all other variables discarded.
5. Variables for the subject and activity being measured were added from the suject (subject_) and activity (y_) files.
6. A further data set was created to record the mean values of each measurement, for each activity and subject.
7. The data sets were written out to text files as specified in the [Output Data](#output_data) section.

The download of the source data and the transformations listed above were implemented by the run_analysis.R R script (see README.md file for usage instructions).

## License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


