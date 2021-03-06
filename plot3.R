##
## Plot 3
##

# Downloading data

if (!file.exists("HWdata.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "HWdata.zip")
}

# Unzipping data

if (!file.exists("household_power_consumption.txt")) {
    unzip("HWdata.zip")
}

# Reading data

header <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 1, stringsAsFactors = FALSE)
elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2880, skip = 66636, col.names = header)
elec$DateTime <- strptime(paste(elec$Date,elec$Time), format = "%d/%m/%Y%H:%M:%S")

# Construction of plot

png("plot3.png")
plot(elec$DateTime, elec$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(elec$DateTime, elec$Sub_metering_2, col = 2)
lines(elec$DateTime, elec$Sub_metering_3, col = 4)
legend("topright", legend = names(elec)[7:9], lty = 1, col = c(1, 2, 4))
dev.off()