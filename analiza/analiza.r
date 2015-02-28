# # 4. faza: Analiza podatkov
# 
# # Uvozimo funkcijo za uvoz spletne strani.
# source("lib/xml.r")
# 
# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()


#NAPOVED ZA SLOVENIJO
pdf("slike/napoved.pdf", width=6, height=4)
leto<-brezposelnostpoletih$Leto
stbrezposelnih<-brezposelnostpoletih$Stevilo.brezposelnih
plot(leto,stbrezposelnih, xlim=c(2000,2020), ylim=c(60,125),
     xlab="Leto",ylab="Stevilo brezposelnih",
     main="Napoved za Slovenijo",pch=20,col="lightblue",type="p",lwd=3.5)

#premica
linp<-lm(stbrezposelnih~leto)
abline(linp,col="red")
#parabola
kvp<-lm(stbrezposelnih~I(leto^2)+leto)
curve(predict(kvp, data.frame(leto=x)), add = TRUE, col = "lightgreen")
#loess
loep<-loess(stbrezposelnih~leto)
curve(predict(loep, data.frame(leto=x)),add=TRUE,col="blue")

#legenda
legend("bottomright", c("Linerana metoda", "Kvadratna metoda","Loess"),lty=c(1,1,1), col = c("lightblue","lightgreen","purple"))

#Ocenimo prileganje krivulj tako, da izračunamo vsote kvadratov razdalj od napovedanih do dejanskih vrednosti
ostp<-sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))

#ocenitev ostanka-manjši ostanek je bolj natančen
sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))
# min(3586.4494, 1227.3295, 392.7765) = 392.7765
#najbolj natančen je loess
dev.off()


#GRAF BDP

pdf("slike/bdp.pdf", width=6, height=4)
z<-bdp[1:14, 2]
# plot(bdp[1:14, 1], z, type="l", xlab="leto", ylab="Stevilo brezposelnih", main="Bdp in stevilo brezposelnih",col="lightblue")

y<-bdp[1:14, 3]
# lines(bdp[1:14, 1], y, type="l" , col="blue")

library(plotrix)
twoord.plot(bdp[1:14, 1], z, bdp[1:14, 1], y, type = "l", xlab="Leto",
            ylab="BDP", rylab="Stevilo brezposelnih",
            main="Bdp in stevilo brezposelnih", lcol="lightblue", rcol="blue")

dev.off()


#GRAF SEZONA

pdf("slike/sezona.pdf", width=6, height=4)
z<-sezona[1:12,2]

plot(1:12, z, type="l", col="blue", xaxt = "n", main="Brezposelnost v letih 2014 in 2013")

axis(1, at = axTicks(1, c(1, 12, 11)), labels = sezona[1:12, 1], las = 2, cex.axis = 0.5)
m<-sezona[1:12,3]
lines(1:12, m, type="l", col="lightblue")

legend("topright", c("Leto 2014", "Leto 2013"),lty=c(1,1), col = c("blue","lightblue"))
dev.off()







# #Napoved za Slovenijo
# pdf("slike/Stevilozivorojenih.pdf", width=6, height=4)
# leto<-Rodnost_smrtnost_SLO$Leto
# stzivorojenih<-Rodnost_smrtnost_SLO$stzivorojenih
# plot(leto,stzivorojenih, xlim=c(2002,2020),ylim=c(17000,25000),
#      xlab="Leto",ylab="Stevilo zivorojenih otrok",
#      main="Napoved za Slovenijo",pch=20,col="lightblue",type="p",lwd=3.5)
# #premica
# linp<-lm(stzivorojenih~leto)
# abline(linp,col="pink")
# #parabola
# kvp<-lm(stzivorojenih~I(leto^2)+leto)
# curve(predict(kvp, data.frame(leto=x)), add = TRUE, col = "purple")
# #loess
# loep<-loess(stzivorojenih~leto)
# curve(predict(loep, data.frame(leto=x)),add=TRUE,col="orange")
# #legenda
# legend("topleft", c("Linerana metoda", "Kvadratna metoda","Loess"),lty=c(1,1,1), col = c("lightblue","purple","orange"))
# #Ocenimo prileganje krivulj tako, da izračunamo vsote kvadratov razdalj od napovedanih do dejanskih vrednosti
# ostp<-sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))
# #ocenitev ostanka-manjši ostanek je bolj natančen
# sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))
# #8434860.1 5625253.3 590036.3
# #min(8434860.1, 5625253.3 , 590036.3)=590036.3
# #najbolj natančen je loess
# dev.off()
