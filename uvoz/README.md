# Obdelava, uvoz in čiščenje podatkov.

uvoziBrezposelnost <- function() {
  return(read.table("podatki/brezposelnost.csv", sep = ";", as.is = TRUE,
                      row.names = 3,
                      col.names = c("2010", "2011", "2012", "2013"),
                      fileEncoding = "Windows-1250"))
}

