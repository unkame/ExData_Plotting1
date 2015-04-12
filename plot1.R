  ## Get full data
  data_all <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
  
  ## Extract the data from Date 2007/02/01 to 2007/02/02
  data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  ## Release full data
  rm(data_all)
  
  ## Date Time Transformation
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)
  
  ## Plotting plot 1
  hist(data$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  
  ## Save file
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
  
  
