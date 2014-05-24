#script for the creation of tidy data

#unzip the data (if necessary) and read the data files: 
# test/train features, test/train subjects, test/train activities,
# feature names, activity names


if(!file.exists("./UCI HAR Dataset/")){
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}
pathtrain <- "./UCI HAR Dataset/train/"
pathtest  <-"./UCI HAR Dataset/test/"
FeatTrain<-read.table(paste(pathtrain,"X_train.txt", sep=""))
FeatTest<-read.table(paste(pathtest,"X_test.txt", sep=""))
SubjTrain<-read.table(paste(pathtrain,"subject_train.txt", sep=""))
SubjTest<-read.table(paste(pathtest,"subject_test.txt", sep=""))
ActivTrain<-read.table(paste(pathtrain,"y_train.txt", sep=""))
ActivTest<-read.table(paste(pathtest,"y_test.txt", sep=""))
features<-read.table("UCI HAR Dataset/features.txt")
labels<-read.table("UCI HAR Dataset/activity_labels.txt")

#rename columns of features so they are descriptive
colnames(FeatTrain)<-features[,2]
colnames(FeatTest)<-features[,2]

#append test to train data frames of features, subjects and activities
FeatTot<-rbind(FeatTrain,FeatTest)
ActivTot<-rbind(ActivTrain,ActivTest)
SubjTot<-rbind(SubjTrain,SubjTest)

#activities and subjects as factors, activity levels as activity names
ActivTot[,1]<-as.factor(ActivTot$V1)
colnames(ActivTot)<-"Activity"
levels(ActivTot$Activity)<-paste("activity =",labels$V2)

SubjTot[,1]<-as.factor(SubjTot$V1)
colnames(SubjTot)<-"Subject"
levels(SubjTot$Subject)<-(paste("subject =",levels(SubjTot$Subject)))

#create a dataframe only with the mean/std.dev values 
medi<-grepl("mean",colnames(FeatTot),fixed=T)
stddev<-grepl("std",colnames(FeatTot),fixed=T)
FeatMeanStd<-cbind(FeatTot[,medi],FeatTot[,stddev])

#create dataframes with averages by subject and activity
#of the mean/std dev values and merge in one tidy dataset
avgSubj<-aggregate(FeatMeanStd,by=list(SubjTot$Subject),mean)
colnames(avgSubj)[1]<-"Averaged_by"

avgActiv<-aggregate(FeatMeanStd,by=list(ActivTot$Activity),mean)
colnames(avgActiv)[1]<-"Averaged_by"

avgTot<-rbind(avgActiv,avgSubj)

#write the tidy dataframe into a text file
write.table(avgTot,file="Tidy_MeanStd_avgActSub.txt")

#zip("TidyData.zip",files=c("Feat_MeanStddev_AvgByActiv.txt","Feat_MeanStddev_AvgBySubj.txt"))
#file.remove("Feat_MeanStddev_AvgByActiv.txt","Feat_MeanStddev_AvgBySubj.txt")