This directory is used to process the data we got from matlab. 

The input data, in a format of matlab, inlcudes the S output, Sd output, Extracted matlab data, and reactivity data we processed. Each data has its own utlity and we would introduce how we used out python script to analysis the data.

We design our scripts by the logics of 1) creating a csv data from the matlab, and 2) plot the time series. For the first pursose, we used script named as *MASTER*. For the second purpose, we used scripts named as Analysis*. For running both scripts, we designed a couple of helper functions to make our scripts more concise, which is a directory called "F0AM_helper".


Common adjustion to the code and correspondign solution
1) Want to add a new (lumping) speice to the observaion?
    - WE-CAN: go to Flight_transect_csv_reader.py and follow the process in get_obs_df function (e.g., append names and assign values)
    - DISCOVER-AQ: go to DP_PLOT_MASTER_Reduced_v4.ipynb (for example)
    - FIREX-AQ: no need for now
1.1) The mapping is incosnistent? 
    - adding species if they are not the list of "Flight_transect_csv_reader.py"
 