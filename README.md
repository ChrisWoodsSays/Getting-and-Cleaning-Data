---
title: "Coursera Getting and Cleaning Data Course Project"
author: "Chris Woods"
date: "10/15/2018"
---


## Overview

This analysis is based on data from the [Human Activity Recognition Using Smartphones Dataset](#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) which collected data from the accelerometer and gyroscope of the Samsung Galaxy S smartphone carried by 30 volunteer subjects performing different activities.

This repository contains the following files:

* `README.md`, this file, which provides an overview of the data set and how it was created.
* `tidy_human_activity.txt`, which contains the tidy data set.
* `human_activity_summary.txt`, which contains the mean measurements by activity and subject.
* `CodeBook.md`, the code book, describing the contents of the data set (data, variables and transformations used to generate the data).
* `run_analysis.R`, the R script that was used to create the data set


## Creating the Data Sets
Once the source data is downloaded, training and test data sets are merged, activity and subject data added and then mean and standard deviation variables extracted.  Supplied variable names were cleaned up with abbreviations expanded.  The resulting data set and a summary of means by activity and subject are extracted to text files.

The R script can be used to create the two data sets using the following steps:

1. Download Zip Files
2. Determine paths and file names of various source data files
3. Get and apply externally defined variable names
4. Get & Merge Train & Test Data
5. Combine Set, Subject and Activity Data
6. Create summary file, grouping by activity and subject, recording averages of each variable
7. Write tidy and summary data sets back to folder as text files

Required Libraries
* readr
* dplyr

The `tidy_human_activity.txt` and `human_activity_summary.txt` files were created using R version 5.1 a Mac with OSX El Capitan.