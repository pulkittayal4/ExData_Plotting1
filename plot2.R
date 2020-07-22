t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Formating date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")

## Filtering data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

t <- t[complete.cases(t),]

##
dateTime <- paste(t$Date, t$Time)

dateTime <- setNames(dateTime, "DateTime")

t <- t[ ,!(names(t) %in% c("Date","Time"))]

t <- cbind(dateTime, t)

t$dateTime <- as.POSIXct(dateTime)


##creates a plot2
  plot(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
