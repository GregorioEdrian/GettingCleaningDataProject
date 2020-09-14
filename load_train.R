load_train <- function(x){
        ## This function receive which argument the route of the folder where is the files of names:
        ##
        ## body_acc_x_train.txt, body_acc_y_train.txt ,body_acc_z_train.txt,
        ## body_gyro_x_train.tx, body_gyro_y_train.txt, body_gyro_z_train.txt,
        ## total_acc_x_train.txt, total_acc_y_train.txt, total_acc_z_train.txt.
        ##
        ## this function return a data frame with the data of this files where each column of the data
        ## frame contain the data of each file respectively.
        ##
        ##
        ## First is create two variables for create the names of the files.
        
     axialtrain <- c("_x_train.txt","_y_train.txt","_z_train.txt") ## axis of the activities.
     descriproutData <- c("body_acc", "body_gyro", "total_acc") ## activities
    
     ## Are created part of the route to each  of the files and are stored within a vector. 
     ## For example, "UCI HAR Dataset/test/Inertial Signals/_x_train.txt"
     descripData <- c()
     for (i in descriproutData) {
          frtroutefile <- paste(x,"/",i, sep = "")
          descripData <- c(descripData, frtroutefile)
          
     }
     
     
     routefile <- c() ## Will be stored the route definitely
     namefile <- c()  ## Will be stored only the names of each file for each route.
     variablelist <- list()  ## Will be stored the names of each variable.
     ##
     ## Are created the route complete for each archive, for example
     ## "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
     
     for (i in descripData) {
          for (j in axialtrain) {
               pre <- strsplit(i, "/")
               max_pre <- length(pre[[1]])
               pre <- pre[[1]][max_pre]
               
               routefile <- c(routefile, paste(i,j, sep = ""))
               namecolvariable <- paste(pre, strsplit(j, "\\.")[[1]][1], sep = "")
               namefile <- c(namefile, namecolvariable)
          }
     }  
     
     count <- 0 ## Counter that will hep to know the file that being read
     ## the files are read and are stored in a list with their names of file without its extension,
     ## so we obtained a list with all the information of the files.
     for (i in routefile) {
          count <- count+1
          x <- scan(i, what = double(), sep = " ")
          x <- x[!is.na(x)]
          namevariable <- namefile[count]
          variablelist[[namevariable]] <- x
     }
     
     ## is obtained a data frame from of the list.
     data.frame(variablelist)
     
}