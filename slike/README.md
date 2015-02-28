# Mapa s slikami

pdf("slike/grafi.pdf", paper="a4r")

regije <- trajanjebrez$STATISTI.NA.REGIJA
regije[1] <- "Jugovzhodna\nSlovenija"
barplot(trajanjebrez[1:12,9], sub="statistična regija", ylab="trajanje bezposelnosti",
        main="Trajanje brezposlenosti po statističnih regijah v Sloveniji v letu 2014",
        col="lightblue", names.arg = regije, las = 2, cex.names=0.7, cex.axis=0.7)

dev.off()

pdf("slike/grafi2.pdf", paper="a4r")

regije <- trajanjebrez$STATISTI.NA.REGIJA
regije[1] <- "Jugovzhodna\nSlovenija"
barplot(brezstarost[1:12,7], sub="statistična regija", ylab="brezposelnost prebivalcev starejših od 55 let",
        main="Brezposelnost prebivalcev starejših od 55 let v letu 2014",
        col="pink", names.arg = regije, las = 2, cex.names=0.7, cex.axis=0.7)


dev.off()


V to mapo bomo dajali vse slike (grafe, zemljevide), ki jih bo naš program
naredil in jih bomo vključili v končno poročilo.