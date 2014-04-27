require (reshape2)

# Reads the activity-label file
read_activities <- function() {
    activities <- read.table("activity_labels.txt")
    activities$V2 = factor(x=activities$V2, levels=activities$V2)
    return (activities$V2)
}

# Reads the features file and filters columnnames for mean() and std() columns
read_features <- function() {
    features <- read.table("features.txt")
    toMatch <- c(".*mean\\(\\)", ".*std\\(\\)")
    wanted <- grep(paste(toMatch,collapse="|"), features$V2, value=TRUE)
    features2 <- subset(features, V2 %in% wanted)
    return (features2)
}

# Reads a data file. type is either "train" or "test". 
# Returns only the wanted features (columns).
# Also reads and merges the corresponding subject and activities .
read_data <- function(type, features) {
    pathData <- paste(type, "/X_", type,".txt", sep="")
    pathSubject <- paste(type, "/subject_", type,".txt", sep="")
    pathActivities <- paste(type, "/y_", type,".txt", sep="")
    data <- read.table(pathData)
    # Extract only the columns we are interested in
    newdata = data[,features$V1]
    names(newdata)<-features$V2
        
    subjects <- read.table(pathSubject)
    names(subjects) <- c("subject")
    activities <- read.table(pathActivities)
    names(activities) <- c("activity")
    
    allData <- cbind(newdata, subjects, activities)
    allData$activity <- as.factor(allData$activity)    
    allData$subject <- as.factor(allData$subject)    
    return (allData)
}


# Read the activity-labels
activities <- read_activities();
# Read the column names(features)
features <- read_features()

# Read the testdata, get only wanted features
testdata <- read_data("test", features)
# Read the traindata, get only wanted features
traindata <- read_data("train", features)

# Merge testdata and traindata together
data <- rbind(testdata, traindata)

# Make the activity-column readable
levels(data$activity) <- activities;

# group by subject and activity
df_melt <- melt(data, id = c("subject", "activity"))
# apply mean of all variables over all groups
tinydataset <- dcast(df_melt, subject + activity ~ variable, mean)

# write the tiny dataset
write.table(tinydataset, file="tidy.txt")

