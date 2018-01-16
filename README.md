# Analiza podatkov s programom R, 2017/18

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

Zaposljivost po končanem študiju v Evropi

V svojem projektu bom analizirala, kolikšen delež študentov se je po končanem študiju zaposlil ter kako hitro so našli zaposlitev. To bom primerjala skozi leta 2000-2016. Podatke bom primerjala tudi po spolu in po tem, koliko BDP-ja država nameni financiranju fakultet, ter kako se stanje razlikuje v državah po Evropi. Tabele sem pridobila iz Eurostata v obliki CSV.

Podatke sem dobila na:
* http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=edat_lfse_24&lang=en
* http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=educ_uoe_fine06&lang=en
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
 * 1. zemljevid: delež po študiju kmalu zaposlenih žensk
 * 2. zemljevid: delež po študiju kmalu zaposlenih moških
 
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
