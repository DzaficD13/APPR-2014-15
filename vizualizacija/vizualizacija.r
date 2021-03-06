# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
# cat("Uvažam zemljevid...\n")
# obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
#                           "obcine", "OB/OB.shp", mapa = "zemljevid",
#                           encoding = "Windows-1250")

cat("Uvažam zemljevid...\n")
slo <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/SVN_adm.zip",
                       "slovenija", "SVN_adm1.shp", mapa = "zemljevid",
                       encoding = "Windows-1250")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.slo <- c()
  manjkajo <- ! nove.slo %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.slo[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) { 
    
    out <- data.frame(out)
    
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
brezposelnost <- brezpspol[1:12,]
#rownames(brezposelnost) <- brezposelnost[,4]
zbrezpspol <- preuredi(brezposelnost, slo)

# zbrezposelnost <- preuredi(brezposelnost[1:12,4], slo)

# Izračunamo povprečno velikost družine.
# druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
# min.povprecje <- min(druzine$povprecje, na.rm=TRUE)
# max.povprecje <- max(druzine$povprecje, na.rm=TRUE)

min.2014 <- min(zbrezpspol[3], na.rm=TRUE)
max.2014 <- max(zbrezpspol[3], na.rm=TRUE)
norm.2014 <- (zbrezpspol[,3]-min.2014)/(max.2014-min.2014)





# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/Slovenija.pdf", width=6, height=4)

# n = 100
# barve = topo.colors(n)[1+(n-1)*(druzine$povprecje-min.povprecje)/(max.povprecje-min.povprecje)]
# plot(obcine, col = barve)


# n = 100
# #barve =rgb(1, 0, 0, norm.2013)
# barve =rgb((n:1)/n, 1, 1)[unlist(1+(n-1)*norm.2014)]
# plot(slo, col = barve, bg="lightblue")

n <- 100
barve <- rgb((n:1)/n, 1, 1)
plot(slo, col = barve[unlist(1+(n-1)*norm.2014)], bg="lightblue")

k <- 5 # število stopenj v legendi
stopnje <- seq(min.2014, max.2014, (max.2014-min.2014)/(k-1))
legend("bottomright", title = "v tisočih", legend = round(stopnje),
       fill = barve[seq(1, n, (n-1)/(k-1))], bg = "white")



#imena regij
koordinate1 <- coordinates(slo)
imena1 <- as.character(slo$NAME_1)
rownames(koordinate1) <- imena1
names(imena1) <- imena1

koordinate1["Obalno-kraška",1] <- koordinate1["Obalno-kraška",1]+0.1 #levo,desno
koordinate1["Obalno-kraška",2] <- koordinate1["Obalno-kraška",2]+0.025 #dol,gor
koordinate1["Zasavska",2] <- koordinate1["Zasavska",2]+0.01
koordinate1["Spodnjeposavska",1] <- koordinate1["Spodnjeposavska",1]+0.1
koordinate1["Spodnjeposavska",2] <- koordinate1["Spodnjeposavska",2]
imena1["Jugovzhodna Slovenija"] <- "Jugovzhodna\nSlovenija"
imena1["Notranjsko-kraška"] <- "Notranjsko-\nkraška"
imena1["Obalno-kraška"] <- "Obalno-\nkraška"
imena1["Spodnjeposavska"]<- "Spodnje-\nposavska"

text(koordinate1,labels=imena1, cex=0.3)
title("Brezposelnost v letu 2014")

dev.off()