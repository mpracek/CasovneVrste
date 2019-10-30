library(tseries)


dezLA_Vhod <- read.table("padavineLA.txt")
dezLA <- dezLA_Vhod[,2]
ts.plot(dezLA)
acf(dezLA)
#Res se zdi stacionarno, saj pri nestacionarnih acf počasi pada. 
#Beli šum ima korelacije enake nič
kpss.test(dezLA)
adf.test(dezLA)
Box.test(dezLA)
#H0: Časovna vrsta je beli šum, H1: Časovna vrsta ni beli šum 

#Vgrajena časovna vrsta pretoka reke Nil
Nile

