source("loadData.R")

powerConsumption <- loadData()

png("plot1.png", width=480, height=480, units="px")

hist(
	powerConsumption$Global_active_power,
	main="Global Active Power", xlab="Global Active Power (kilowatts)",
	ylab="Frequency", breaks=12, ylim=c(0,1200), xlim=c(0,6), axes=F,
	col="red"
)

axis(side=1, at=c(0,2,4,6))

axis(side=2, at=seq(0,1200, by=200))

dev.off()
