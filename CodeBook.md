\

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


     > Data_test <- load_test("UCI HAR Dataset/test/Inertial Signals") 
     > head(Data_test)
     
     > Data_train <- load_train("UCI HAR Dataset/train/Inertial Signals") 
     > head(Data_train)

### 3) Computing the mean and standard deviation for each observation and each activity test  and train.
\
Were used functions *apply* for the compute of the means y standard deviation for each variable of *Data-test* and *Data_train* respectively, then were created a data frame for each measurement, mean and standard deviation.\
\
*Computing means and Creating data frame*

          mean_datatest <- sapply(Data_test, mean)
          mean_datatrain <- sapply(Data_train, mean)
          df_of_means <- mapply(list, mean_datatest, mean_datatrain, SIMPLIFY = TRUE) %>% 
                         data.frame(row.names = c("Mean test", "Mean train"))
               
*Computing standard deviation Creating data frame*

          sd_datatest <- sapply(Data_test, sd)
          sd_datatrain <- sapply(Data_train, sd)
          df_of_sd <- mapply(list, sd_datatest, sd_datatrain, SIMPLIFY = TRUE) %>% 
                      data.frame(row.names = c("Sd test", "Sd train"))


