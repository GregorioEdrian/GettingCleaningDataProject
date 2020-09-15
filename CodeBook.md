

### Below, will be give an explanation about the variables, the data, and any transformations or work that you performed for work with the data.

### 1) The data.
##
          The data were download from the following link.
     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Were used the data registered in the files what is in the folder *Inertial Signal*, the which have route     "UCI HAR Dataset/test/Inertial Signals" y "UCI HAR Dataset/train/Inertial Signals", respectively for each activity, (test and train). In each folder there are nine *file.txt*, where each have the observations which are especified in the files *README.txt* and *feactures.txt* who are in the folder *UCI HAR Dataset* of the file *.zip* downloaded from the previous link.

### 2) Loading the data
##
The data were load with two functions call *load_test* and *load_train*, the which are specify in the scripts *load_test.R* and *load_train.R* respectively, the which is in the repository and are have an description of its contain, we highlight that these functions return a data frame for the nine observations (variables) of each activity, (test and train).\ \
For used of these functions be should pass like argument the route of the folder where is the files with the measurements, like is shown below, registering the data in a variable with a name descriptive.\ \


      Data_test <- load_test("UCI HAR Dataset/test/Inertial Signals") 
      head(Data_test)
     
      Data_train <- load_train("UCI HAR Dataset/train/Inertial Signals") 
      head(Data_train)

### 3) Computing the mean and standard deviation for each observation and each activity test  and train.
\
*In this section is need load the library dplyr*

    library(dplyr)
       
Were used functions *colMeans* for the compute of the means, for standard deviation the function *sapply*, with the parameter necessary for make the computes of each variable of *Data-test* and *Data_train* respectively, then were created a data frame for each measurement, mean and standard deviation.\
\
*Computing means and Creating data frame*

    mean_datatest <- as.vector(colMeans(Data_test))
    mean_datatrain <- as.vector(colMeans(Data_train))
    names_df <- names(Data_test) %>% gsub(pattern = "_test",replacement ="")
    df_means_test_train <- data.frame("Activiti"=names_df,"MeanTest"=mean_datatest, "MeanTrain"=mean_datatrain)
*Computing standard deviation and Creating data frame*

    sd_datatest <- as.vector(sapply(Data_test, sd))
    sd_datatrain <- as.vector(sapply(Data_train, sd))
    df_sd_test_train <- data.frame("Activiti"=names_df,"MeanTest"=sd_datatest, "MeanTrain" =sd_datatrain)
        
### 4) A text file is created with the averages.

    write.table(df_means_test_train, file = "meanTestTrain.txt", row.names = FALSE)

