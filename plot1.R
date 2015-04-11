# plot1.R
# First plot (global active power histogram).
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
# 	`PLOT_TITLE`: Title of the plot.
# 	`PLOT_COLOR`: Color of the histogram bars.
# 	`PLOT_X_LABEL`: Label of the X axis.
FILTERED_DATA_FILE <- "household_power_consumption_filtered.txt"
PNG_PLOT_FILE <- "plot1.png"
PNG_WIDTH <- 480
PNG_HEIGHT <- 480
SEPARATOR = ";"
PLOT_TITLE <- "Global Active Power"
PLOT_COLOR <- "red"
PLOT_X_LABEL <- "Global Active Power (kilowatts)"


# Reads the filtered data to plot.
data_file <- file (FILTERED_DATA_FILE, "r")
filtered_data <- read.table (data_file, header = TRUE, sep = SEPARATOR)
close (data_file)

# Creates a PNG file graphic device to hold the plot.
png (filename = PNG_PLOT_FILE, width = PNG_WIDTH, height = PNG_HEIGHT)

# This is the actual plot, an histogram.
hist (filtered_data$Global_active_power, main = PLOT_TITLE, col = PLOT_COLOR, xlab = PLOT_X_LABEL)

# Closes the PNG file graphic device.
dev.off ( )