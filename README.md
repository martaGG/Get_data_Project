Get_data_Project
================

## Project for class "Getting and Cleaning data" the coursera data science specialization

### Repository Contains
* runAnalysis.R: the script that generates a text file with tidy data 
* README.md: description of the repository, input, output and script

### Instructions to use the script

The script runAnalysis.R takes as input the zip file of Samsung data (downloaded from [this link] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)),that must be in a file called "getdata-projectfiles-UCI HAR Dataset.zip" in the same directory of the script. It also works if the zip file was already unzipped in that same directory with the default names.
 
The unzipped original data come as a directory with files for the description of the features, the feature names and the activity labels, and two folders (one corresponding to the training set and other to the test set) containing files with the actual measured data, and the derived features, subjects and activities.  

### The input features
As can be read in the file in the data folder features.info, the original features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions).


- **tBodyAcc-XYZ** : XYZ component of the time domain body acceleration   
- **GravityAcc-XYZ**: XYZ component of the time domain gravity acceleration
- **tBodyAccJerk-XYZ**: XYZ component of the time domain body acceleration jerk
- **tBodyGyro-X(Y,Z)**: XYZ component of the time domain body angular velocity
- **tBodyGyroJerkXYZ**: XYZ component of the time domain body angular velocity
- **tBodyAccMag**: Magnitude of the time domain body acceleration
- **tGravityAccMag**: Magnitude of the time domain gravity acceleration
- **tBodyAccJerkMag**: Magnitude of the time domain body acceleration jerk
- **tBodyGyroMag**: Magnitude of the time domain body angular velocity
- **tBodyGyroJerkMag**: Magnitude of the time domain body angular velocity jerk
- **fBodyAcc-XYZ**: XYZ component of the freq. domain body acceleration
- **fBodyAccJerk-XYZ**: XYZ component of the freq. domain body acceleration jerk
- **fBodyGyro-XYZ**: XYZ component of the freq. domain body angular velocity
- **fBodyAccMag**: Magnitude of the freq domain body acceleration
- **fBodyAccJerkMag**: Magnitude of the freq domain body acceleration jerk
- **fBodyGyroMag**: Magnitude of the freq domain body angular velocity
- **fBodyGyroJerkMag**: Magnitude of the freq domain body angular velocity jerk

Then some funtions were applied to each of these variables to obtain the features that we will use as input. These are listed next to the key added to the feature name:

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMeant 
tBodyGyroJerkMean

The previously described set of features is loaded by the script run_analysis.R

The complete list of features is in the file features.txt, and the features themselves are in the X_train.txt and X_test.txt files in the train and test folders. Also, the files y_train.txt and y_test.txt contain the activities of each observation noted as numbers from 1 to 6, the corresponding table in the file activity_labels.txt. The subject information is in the files subject_test.txt and subject_train.txt, as numbers ranging from 1 to 30. 

### The output features
The output of the script is a file called Tidy_MeanStd_avgActSub.txt containing only the std and mean data from the original variables (both for the test and train set), averaged by activity and by subject. The names and descriptions of the variables associated to the mean are:

