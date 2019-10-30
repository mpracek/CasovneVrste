#Vaje iz časovnih vrst 1


#cumsum() kumulativna vsota
#diff() diference
#diff(, lag = n) diference z zamikom n

M <- matrix(1:15,3,5) # matrika
c(M) # iz matrike naredi vektor
A <- rbind(c(2,2),c(2,-2) ); A
B <- rbind(c(2,2),c(2,-2) ); B

A*B #navadna zvezdica matriki zmnoži po komponentah
A %*% B #zmnoži matriko v smislu linearne algebre
solve(A, c(-2, 14)) #reševanje sistemov


nas_clovek <- list(ime= "Janez", starost = 35, zena = "Marija", starost_otrok = c(15,13,2))
nasi_ljudje <- data.frame()
nasi_ljudje <- data.frame(
  ime = c("Janez", "Franc", "Jože"),
  starost = c(35,42,55),
  st_otrok = c(3,2,4),
  zena = c("Marija", "Štefka", "Lojzka"))

# nasi_ljudje[,1]
# [1] Janez Franc Jože 
# Levels: Franc Janez Jože
# > nasi_ljudje[1,]
# ime starost st_otrok   zena
# 1 Janez      35        3 Marija


#datoteke
#valjhun.fmf.uni-lj.si/~raicm/Poucevanje/CV/Datoteke

#gibanje nemške marke proti dolarju
dm <- scan("DM.txt") #prebere datoteko
plot(dm, type= "l")
ts.plot(dm)
plot.ts(dm)

dez <- read.csv("Padavine_LJ_ARSO.csv", header = TRUE)
plot(dez)
dez_matrika <- as.matrix(dez[,2:13])
dez.chron <- c(t(dez_matrika))
ts.plot(dez.chron)
#naredimo casovno
dez_ts <- ts(dez.chron)
dez1 <- ts(dez.chron, start = 1991, frequency = 12)



#nekater casovne vrste so vgrajene
co2
plot(co2)
co2_v <- c(co2)
co2_t <- seq(1, length(co2))
co2_m <- mean(co2)
co2_v_m <- mean(co2_t)
b <- sum((co2_t-co2_v_m)*(co2_v-co2_v_m))/sum((co2_t-co2_v_m)^2)
a <- co2_m - b * co2_v_m

#bolj enostavno
co2.lm <- lm(co2_v ~ co2_t)

plot(co2, type = "l")
abline(co2.lm)
summary(co2.lm)
cor.test(co2_t, co2_v)

#prvi korak pri analizi asovne vrste je določitev trenda
# ta trend nato odstranimo in opzujemo, kaj se dogaja naprej
 tempLJ <- read.table("nasa.txt")
 #po mesecih
 tempLJ.matrika <- as.matrix(tempLJ[,2:13])
 templj <- c(t(tempLJ.matrika))
templj_t <- seq(1, length(templj))

#test če imajo temperature kakšen trend
cor.test(templj_t, templj)



#Funkcija apply deluje na večrazsežnih objekti, naš je dvorazsežen. Računamo povprečja po letih. 
apply(tempLJ.matrika,1,mean) #po letih
apply(tempLJ.matrika,2,mean) #po mesecih
templj_letne <- head(apply(tempLJ.matrika,1,mean),-1)


setwd("//Spin/PracekM16$/_System/Desktop/M/Casovne")
read.table("nasa.txt", header = TRUE)[c("YEAR", "metANN")] -> vhod
View(vhod)
ts.plot(vhod)
ts.plot(vhod$metANN)
ts.plot(vhod$YEAR,vhod$metANN)
tmplj <- vhod$metANN

temp_kasneje <- tmplj[57:90]
temp_kasneje_t <- 1929:1985
tmplj_ts <- ts(temp_kasneje, start = 1929)
ts.plot(tmplj_ts)
time(tmplj_ts)

temp_lj <- tmplj
temp_lj_t <- 1929:2019

#linearni model
tmp_ts <- ts(tmplj, start = 1929)
ts.plot(tmp_ts)


#na levi kar ocenjujemo
temp_lm <- lm(temp_lj ~ temp_lj_t)
summary(temp_lm)
abline(temp_lm, col = "red")

templj_po <- tmplj[57:91]
templj_po_t <- 1985:2018
templj_po_lm <- lm(templj_po ~ templj_po_t)
abline(templj_po_lm, col = "blue")

templj_zg <- tmplj[1:56]
templj_zg_t <- 1929:1984
templj_zg_lm <- lm(templj_zg ~ templj_zg_t)
abline(templj_zg_lm, col = "green")

#Bolj zapleteni modeli
#kvadratni modeli 
lm(temp_lj ~ temp_lj_t + I(temp_lj_t^2)) -> templj_quad
#primerjava modelov
anova(temp_lm, templj_quad)

quad_coef <- c(templj_quad$coefficients)
templj_quad_f <- function(t)sum(quad_coef*c(1,t,t^2))
templj_quad_f(2029)
templj_quad_f(2100)


plot(templj_quad_f(c(1929,2019)), add = TRUE)
plot(templj_t, templj, type = "l", xlab = "leto", xlim = c(1985,2100), ylim = c(10,20))






