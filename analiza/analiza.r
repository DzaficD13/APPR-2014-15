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


# pdf("slike/brezposelnostpoletih.pdf", width=6, height=4)
# yp <- brezposelnostpoletih[1:15, 2]
# plot(brezposelnostpoletih[1:15,1], xlab="Leta", ylab="Število brezposelnih",
#         main="Brezposelnost po letih",
#         col="blue", yp, las = 2, cex.axis=0.7)

#NAPOVED ZA SLOVENIJO

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
curve(predict(loep, data.frame(leto=x)),add=TRUE,col="purple")

#legenda
legend("bottomright", c("Linerana metoda", "Kvadratna metoda","Loess"),lty=c(1,1,1), col = c("lightblue","lightgreen","purple"))

#Ocenimo prileganje krivulj tako, da izračunamo vsote kvadratov razdalj od napovedanih do dejanskih vrednosti
ostp<-sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))

#ocenitev ostanka-manjši ostanek je bolj natančen
sapply(list(linp, kvp, loep), function(x) sum(x$residuals^2))


#BDP


# yp<-bdp[1:14, 2]
# plot(bdp[1:14, 1], yp, ylab="Stevilo prebivalcev v milijonih",xlab="leto", main="Populacija v EU(28)",col="blue", type="l" )
# 
# z<-brezposelnostpoletih[1:14, 2]
# lines(bdp[1:14, 1], z,type="l", col="blue")



z<-bdp[1:14, 2]
plot(bdp[1:14, 1], z, type="l", xlab="leta", ylab="celotna sprememba", main="Sprememba populacije EU",col="lightblue")

y<-bdp[1:14, 3]
lines(bdp[1:14, 1], y, type="l" , col="blue")


# legend("topright", col = c("orange", "lightblue", "blue"), lty = "solid", cex = 0.5,
#        legend = c("Celotna sprememba", "Naravni prirastek", "Neto migracije"))
# abline(h = 0, col = "gray", lty = "dashed")