- "Averaged_by": factor containing the activity or subject used to calculate each average.                  
- "tBodyAcc-mean()-X": Average of the X comp of the mean of the time body acceleration.              
- "tBodyAcc-mean()-Y": Avgerage of the Y comp of the mean of the time body acceleration.                  
- "tBodyAcc-mean()-Z": Average of the z comp of the mean of the time body acceleration.                  
- "tGravityAcc-mean()-X": Average of the X comp of the mean of the time gravity acceleration.                   
- "tGravityAcc-mean()-Y": Average of the Y comp of the mean of the time gravity acceleration.             
- "tGravityAcc-mean()-Z": Average of the Z comp of the mean of the time gravity acceleration.             
- "tBodyAccJerk-mean()-X":Average of the X comp of the mean of the time body acceleration jerk.               
- "tBodyAccJerk-mean()-Y":Average of the Y comp of the mean of the time body acceleration jerk.                 
- "tBodyAccJerk-mean()-Z":Average of the Z comp of the mean of the time body acceleration jerk.                 
- "tBodyGyro-mean()-X":Average of the X comp of the mean of the time body angular velocity.                     
- "tBodyGyro-mean()-Y":Average of the Y comp of the mean of the time body angular velocity.               
- "tBodyGyro-mean()-Z":Average of the Z comp of the mean of the time body angular velocity.             
- "tBodyGyroJerk-mean()-X":Average of the X comp of the mean of the time body angular velocity jerk.            
- "tBodyGyroJerk-mean()-Y": Average of the Y comp of the mean of the time body angular velocity jerk.           
- "tBodyGyroJerk-mean()-Z": Average of the Z comp of the mean of the time body angular velocity jerk.            
- "tBodyAccMag-mean()": Average of the magnitude of the mean of the time body acceleration.            
- "tGravityAccMag-mean()": Average of the magnitude of the mean of the time gravity acceleration.               
- "tBodyAccJerkMag-mean()": Average of the magnitude of the mean of the time body acceleration jerk.               
- "tBodyGyroMag-mean()": Average of the magnitude of the mean of the time body angular velocity.                   
- "tBodyGyroJerkMag-mean()":Average of the magnitude of the mean of the time body angular velocity jerk.       
- "fBodyAcc-mean()-X": Average of the X comp. of the mean of the freq body acceleration.             
- "fBodyAcc-mean()-Y":Average of the Y comp. of the mean of the freq body acceleration.                        
- "fBodyAcc-mean()-Z":Average of the Z comp. of the mean of the freq body acceleration.                         
- "fBodyAcc-meanFreq()-X": Average of the X comp. of the weighted mean in frequency of the freq body acceleration.                     
- "fBodyAcc-meanFreq()-Y": Average of the Y comp. of the weighted mean in frequency of the freq body acceleration.           
- "fBodyAcc-meanFreq()-Z": Average of the Z comp. of the weighted mean in frequency of the freq body acceleration.           
- "fBodyAccJerk-mean()-X": Average of the X comp. of the mean of the freq body acceleration jerk.          
- "fBodyAccJerk-mean()-Y": Average of the Y comp. of the mean of the freq body acceleration jerk.          
- "fBodyAccJerk-mean()-Z": Average of the X comp. of the mean of the freq body acceleration jerk.           
- "fBodyAccJerk-meanFreq()-X": Average of the X comp. of the weighted mean in frequency of the freq body acceleration jerk.      
- "fBodyAccJerk-meanFreq()-Y": Average of the Y comp. of the weighted mean in frequency of the freq body acceleration jerk.         
- "fBodyAccJerk-meanFreq()-Z": Average of the Z comp. of the weighted mean in frequency of the freq body acceleration jerk.        
- "fBodyGyro-mean()-X": Average of the X comp. of the mean of the freq body angular velocity.                
- "fBodyGyro-mean()-Y": Average of the Y comp. of the mean of the freq body angular velocity.           
- "fBodyGyro-mean()-Z": Average of the Z comp. of the mean of the freq body angular velocity.            
- "fBodyGyro-meanFreq()-X": Average of the X comp. of the weigthed mean in frequency of the freq body angular velocity.        
- "fBodyGyro-meanFreq()-Y": Average of the Y comp. of the weighted mean in frequency of the freq body angular velocity.         
- "fBodyGyro-meanFreq()-Z": Average of the Z comp. of the weighted mean in frequency of the freq body angular velocity.        
- "fBodyAccMag-mean()": Average of the magnitude of the mean of the freq body acceleration.             
- "fBodyAccMag-meanFreq()": Average of the magnitude of the weighted mean in frequency of the freq body acceleration.             
- "fBodyBodyAccJerkMag-mean()": Average of the magnitude of the mean of the freq body acceleration.          
- "fBodyBodyAccJerkMag-meanFreq()": Average of the magnitude of the weighted mean in frequency of the freq body acceleration.      
- "fBodyBodyGyroMag-mean()": Average of the magnitude of the mean of the freq body angular velocity.      
- "fBodyBodyGyroMag-meanFreq()": Average of the magnitude of the weigthed mean in frequency of the freq body angular velocity.       
- "fBodyBodyGyroJerkMag-mean()": Average of the magnitude of the mean of the freq body angular velocity jerk.      
- "fBodyBodyGyroJerkMag-meanFreq()": Average of the magnitude of the weighted mean in frequency of the freq body angular velocity jerk.  

As for the standard deviation, the variables are analogous to the above mentioned, subsituting the "-mean()" with "-std()"

The units of these features are the same as in the input: those of the output from the accelerator/gyroscope normalized to fit in the range [-1,1]

### Process used to create the tidy data
After reading the data associated to the features, activity, subject, and the labels for the features and activities, first of all the script merges the training and data sets, and adds the appropiate labels to the feautres. The activity and subject sets are factorized and also given proper names.

Then the data for the mean and standard deviation are separated, and averages by activity and subject are taken using the mean. These averaged frames are properly labeled and merged into one tidy data frame, which is finally saved into the output file.