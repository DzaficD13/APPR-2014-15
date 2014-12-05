# Obdelava, uvoz in čiščenje podatkov.


uvoziTrajanjebrezposelnosti <- function() {
  return(read.table("podatki/trajanjebrez.csv", sep = ";", as.is = TRUE, header = TRUE,
                    row.names = 1,
                    fileEncoding = "Windows-1250"))
}



uvoziBrezpspol <- function() {
  return(read.table("podatki/brezpspol.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}



uvoziBrezstarost <- function() {
  return(read.table("podatki/brezstarost.csv", sep = ";", as.is = TRUE, header = TRUE,
                    
                    fileEncoding = "Windows-1250"))
}