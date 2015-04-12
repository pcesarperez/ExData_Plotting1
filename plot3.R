# plot3.R
# Third plot (energy sub-metering per day).
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
# 	`NO_PLOT`: Type of the blank plot which will hold the lines.
# 	`PLOT_TYPE`: Type of the plot ("l" for a line plot).
# 	`PLOT_COLOR_METERING_1`: Color for the first subgraph.
# 	`PLOT_COLOR_METERING_2`: Color for the second subgraph.
# 	`PLOT_COLOR_METERING_3`: Color for the third subgraph.
# 	`LEGEND_METERING_1`: Legend for the first subgraph.
# 	`LEGEND_METERING_2`: Legend for the second subgraph.
# 	`LEGEND_METERING_3`: Legend for the third subgraph.
# 	`LEGEND_LINE_WIDTH`: Line with of the legend markers.
# 	`LEGEND_POS`: Legend position.
FILTERED_DATA_FILE <- "household_power_consumption_filtered.txt"
PNG_PLOT_FILE <- "plot3.png"
PNG_WIDTH <- 480
PNG_HEIGHT <- 480
SEPARATOR <- ";"
PLOT_X_LABEL <- ""
PLOT_Y_LABEL <- "Energy sub metering"
NO_PLOT <- "n"
PLOT_TYPE <- "l"
PLOT_COLOR_METERING_1 <- "black"
PLOT_COLOR_METERING_2 <- "red"
PLOT_COLOR_METERING_3 <- "blue"
LEGEND_METERING_1 <- "Sub_metering_1"
LEGEND_METERING_2 <- "Sub_metering_2"
LEGEND_METERING_3 <- "Sub_metering_3"
LEGEND_LINE_WIDTH <- 1
LEGEND_POS <- "topright"

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

# This is the actual plot, three line graphs (date/time versus sub metering).
with (filtered_data, {
	plot (Date_time, Sub_metering_1, type = NO_PLOT, xlab = PLOT_X_LABEL, ylab = PLOT_Y_LABEL)
	lines (Date_time, Sub_metering_1, type = PLOT_TYPE, col = PLOT_COLOR_METERING_1)
	lines (Date_time, Sub_metering_2, type = PLOT_TYPE, col = PLOT_COLOR_METERING_2)
	lines (Date_time, Sub_metering_3, type = PLOT_TYPE, col = PLOT_COLOR_METERING_3)
	legend (
		x = LEGEND_POS,
		legend = c (LEGEND_METERING_1, LEGEND_METERING_2, LEGEND_METERING_3),
		col = c (PLOT_COLOR_METERING_1, PLOT_COLOR_METERING_2, PLOT_COLOR_METERING_3),
		lwd = LEGEND_LINE_WIDTH
	)
})

# Closes the PNG file graphic device.
dev.off ( )