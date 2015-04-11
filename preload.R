# preload.R
# Filters out the raw data to extract the specific subset to plot.
# Course: Exploratory Data Analysis.
# Data Science Specialization.
# First course project.
# Author: Pablo César Pérez González (pcesarperez@gmail.com)


# Constants.
# 	`DATA_IN_FILE`: Main data filename.
# 	`DATA_OUT_FILE`: Filename of the filtered data subset.
# 	`SEPARATOR`: Character used to separate data in the main file.
# 	`FILTER_QUERY`: Query used to subset the data to work with.
# 	`DATE_TIME_FORMAT`: Format of the date/time column we need to create in the data frame.
# 	`TIME_ZONE`: Empty string to represent the current time zone.
DATA_IN_FILE <- "household_power_consumption.txt"
DATA_OUT_FILE <- "household_power_consumption_filtered.txt"
SEPARATOR <- ";"
FILTER_QUERY <- "select * from file where ((Date = '1/2/2007') or (Date = '2/2/2007'))"
DATE_TIME_FORMAT <- "%d/%m/%Y %H:%M:%S"
TIME_ZONE <- ""

# The package `sqldf` must be installed to filter the data while reading.
require (sqldf)

# We are going to extract the data corresponding to these dates: 01/02/2007 and 02/02/2007.
print ("Step 1: reading and filtering data file...")
data <- read.csv.sql (DATA_IN_FILE, sql = FILTER_QUERY, header = TRUE, sep = SEPARATOR, stringsAsFactors = FALSE)

# We are going to add a new column with the date/time of each observation.
# We also remove the date and time columns, as we don't need them any more.
print ("Step 2: creating a new date/time column...")
data$Date_time <- as.POSIXct (paste (data$Date, data$Time), tz = TIME_ZONE, DATE_TIME_FORMAT)
data$Date <- NULL
data$Time <- NULL

# Let's write the filtered data frame to a new file.
# This is a one-time process; once finished, the filtered dataset will contain the data to plot.
print ("Step 3: writing filtered data subset...")
connection = file (DATA_OUT_FILE, "w")
write.table (data, connection, quote = FALSE, row.names = FALSE, sep = SEPARATOR)
close (connection)