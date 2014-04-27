Getting and cleaning data assesment
===================================

This is my repository for the Coursera "Getting-And-Cleaning-Data" Peer-Assesment.

## Prerequisites

After downloading and unzipping the data archive "getdata-projectfiles-UUCI HAR Dataset.zip"
from the assessment-page, you end up with a directory "UCI HAR Dataset". Please make
sure that your working directory is set to this directory, for example:

setwd("/home/michael/coursera/UCI HAR Dataset")

A call of list.files() should give you the following entries:

[1] "activity_labels.txt" "features_info.txt"   "features.txt"        "README.txt"          "test"                "train"


## Running run_analysis.R

Running the script results with the file "tidy.txt" in the current working directory. This is the required
output as described in Peer Assessment Description. The format and used transformations are described
in the CodeBook.md. It makes use of the reshape2 package, there are no other dependencies or R scripts to use.
