plot2 <- function(){
  
  # Grepping for those line numbers whose date is either 1/2/2007 or 2/2/2007
  relevantLineNumbers <- grep('^[1-2]/2/2007', readLines("./household_power_consumption.txt"))
  
  # Now getting the subset of data by using the read.table function
  data <- read.table(file="./household_power_consumption.txt", sep=";", skip = relevantLineNumbers[1]-1, nrows = length(relevantLineNumbers)-1, stringsAsFactors=FALSE, header=TRUE)
  
  # Now getting the header values from the original file and assigning them as the header in the subset of data
  headerdata <- read.table(file="./household_power_consumption.txt", sep=";", nrows = 1, stringsAsFactors=FALSE, header=FALSE)
  names(data)<-headerdata
  
  # Now parsing dates fromt eh data subset
  dates <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  # Now plotting with type=n
  plot(dates, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
  
  # Now add lines to the plot
  lines(dates, data$Global_active_power)
  
  # Now copying the histogram to PNG file
  dev.copy(png, "plot2.png", width=480, height=480)
  dev.off()
}