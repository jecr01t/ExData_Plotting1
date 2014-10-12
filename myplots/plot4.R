source("loadData.R")

powerConsumption <- loadData()

png("plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

# Global active power (plot in 1,1)
plot(
	powerConsumption$DateTime,
	powerConsumption$Global_active_power,
	type = "l",
	ylab="Global Active Power",
	ylim=c(0,6), axes=F, xlab="", frame.plot=TRUE
)
axis.POSIXct(1,
		at=c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
		format="%a", )
axis(side=2, at=c(0,2,4,6))



# Voltage (plot in 1,2)
plot(
	powerConsumption$DateTime,
	powerConsumption$Voltage,
	type = "l",
	ylab="Voltage", xlab="datetime",
	ylim=c(234,246), axes=F, frame.plot=TRUE
)
axis.POSIXct(1,
		at=c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
		format="%a" )
axis(side=2, at=seq(from=234, to=246, by=4))


# Energy sub-metering (plot in 2,1)
plot(
	powerConsumption$DateTime,
	powerConsumption$Sub_metering_1,
	type = "l",
	ylab="Energy sub metering",
	ylim=c(0,30), axes=F, xlab="", frame.plot=TRUE
)
lines(powerConsumption$DateTime,powerConsumption$Sub_metering_2, col="green")
lines(powerConsumption$DateTime,powerConsumption$Sub_metering_3, col="blue")
axis.POSIXct(1,
		at=c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
		format="%a" )

axis(side=2, at=c(0,10,20,30))
legend(	"topright", bty="n", lwd=1,	col = c("black", "green", "blue"),
		legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)


# Global reactive power
plot(
	powerConsumption$DateTime,
	powerConsumption$Global_reactive_power,
	type = "l",
	ylab="Global_reactive_power",
	ylim=c(0,0.5), axes=F, xlab="datetime", frame.plot=TRUE
)
axis.POSIXct(1,
		at=c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"),
		format="%a", )
axis(side=2, at=c(0.0,0.1,0.2,0.3,0.4,0.5))



dev.off()

