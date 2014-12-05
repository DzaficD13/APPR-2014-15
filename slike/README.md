# Mapa s slikami

pdf("slike/grafi.pdf", paper="a4r")

barplot(trajanjebrez[1:12,9], xlab="statistična regija", ylab="trajanje bezposelnosti", main="Trajanje brezposlenosti (v mesecih) po statističnih regijah v Sloveniji v letu 2014", col="lightblue")

barplot(brezstarost[1:12,7], xlab="statistična regija", ylab="brezposelnost prebivalcev starejših od 55 let", main="Brezposelnost prebivalcev starejših od 55 let po statističnih regijah Slovenije v letu 2014", col="pink")

dev.off()


V to mapo bomo dajali vse slike (grafe, zemljevide), ki jih bo naš program
naredil in jih bomo vključili v končno poročilo.