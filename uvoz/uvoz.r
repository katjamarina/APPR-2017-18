# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")

#vektor, ki spremeni imena držav v slo
drzave.slo <- c(
  "Austria" = "Avstrija",
  "Belgium" = "Belgija",
  "Denmark" = "Danska",
  "Estonia" = "Estonija",
  "Switzerland" = "Švica",
  "France" = "Francija",
  "Italy" = "Italija",
  "Liechtenstein" = "Lihtenštajn",
  "Sweden" = "Švedska",
  "Luxembourg" = "Luksemburg",
  "Norway" = "Norveška",
  "Croatia" = "Hrvaška",
  "Germany" = "Nemčija",
  "Slovenia" = "Slovenija",
  "Portugal" = "Portugalska",
  "Romania" = "Romunija",
  "United Kingdom" = "Združeno kraljestvo",
  "Montenegro" = "Črna Gora",
  "Turkey" = "Turčija",
  "Australia" = "Avstralija",
  "Bulgaria" = "Bolgarija",
  "Greece" = "Grčija",
  "Cyprus" = "Ciper",
  "Hungary" = "Madžarska",
  "Malta" = "Malta",
  "Poland" = "Poljska",
  "Czechoslovakia" = "Češkoslovaška",
  "Spain" = "Španija",
  "Latvia" = "Latvija",
  "Lithuania" = "Litva",
  "Finland" = "Finska",
  "Ireland" = "Irska",
  "Iceland" = "Islandija",
  "Russia" = "Rusija",
  "Slovakia" = "Slovaška",
  "Netherlands" = "Nizozemska",
  "Czech Republic" = "Češka",
  "Former Yugoslav Republic of Macedonia" = "Makedonija"
)

# Funkcija, ki uvozi podatke iz datoteke uvozi.gdp
uvozi.gdp <- function() {
  data <- read_csv("podatki/gdp.csv", na = ":",
                    locale = locale(encoding = "UTF-8"))
  data$GEO <- gsub("Germany.*", "Germany", data$GEO)
  data$UNIT <- gsub("Percentage.*", "Bruto domači proizvod (BDP)", data$UNIT)
  return(data)
}

#zapisimo podatke v razpredelnico gdp
gdp <- uvozi.gdp()
gdp <- gdp[ , -c(4:6)]
colnames(gdp) <- c("leto", "drzava", "enota", "delez")
gdp.slo <- gdp %>% mutate(drzava = drzave.slo[drzava])


#uvozimo tabelo s procenti moskih, ki so nasli zaposlitev
uvozi.procenti_moskih <- function() {
  data <- read_csv("podatki/procenti_moski.csv", na = ":",
                   locale = locale(encoding = "UTF-8"))
  data$GEO <- gsub("Germany.*", "Germany", data$GEO)
  data$GEO <- gsub("Former.*", "Macedonia", data$GEO)
  data$SEX <- gsub("Males", "M", data$SEX)
  data$AGE <- gsub("From 20 to 34 years", "20-34", data$AGE)
  return(data)
}

#zapisimo podatke v tabelo procenti_moskih
procenti_moskih <- uvozi.procenti_moskih()
procenti_moskih <- procenti_moskih[ , -c(3, 4, 7)]
colnames(procenti_moskih) <- c("leto", "drzava", "starost", "spol", "delez")

#uvozimo tabelo s procenti zensk, ki so nasle zaposlitev
uvozi.procenti_zensk <- function() {
  data <- read_csv("podatki/procenti_zenske.csv", na = ":",
                   locale = locale(encoding = "UTF-8"))
  data$GEO <- gsub("Germany.*", "Germany", data$GEO)
  data$GEO <- gsub("Former.*", "Macedonia", data$GEO)
  data$SEX <- gsub("Females", "Z", data$SEX)
  data$AGE <- gsub("From 20 to 34 years", "20-34", data$AGE)
  return(data)
}

#zapisimo podatke v tabelo procenti_zensk
procenti_zensk <- uvozi.procenti_zensk()
procenti_zensk <- procenti_zensk[ , -c(3, 4, 7)]
colnames(procenti_zensk) <- c("leto", "drzava", "starost", "spol", "delez")

#zberemo podatke M/Z v eno tabelo
procenti <- rbind(procenti_moskih, procenti_zensk) %>% na.omit(procenti)
procenti <- procenti %>% mutate(leto) %>% arrange(leto, drzava)
procenti.slo <- procenti %>% mutate(drzava = drzave.slo[drzava])

uvozi.trajanje1 <- function() {
  data <- read_csv("podatki/manj3.csv", na = ":",
                   locale = locale(encoding = "UTF-8"))
  data$GEO <- gsub("Germany.*", "Germany", data$GEO)
  data$GEO <- gsub("Former.*", "Macedonia", data$GEO)
  data$AGE <- gsub("From 20 to 34 years", "20-34", data$AGE)
  data$DURATION <- gsub("3.*", "Manj kot 3 leta", data$DURATION)
  data$DURATION <- gsub("Over.*", "Več kot 3 leta", data$DURATION)
  return(data)
}

#uvozimo v tabelo
manj3 <-uvozi.trajanje1()

uvozi.trajanje2 <- function() {
  data <- read_csv("podatki/3alivec.csv", na = ":",
                   locale = locale(encoding = "UTF-8"))
  data$GEO <- gsub("Germany.*", "Germany", data$GEO)
  data$GEO <- gsub("Former.*", "Macedonia", data$GEO)
  data$AGE <- gsub("From 20 to 34 years", "20-34", data$AGE)
  data$DURATION <- gsub("3.*", "Manj kot 3 leta", data$DURATION)
  data$DURATION <- gsub("Over.*", "Več kot 3 leta", data$DURATION)
  return(data)
}

#uvozimo v tabelo
vec3 <- uvozi.trajanje2()

#zdruzimo podatke o trajanju iskanja zaposlitve v eno tabelo
trajanje <- rbind(manj3, vec3)
trajanje <- trajanje[, -c(4, 6, 7)]
colnames(trajanje) <- c("leto", "drzava", "trajanje", "starost", "delez")
trajanje <- trajanje %>% mutate(leto) %>% arrange(leto, drzava)
#spremenimo v slo drzave
trajanje.slo <- trajanje %>% mutate(drzava = drzave.slo[drzava])


# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
