# Analiza podatkov s programom R, 2014/15

Avtor: Dževada Džafić

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

Tema mojega projekta je brezposelnost v Sloveniji. Najprej se bom osredotočila na analizo brezposelnosti po naslednjih spremenljivkah: trajanje iskanja dela, spol in statrost brezposlenih po statističnih ergijah Slovenije v letu 2014

Povezava do podatkovnih tabel:
http://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=0762111S&ti=&path=../Database/Dem_soc/07_trg_dela/02_07008_akt_preb_po_anketi/02_07621_akt_preb_ADS_letno/&lang=2
http://www.ess.gov.si/trg_dela/trg_dela_v_stevilkah/registrirana_brezposelnost#Statisti%C4%8Dne%20regije

Cilj projekta je predvsem spoznati delo v programskem okolju R ter analizirati brezposelnost v Sloveniji glede na trajanje iskanja dela in izobrazbo.


## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
