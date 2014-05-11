plot4 <- function(){
  
  # Grepping for those line numbers whose date is either 1/2/2007 or 2/2/2007
  relevantLineNumbers <- grep('^[1-2]/2/2007', readLines("./household_power_consumption.txt"))
  
  # Now getting the subset of data by using the read.table function
  data <- read.table(file="./household_power_consumption.txt", sep=";", skip = relevantLineNumbers[1]-1, nrows = length(relevantLineNumbers)-1, stringsAsFactors=FALSE, header=TRUE)
  
  # Now getting the header values from the original file and assigning them as the header in the subset of data
  headerdata <- read.table(file="./household_power_consumption.txt", sep=";", nrows = 1, stringsAsFactors=FALSE, header=FALSE)
  names(data)<-headerdata
  
  # Now parsing dates fromt eh data subset
  dates <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  # Setting mfrow
  par(mfcol=c(2,2))

  # Now plotting with type=n
  plot(dates, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
  
  # Now creating first graph
  lines(dates, data$Global_active_power)
  
  # Now plotting with type=n
  plot(dates, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  
  # Now creating second graph
  lines(a, data$Sub_metering_1)
  lines(a, data$Sub_metering_2, col="red")
  lines(a, data$Sub_metering_3, col="blue")
  
  # Now adding legend
  legend("topright", pch=NA, lwd=1, col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "sub_metering_3"), cex=0.1, pt.cex=20, bty="n", text.font=50)

  # Now plotting with type=n
  plot(dates, data$Voltage, type="n", ylab="Voltage", xlab="datetime")
  
  # Now creating third graph
  lines(a, data$Voltage)
  
  # Now plotting with type=n
  plot(dates, data$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
  
  # Now creating fourth graph
  lines(dates, data$Global_reactive_power)
  
  # Now copying the overall graph to PNG file
  dev.copy(png, "plot4.png", width=480, height=480)
  dev.off()
}