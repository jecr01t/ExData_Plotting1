source("loadData.R")

powerConsumption <- loadData()

png("plot2.png", width=480, height=480, units="px")

plot(
	powerConsumption$DateTime,
	powerConsumption$Global_active_power,
	type = "l",
	ylab="Global Active Power (kilowatts)",
	ylim=c(0,6), axes=F, xlab="", frame.plot=TRUE
)

axis.POSIXct(1,
		at=c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
		format="%a", )

axis(side=2, at=c(0,2,4,6))

dev.off()
