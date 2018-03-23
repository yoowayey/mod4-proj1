# Exploratory Data Analysis - Course Project 1

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, the "Individual household electric power consumption" data set was used.

The descriptions of the 9 variables in the data set taken from the UCI web site are as follows:

1. **Date** : Date in format dd/mm/yyyy
2. **Time** : time in format hh:mm:ss
3. **Global_active_power**: household global minute-averaged active power (in kilowatt)
4. **Global_reactive_power** : household global minute-averaged reactive power (in kilowatt)
5. **Voltage** : minute-averaged voltage (in volt)
6. **Global_intensity** : household global minute-averaged current intensity (in ampere)
7. **Sub_metering_1** : energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. **Sub_metering_2** : energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. **Sub_metering_3** : energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

### Objective:
To examine how household energy usage varies over a 2-day period in February 2007. By using the base plotting system, plots were constructed in R.

### Further notes:
* Because the data set is very large, the row number was identified before reading it in R and used it to select only the necessary data.

* Data from the dates 2007-02-01 and 2007-02-02 only were used. 

* When loading the Rscript, it is assumed that the file ("hpc.txt") is already in the working directory.
