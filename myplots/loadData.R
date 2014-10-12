
library(sqldf)

loadData <- function() {
	if (exists("powerConsumption")) {
		powerConsumption

	} else {
		dataFileName <- "household_power_consumption.txt"

		if(file.exists(dataFileName)) {
			dataFile <- file(dataFileName)
			attr(dataFile, "file.format") = list(sep=';', header=TRUE), na.strings="?"
			powerConsumption = sqldf(
				"select * from dataFile where Date = '1/2/2007' or Date = '2/2/2007'",
			)

			#tbl$DateTime <- strptime(tbl$DateTime, "%Y-%m-%d %H:%M:%S")
			powerConsumption$DateTime = as.POSIXlt(
				strptime(
					paste(as.Date(powerConsumption$Date, "%d/%m/%Y"),
						powerConsumption$Time),
					format="%Y-%m-%d %T"
				)
			)

			powerConsumption = 
				powerConsumption[,-which(names(powerConsumption) %in% c("Date","Time"))]

		#tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]
		#tbl$DateTime <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
		#write.csv(tbl, cacheFile)
		}
	}
	powerConsumption
}
