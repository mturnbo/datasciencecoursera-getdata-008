Tidy Data From Human Activity Recognition Using Smartphones Dataset
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

Mean{timeOrFreq}{measurement}{meanOrStd}{XYZ}