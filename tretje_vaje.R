library(tseries)
library(TSA)

dezLA_Vhod <- read.table("padavineLA.txt")
dezLA <- dezLA_Vhod[,2]
ts.plot(dezLA)
acf(dezLA)
#Res se zdi stacionarno, saj pri nestacionarnih acf počasi pada. 
#Beli šum ima korelacije enake nič
kpss.test(dezLA)
adf.test(dezLA)
Box.test(dezLA)
#Box-Pierceov test:
#H0: Časovna vrsta je beli šum, H1: Časovna vrsta ni beli šum 

#Vgrajena časovna vrsta pretoka reke Nil
Nile
ts.plot(Nile)
acf(Nile)
kpss.test(Nile)
Nile_t <- time(Nile)
Nile_lm <- lm(Nile ~ Nile_t)
abline(Nile_lm, col = "red")
#izgleda okrog leta 1900 da je prelomna točka
summary(Nile, Nile_lm)
summary(Nile_lm)
#odstranimo trend
Nile_lm_res <- Nile_lm$residuals
ts.plot(Nile_lm_res)
acf(Nile_lm_res)
kpss.test(Nile_lm_res)


#parcialna avtokorelacijska funkcija
pacf(Nile_lm_res)
adf.test(Nile_lm_res)
Box.test(Nile_lm_res)
plot(Nile)
Nil_k <- window(Nile, start = 1900)
Nil_k
Nil_k_t <- time(Nil_k)
Nil_k_lm <- lm(Nil_k ~ Nil_k_t)
abline(Nil_k_lm, col = "red")
summary(Nil_k_lm)
acf(Nil_k)
kpss.test(Nil_k)
adf.test(Nil_k)
Box.test(Nil_k)





#Izvoz avstrija
izvoz_vhod <- read.table("avstrija.txt")
izvoz_t <- izvoz_vhod[,1]
izvoz <- ts(izvoz_vhod[,2], start = 1960)
ts.plot(izvoz)
#poskus linearnega
prvi <- lm(izvoz ~ izvoz_t)
#eksponentno
abline(prvi, col = "red")
#lažje naredimo z aproksimacijo eksponenta, kjer si pomagamo z logaritmi!
#lny = lna + bt + epsilon * t
izvoz_diff <- diff(izvoz)
ts.plot(izvoz_diff)
#uporabmo funkcijo filter za časovne vrste
help(filter)
izvoz_diff_f <- filter(izvoz_diff, rep(1/7,7))
#pogledamo povprečje 7 okrog točke; torej še 3 prej in 3 potem
izvoz_diff_f
ts.plot(izvoz_diff_f[4:50])


izvoz_diff_f_2 <- sqrt(filter(izvoz_diff^2, rep(1/7, 7)))
izvoz_diff_f_2
ts.plot(izvoz_diff_f_2)


plot(izvoz_diff_f_2)
plot(tail(izvoz, -1), izvoz_diff_f)


izvoz_log <- log(izvoz)
plot(izvoz_log)
izvoz_log_lm <- lm(izvoz_log ~ izvoz_t)
abline(izvoz_log_lm, col = "red")
izvoz_log_lm_res <- izvoz_log_lm$residuals
ts.plot(izvoz_log_lm_res)
adf.test(izvoz_log_lm_res)


#temperature nasa
temp_lj_vhod <- read.table("nasa.txt")
#pridobimo mesečne temperature
matrika <- as.matrix(temp_lj_vhod[57:90,2:13])
vektor <- c(t(matrika))
vektor <- as.factor(vektor)
vektor
#to naredimo tako, ker R deluje po stolpcih
ts.plot(vektor)
acf(vektor)
Box.test(vektor)
#odstranimo sezonska nihanja
spectrum(vektor)
periodogram(vektor)


vektor_t <- seq(1, length(vektor))
vektor_cos <- cos(pi/6 * vektor_t)
vektor_sin <- sin(pi/6 * vektor_t)
vektor_trig <- lm(vektor ~ vektor_t + vektor_cos + vektor_sin)
ts.plot(vektor)
abline(vektor_trig)
 

acf(vektor_trig$residuals)
 