df = read.table("household_power_consumption.txt", sep = ";", header =  T, stringsAsFactors = F, na.strings = "?")

# Keep only two dates data
#is_t = df$Date %in% c("1/2/2007", "2/2/2007")
date_v = as.Date(df$Date, "%d/%m/%Y")
d1 = as.Date("1/2/2007", "%d/%m/%Y")
d2 = as.Date("2/2/2007", "%d/%m/%Y")
is_t = (date_v == d1 | date_v == d2)
df_t = df[is_t,]
rm("df")

# convert time as well
date_v = strptime(paste(df_t$Date, df_t$Time), "%d/%m/%Y %H:%M:%S")


# plot 4
png("plot4.png")
par(mfcol = c(2,2), mar = c(4,4,2,1))
plot(date_v, df_t$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(date_v,df_t$Sub_metering_1, type = "line",xlab = "",ylab = 'Energy sub metering')
lines(date_v, df_t$Sub_metering_2, col = "red")
lines(date_v, df_t$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.9, bty = "n")
plot(date_v, df_t$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
with(df_t, plot(date_v, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()
