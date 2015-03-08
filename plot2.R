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

# plot 2
plot(date_v, df_t$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()

