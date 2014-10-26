Tidy Data From Human Activity Recognition Using Smartphone Datasets
===============================

The data was transformed in the following steps:

1. Feature and Activity names were read into separate data sets
2. Subjects were read into a data set
3. Test and training data were read into separate data sets using column names from the Features data set and merged with the subject and activity data sets
4. Test and training data were merged into one data set
5. Mean and Standard Deviation columns were identified using a regex to create a subset of the combined data with Subject, Activity, and measurements
6. Variable column names were tidied up
7. A table of mean values was created in "wide format"  

The tidy data set has been written to **tidyMeans.txt**. Details of the variables can be found in **CodeBook.md**. The variables follow a basic naming convention:

{Time | Frequency}{Measurement}{Mean | StdDev}{X Y Z}

Time or Frequency indicates the domain. Measurement is one of the original features. Mean or StdDev indicates the aggregation of the feature.  X, Y, or Z indicates the axis along which the measurement was taken.