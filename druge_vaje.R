#Stacionarnost

#3metode določanja: 
#buljenje, 
#avtokorelacija 
#testi(kpss;H0 stacionarnost, H1 nestacinoarnost & ADF; H1 stacionarnost, H0 nestacinoarnost)
library(tseries)
beli <- rnorm(100)
plot(beli)
acf(beli)

kpss.test(beli)
adf.test(beli)
beli_trend <- beli + 0.05*(1.100)
beli_t <- 1:100

plot(beli_trend)
acf(beli_trend)
kpss.test(beli_trend)
acf.test(beli_trend)


dm <- scan("DM.txt")
ts.plot(dm)
acf(dm)
kpss.test(dm)

beli_lm <- lm(beli_trend ~ beli_t)

kpss.test(beli_lm$residuals)
arma <- arima.sim(n = 500, model = list(c(0.7,0.3),ma =c(0.5,0.4)))
plot(arma)
acf(arma)
adf.test(arma)


arma_t <- c(-249.5, 249.5)
arma_quad <- arma + 1e-4*arma_t^2
ts.plot(arma_quad)

kpss.test(arma_quad)



#Dež v LA


