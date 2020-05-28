#Download

if (!file.exists("household_power_consumption.txt"))
{
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, "electric_power_consumption.zip", method = "curl")
  unzip("electric_power_consumption.zip")
}

#Read

dt <- read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 stringsAsFactors = FALSE,
                 na.strings = "?")

subdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007"), ]
  
#Convert

subdt$Date <- as.Date(subdt$Date, format = "%d/%m/%Y")

#Plot 1

png("plot1.png", width = 480, height = 480)

hist(subdt$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()