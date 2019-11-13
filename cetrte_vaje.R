library(tseries)
library(TSA)
dj_vhod <- read.table("DowJones.txt", header = TRUE)
dj <-rev(dj_vhod[,2])
ts.plot(dj)
#logaritmiramo zaradi sprememb v odstotkih; relativne napake
dj_log <- log(dj)
ts.plot(dj_log)
acf(dj_log) #torej ni stacionarnosti
kpss.test(dj_log)
dj_log_d <- diff(dj_log)
ts.plot(dj_log_d)
acf(dj_log_d)
kpss.test(dj_log_d)
adf.test(dj_log_d)


dm <- scan("DM.txt")
ts.plot(dm)
dm_d <- diff(dm)
ts.plot(dm_d)
acf(dm_d) #ne zavrze stacionarnosti, a nimamo belega šuma
kpss.test(dm_d)
adf.test(dm_d)
dm_d2 <- diff(dm_d)
ts.plot(dm_d2)
acf(dm_d2)
ts.plot(dm)
#simulirajmo avtoregresijsko èasovno vrsto x_t = 0.995x_(t-1) + z_t
sim_ar <- arima.sim(list(ar=0.995),2000) 
plot(sim_ar)

sim_ar_wn <- sim_ar + ts(rnorm(2000, sd=100))
plot(sim_ar_wn)
acf(sim_ar_wn)
kpss.test(sim_ar_wn)
ts.plot(cumsum(sim_ar_wn))


arsim <- arima.sim(list(ar=c(0.7,-0.3)),500)
plot(arsim)
acf(arsim)
pacf(arsim)
kpss.test(arsim)
Box.test(arsim)
ar(arsim)
#arma(p,q) je x_t = fi_1 X-(t-1)+...+fi_(t-p) X(t-p)+fi_1 Z_(t-1) + ... + Z_(t-q) 
#arima(p,r,q) je diff^r X je arma(p,q)
arima(arsim, c(2,0,0))
#AIC manjši kot je bolj ustreza
arima(arsim, c(2,0,0))$aic
arima(arsim, c(3,0,0))$aic
arima(arsim, c(0,0,2))$aic
AIC.empty <- matrix(nrow = 4,ncol = 4)
rownames(AIC.empty)<-sprintf("AR=%d",0:3)
colnames(AIC.empty)<-sprintf("AR=%d",0:3)
AIC <- AIC.empty
for(p in 0:3){
  for(q in 0:3){
    AIC[p+1,q+1]<- arima(arsim,c(p,0,q))$aic
  }
}
which.min(AIC)
#vsota ARMA redov naj ne presega 3
arsim_ar2 <- arima(arsim, c(2,0,0))
arsim_ar2_res <- arsim_ar2$residauls
acf(arsim_ar2_res)
Box.test(arsim_ar2_res)
