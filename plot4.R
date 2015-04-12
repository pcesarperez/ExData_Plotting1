# plot4.R
# Fourth plot (a grid of four plots).
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
# 	`PLOT_X_LABEL_1`: Label of the X axis for the first plot.
# 	`PLOT_X_LABEL_2`: Label of the X axis for the second plot.
# 	`PLOT_X_LABEL_3`: Label of the X axis for the third plot.
# 	`PLOT_X_LABEL_4`: Label of the X axis for the fourth plot.
# 	`PLOT_Y_LABEL_1`: Label of the Y axis for the first plot.
# 	`PLOT_Y_LABEL_2`: Label of the Y axis for the second plot.
# 	`PLOT_Y_LABEL_3`: Label of the Y axis for the third plot.
# 	`PLOT_Y_LABEL_4`: Label of the Y axis for the fourth plot.
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
# 	`LEGEND_BOX_LINE_WIDTH`: Width of the line surrounding the legend box.
# 	`PLOT_REGION`: Region type of the plot grid ("m" for maximal region).
FILTERED_DATA_FILE <- "household_power_consumption_filtered.txt"
PNG_PLOT_FILE <- "plot4.png"
PNG_WIDTH <- 480
PNG_HEIGHT <- 480
SEPARATOR <- ";"
PLOT_X_LABEL_1 <- ""
PLOT_X_LABEL_2 <- "datetime"
PLOT_X_LABEL_3 <- ""
PLOT_X_LABEL_4 <- "datetime"
PLOT_Y_LABEL_1 <- "Global Active Power"
PLOT_Y_LABEL_2 <- "Voltage"
PLOT_Y_LABEL_3 <- "Energy sub metering"
PLOT_Y_LABEL_4 <- "Global_reactive_power"
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
LEGEND_BOX_LINE_WIDTH <- 0
PLOT_REGION <- "m"

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

# This is the actual plot, four graphs in a 2×2 grid.
# The `par ( )` function provides the needed setup (global layout and margins).
par (
	mfrow = c (2, 2),
	pty = PLOT_REGION,
	mar = c (5, 4, 4, 2)
)

with (filtered_data, {
	# First subgraph (global active power versus dat/time).
	plot (
		Date_time,
		Global_active_power,
		type = PLOT_TYPE,
		xlab = PLOT_X_LABEL_1,
		ylab = PLOT_Y_LABEL_1
	)

	# Second subgraph (voltage versus date/time).
	plot (
		Date_time,
		Voltage,
		type = PLOT_TYPE,
		xlab = PLOT_X_LABEL_2,
		ylab = PLOT_Y_LABEL_2
	)

	# Third subgraph (energy sub-meterings versus date/time).
	plot (
		Date_time,
		Sub_metering_1,
		type = NO_PLOT,
		xlab = PLOT_X_LABEL_3,
		ylab = PLOT_Y_LABEL_3
	)

	lines (
		Date_time,
		Sub_metering_1,
		type = PLOT_TYPE,
		col = PLOT_COLOR_METERING_1
	)

	lines (
		Date_time,
		Sub_metering_2,
		type = PLOT_TYPE,
		col = PLOT_COLOR_METERING_2
	)

	lines (
		Date_time,
		Sub_metering_3,
		type = PLOT_TYPE,
		col = PLOT_COLOR_METERING_3
	)

	legend (
		x = LEGEND_POS,
		legend = c (LEGEND_METERING_1, LEGEND_METERING_2, LEGEND_METERING_3),
		col = c (PLOT_COLOR_METERING_1, PLOT_COLOR_METERING_2, PLOT_COLOR_METERING_3),
		lwd = LEGEND_LINE_WIDTH,
		box.lwd = LEGEND_BOX_LINE_WIDTH
	)

	# Fourth subgraph (global reactive power versus date/time).
	plot (
		Date_time,
		Global_reactive_power,
		type = PLOT_TYPE,
		xlab = PLOT_X_LABEL_4,
		ylab = PLOT_Y_LABEL_4
	)
})

# Closes the PNG file graphic device.
dev.off ( )