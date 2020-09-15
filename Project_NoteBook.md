1. Merges the training and the test sets to create one data set.
================================================================

Read the files for load the data with the functions created, for perform
this task of form automatic for all the files with the measures of test
and train respectively.

The functions, load\_test() and load\_train, read each, the nine file
with the variables of test and train respectively, for each variable
create an data frame, having so, an data frame of nine observations
each, that is to say, an data frame of nine observation for the test and
an data frame of nine observation for the train.

**We load the functions.**

    source("load_test.R") 
    source("load_train.R")

**We execute the functions passing like parameter the route of the
folder what contain the files respectively and save the results in
variables with names descriptive.**

    Data_test <- load_test("UCI HAR Dataset/test/Inertial Signals")
    head(Data_test)

    ##   body_acc_x_test body_acc_y_test body_acc_z_test body_gyro_x_test
    ## 1      0.01165315     -0.02939904       0.1068262        0.4374637
    ## 2      0.01310909     -0.03972867       0.1524549        0.4682641
    ## 3      0.01126885     -0.05240586       0.2168462        0.4982574
    ## 4      0.02783073     -0.05210623       0.2025812        0.4793957
    ## 5      0.00231835     -0.04547036       0.1760102        0.3898935
    ## 6     -0.01896550     -0.03776361       0.1837697        0.3066510
    ##   body_gyro_y_test body_gyro_z_test total_acc_x_test total_acc_y_test
    ## 1        0.5313492       0.13652790         1.041216       -0.2697959
    ## 2        0.7210685       0.09762239         1.041803       -0.2800250
    ## 3        0.5203284       0.08355578         1.039086       -0.2926631
    ## 4        0.3726252       0.02286101         1.054768       -0.2923837
    ## 5        0.4145414      -0.02593917         1.028376       -0.2858257
    ## 6        0.3333279      -0.02714204         1.006216       -0.2782526
    ##   total_acc_z_test
    ## 1       0.02377977
    ## 2       0.07629271
    ## 3       0.14747540
    ## 4       0.13990610
    ## 5       0.11993410
    ## 6       0.13419480

    Data_train <- load_train("UCI HAR Dataset/train/Inertial Signals")
    head(Data_train)

    ##   body_acc_x_train body_acc_y_train body_acc_z_train body_gyro_x_train
    ## 1     0.0001808515      0.010766810       0.05556068        0.03019122
    ## 2     0.0101385600      0.006579480       0.05512483        0.04371071
    ## 3     0.0092755740      0.008928878       0.04840473        0.03568780
    ## 4     0.0050658970      0.007488683       0.04977497        0.04040210
    ## 5     0.0108102500      0.006140966       0.04301314        0.04709654
    ## 6     0.0040451010      0.006944317       0.04472929        0.05018473
    ##   body_gyro_y_train body_gyro_z_train total_acc_x_train total_acc_y_train
    ## 1        0.06601362       0.022858640          1.012817        -0.1232167
    ## 2        0.04269897       0.010315720          1.022833        -0.1268756
    ## 3        0.07485018       0.013249690          1.022028        -0.1240037
    ## 4        0.05731974       0.017751210          1.017877        -0.1249279
    ## 5        0.05234284       0.002553367          1.023680        -0.1257667
    ## 6        0.06917394       0.007724708          1.016974        -0.1244620
    ##   total_acc_z_train
    ## 1         0.1029341
    ## 2         0.1056872
    ## 3         0.1021025
    ## 4         0.1065527
    ## 5         0.1028135
    ## 6         0.1074931

2. Extracts only the measurements on the mean and standard deviation for each measurement.
==========================================================================================

In is section we used functions of the library “dplyr”

    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

**WE compute the mean for each variable in each data set.** *Means*

    mean_datatest <- sapply(Data_test, mean)
    mean_datatrain <- sapply(Data_train, mean)

**we create data frame with two rows, one for the mean of the test and
other with the mean of the train.**

    df_of_means <- mapply(list, mean_datatest, mean_datatrain, SIMPLIFY = TRUE) %>%                      data.frame(row.names = c("Mean test", "Mean train")) 
    df_of_means

    ##            body_acc_x_test body_acc_y_test body_acc_z_test body_gyro_x_test
    ## Mean test    -0.0007377533   -0.0003804008   -2.595182e-05      -0.01318509
    ## Mean train   -0.0006363031   -0.0002922969   -0.0002752994     0.0005064647
    ##            body_gyro_y_test body_gyro_z_test total_acc_x_test total_acc_y_test
    ## Mean test       0.001455401      0.002849609        0.8172633      0.004349351
    ## Mean train    -0.0008237808     0.0001129484        0.8047493       0.02875549
    ##            total_acc_z_test
    ## Mean test        0.08067055
    ## Mean train       0.08649802

**Standard deviation**

    sd_datatest <- sapply(Data_test, sd)
    sd_datatrain <- sapply(Data_train, sd)

**we create data frame with two rows, one for the standard deviation of
the test and other with the standard deviation the train.**

    df_of_sd <- mapply(list, sd_datatest, sd_datatrain, SIMPLIFY = TRUE) %>% 
         data.frame(row.names = c("Sd test", "Sd train"))
    df_of_sd

    ##          body_acc_x_test body_acc_y_test body_acc_z_test body_gyro_x_test
    ## Sd test          0.18431        0.120603      0.09553522        0.3965169
    ## Sd train       0.1948464       0.1224275       0.1068789        0.4068153
    ##          body_gyro_y_test body_gyro_z_test total_acc_x_test total_acc_y_test
    ## Sd test         0.3404457        0.2494163        0.4065131        0.4120411
    ## Sd train        0.3818545        0.2557433        0.4141122        0.3909956
    ##          total_acc_z_test
    ## Sd test         0.3079256
    ## Sd train         0.357769
