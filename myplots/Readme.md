#Instructions

This directory contains all the files a indicated in the assignment.

There's one additional script: "loadData.R". Its sole purpose is to initialize 
the data frame the plotting scripts use for processing.
It will be run only once. After that, the script checks if the data frame 
variable exists. If so, the rest of the code is ignored.

For loadData.R to work correctly, two conditions have to be met:

- The library "sqldf" *must* be installed on the system, and,
- The data file ("household_power_consumption.txt") *must exits* in the *same* directory

