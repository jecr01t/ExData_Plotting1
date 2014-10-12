source("loadData.R")

powerConsumption <- loadData()

png("plot3.png", width=480, height=480, units="px")

plot(
	powerConsumption$DateTime,
	powerConsumption$Sub_metering_1,
	type = "l",
	ylab="Energy sub metering",
	ylim=c(0,30), axes=F, xlab="", frame.plot=TRUE
)
lines(powerConsumption$DateTime,powerConsumption$Sub_metering_2, col="blue")
lines(powerConsumption$DateTime,powerConsumption$Sub_metering_3, col="green")

axis.POSIXct(1,
		at=c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
		format="%a" )

axis(side=2, at=c(0,10,20,30))

legend(	"topright", 	lwd=1,	col = c("black", "blue", "green"),
		legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)

dev.off()
