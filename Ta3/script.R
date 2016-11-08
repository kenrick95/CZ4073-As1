install.packages("nycflights13")
library("nycflights13")

max_year <- aggregate(year ~ manufacturer + engine, planes, function(x) { max(x) })
min_year <- aggregate(year ~ manufacturer + engine, planes, function(x) { min(x) })
avg_year <- aggregate(year ~ manufacturer + engine, planes, function(x) { mean(x) })

tt <- data.frame(min_year = min_year$year, avg_year = avg_year$year, max_year = max_year$year, engine = max_year$engine, manufacturer = max_year$manufacturer)

# Get a list of colors to apply on each row: red if max_year == min_year, green otherwise
tt_colors <- sapply(tt[, "max_year"] == tt[, "min_year"], function(x) { if (x) return("red") else return("green")})

# pch = 20 --> small dot
plot(x = tt$max_year, y = tt$min_year, xlab = "Max year", ylab = "Min year", type="p", col = as.vector(tt_colors), pch = 20)
