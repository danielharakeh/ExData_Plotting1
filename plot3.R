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
datetime <- paste(subdt$Date, subdt$Time)
subdt$Date_time <- as.POSIXct(datetime)

#Plot 3

with(subdt, {
  plot(Sub_metering_1~Date_time,
       type="l",
       ylab="Energy Sub Metering",
       xlab="")
  lines(Sub_metering_2~Date_time,col="red")
  lines(Sub_metering_3~Date_time,col="blue")
})

legend("topright",
       col=c("black", "red", "blue"),
       lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()