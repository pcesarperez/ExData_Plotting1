# plot2.R
# Second plot (global active power per day).
# Course: Exploratory Data Analysis.
# Data Science Specialization.
# First course project.
# Author: Pablo César Pérez González (pcesarperez@gmail.com)


# Constants
# 	`FILTERED_DATA_FILE`: Filtered data filename.
# 	`PNG_PLOT_FILE`: Filename of the PNG file which will hold the plot.
# 	`PNG_WIDTH`: Width of the PNG file.
# 	`PNG_HEIGHT`: Height of the PNG file.
# 	`SEPARATOR`: Character used to separate data in the filtered data file.
# 	`PLOT_X_LABEL`: Label of the X axis.
# 	`PLOT_Y_LABEL`: Label of the Y axis.
# 	`PLOT_TYPE`: Type of the plot ("l" for a line plot).
FILTERED_DATA_FILE <- "household_power_consumption_filtered.txt"
PNG_PLOT_FILE <- "plot2.png"
PNG_WIDTH <- 480
PNG_HEIGHT <- 480
SEPARATOR <- ";"
PLOT_X_LABEL <- ""
PLOT_Y_LABEL <- "Global Active Power (kilowatts)"
PLOT_TYPE <- "l"

# Reads the filtered data to plot.
# It is important to read the date/time column in POSIXct format.
data_file <- file (FILTERED_DATA_FILE, "r")
filtered_data <- read.table (
	data_file,
	header = TRUE,
	sep = SEPARATOR,
	stringsAsFactors = FALSE,
	colClasses = c ("Date_time" = "POSIXct")
)
close (data_file)

# Creates a PNG file graphic device to hold the plot.
png (filename = PNG_PLOT_FILE, width = PNG_WIDTH, height = PNG_HEIGHT)

# This is the actual plot, a line graph (date/time versus global active power consumption).
plot (filtered_data$Date_time, filtered_data$Global_active_power, type = PLOT_TYPE, xlab = PLOT_X_LABEL, ylab = PLOT_Y_LABEL)

# Closes the PNG file graphic device.
dev.off ( )