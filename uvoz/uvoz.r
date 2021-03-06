# # 2. faza: Uvoz podatkov
# 
# # Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvoziDruzine <- function() {
#   return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                       fileEncoding = "Windows-1250"))
# }
# 
# # Zapišimo podatke v razpredelnico druzine.
# cat("Uvažam podatke o družinah...\n")
# druzine <- uvoziDruzine()
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.


source("lib/xml.r")


# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvoziTrajanjebrezposelnosti <- function() {
  return(read.table("podatki/trajanjebrez.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o trajanju brezposlenosti...\n")
trajanjebrez <- uvoziTrajanjebrezposelnosti()







# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvoziBrezpspol <- function() {
  return(read.table("podatki/brezpspol.csv", sep = ";", as.is = TRUE, header = TRUE,
                    row.names = 1,
                    fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o brezposlenosti glede na spol...\n")
brezpspol <- uvoziBrezpspol()






# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvoziBrezstarost <- function() {
  return(read.table("podatki/brezstarost.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o brezposlenosti glede na starost...\n")
brezstarost <- uvoziBrezstarost()






#Tabela brezposelnostpoletih za 4. fazo projekta:
uvoziBrezposelnostpoletih <- function() {
  return(read.table("podatki/leta.csv", sep = ";", as.is = TRUE, header = TRUE,
                   
                    fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o brezposlenosti po letih...\n")
brezposelnostpoletih <- uvoziBrezposelnostpoletih()



#Tabela bdp za 4. fazo projekta:
uvoziBDP <- function() {
  return(read.table("podatki/bdp.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o brezposlenosti po letih...\n")
bdp <- uvoziBDP()


#Tabela SEZONA za 4. fazo projekta:
uvoziSEZONA <- function() {
  return(read.table("podatki/sezona.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o brezposelnost glede na mesece...\n")
sezona <- uvoziSEZONA()


# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.