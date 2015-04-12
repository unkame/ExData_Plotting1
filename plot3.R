  ## Getting full dataset
  data_all <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
  
  ## Extract the data from Date 2007/02/01 to 2007/02/02
  data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(data_all)
  
  ## Date Time Transformation
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)
  
  ## Plotting Plot 3
  with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
  })
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd=2.5, col=c("black", "red", "blue"), cex = 0.60)
  
  ## Save file
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
