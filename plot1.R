plot1 <- function(){
  
  # Grepping for those line numbers whose date is either 1/2/2007 or 2/2/2007
  relevantLineNumbers <- grep('^[1-2]/2/2007', readLines("./household_power_consumption.txt"))
  
  # Now getting the subset of data by using the read.table function
  data <- read.table(file="./household_power_consumption.txt", sep=";", skip = relevantLineNumbers[1]-1, nrows = length(relevantLineNumbers), stringsAsFactors=FALSE, header=TRUE)
  
  # Now getting the header values from the original file and assigning them as the header in the subset of data
  headerdata <- read.table(file="./household_power_consumption.txt", sep=";", nrows = 1, stringsAsFactors=FALSE, header=FALSE)
  names(data)<-headerdata
  
  # Now plotting the histogram  of Global Active Power (in Kilowatts)
  hist(data$Global_active_power, col='red', xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
  
}