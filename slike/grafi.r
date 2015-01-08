cat("Uvažam grafe...\n")

pdf("slike/grafi1.pdf", paper="a4r")

barplot(trajanjebrez[1:12,9], xlab="statistična regija", ylab="trajanje bezposelnosti", main="Trajanje brezposlenosti po statističnih regijah v Sloveniji v letu 2014", col="lightblue", names.arg = trajanjebrez$STATISTI.NA.REGIJA, las = 2, cex.names=0.5)

dev.off()

pdf("slike/grafi2.pdf", paper="a4r")

barplot(brezstarost[1:12,7], xlab="statistična regija", ylab="brezposelnost prebivalcev starejših od 55 let", main="Brezposelnost prebivalcev starejših od 55 let v letu 2014", col="pink", names.arg = brezstarost$STATISTIČNA.REGIJA, las = 2, cex.names=0.5)


dev.off()
