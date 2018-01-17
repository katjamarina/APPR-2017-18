# Analiza podatkov s programom R, 2017/18

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Zaposljivost po končanem študiju v Evropi

V svojem projektu bom analizirala, kolikšen delež študentov se je po končanem študiju zaposlil ter kako hitro so našli zaposlitev. To bom primerjala skozi leta 2000-2016. Podatke bom primerjala tudi po spolu in po tem, koliko BDP-ja država nameni financiranju fakultet, ter kako se stanje razlikuje v državah po Evropi. Tabele sem pridobila iz Eurostata v obliki CSV.

Podatke sem dobila na:
* http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=edat_lfse_24&lang=en
* http://appsso.eurostat.ec.europa.eu/nui/show.do?query=BOOKMARK_DS-471197_QID_5A0B07B7_UID_-3F171EB0&layout=TIME,C,X,0;GEO,L,Y,0;UNIT,L,Z,0;SECTOR,L,Z,1;COFOG99,L,Z,2;NA_ITEM,L,Z,3;INDICATORS,C,Z,4;&zSelection=DS-471197UNIT,MIO_EUR;DS-471197COFOG99,TOTAL;DS-471197SECTOR,S13;DS-471197INDICATORS,OBS_FLAG;DS-471197NA_ITEM,TE;&rankName1=UNIT_1_2_-1_2&rankName2=SECTOR_1_2_-1_2&rankName3=INDICATORS_1_2_-1_2&rankName4=NA-ITEM_1_2_-1_2&rankName5=COFOG99_1_2_-1_2&rankName6=TIME_1_0_0_0&rankName7=GEO_1_2_0_1&sortC=ASC_-1_FIRST&rStp=&cStp=&rDCh=&cDCh=&rDM=true&cDM=true&footnes=false&empty=false&wai=false&time_mode=FIXED&time_most_recent=false&lang=EN&cfo=%23%23%23%2C%23%23%23.%23%23%23&lang=en
* http://ec.europa.eu/eurostat/tgm/table.do?tab=table&init=1&language=en&pcode=tps00053&plugin=1

Naredila bom tri tabele:
 1. tabela (po stolpcih) - delež BDP-ja, porabljenega za financiranje študija: 
  * Leto
  * Država
  * Enota
  * Delež

2. tabela (po stolpcih) - delež po študiju kmalu zaposlenih študentov(5 let ali manj): 
  * Leto
  * Država
  * Starost
  * Spol
  * Delež
  
3. tabela (po stolpcih) - deleži zaposlenih glede na trajanje iskanja zaposlitve(manj kot 3, več kot 3 leta): 
  * Leto
  * Država
  * Trajanje
  * Starost
  * Delež
  
V projektu bom narisala tudi 3 grafe in 2 zemljevida:
 * 1. graf: delež BDP, porabljen za financiranje študija
 * 2. graf: delež po študiju kmalu zaposlenih študentov - razlika med moškimi/ženskami
 * 3. graf: delež po študiju kmalu zaposlenih študentov - manj kot 3 leta, več kot 3
 * 1. zemljevid: delež po študiju kmalu zaposlenih žensk leta 2016
 * 2. zemljevid: delež po študiju kmalu zaposlenih moških leta 2016
 
Za izdelavo tega projekta sem se odločila zato, da kot prvo analiziram, ali spol vpliva na lažje/težje iskanje zaposlitve po študiju in kakšna razlika se pojavi. Prav tako me je zanimalo, kakšen vpliv ima država, oziroma njeno investiranje javnih sredstev v terciarno izobraževanje, na to, kakšne možnosti bodo imeli študenti po študiju. Poleg tega me je zanimalo, kako hitro si poiščejo zaposlitev (ali rabijo manj kot 3 leta, ali več kot 3 leta)

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
