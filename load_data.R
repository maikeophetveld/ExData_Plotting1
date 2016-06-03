# Load data
power <- read.table("household_power_consumption.txt", header=T, sep=";")

# Set date column as date
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Filter data on dates
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

# Set necessary columns as numeric
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

# Create date time
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")