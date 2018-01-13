# 3. faza: Vizualizacija podatkov

library(ggplot2)
library(dplyr)
library(readr)
library(tibble)

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip",
                             "OB/OB", encoding = "Windows-1250")
levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels = levels(obcine$obcina))
zemljevid <- pretvori.zemljevid(zemljevid)

# Izračunamo povprečno velikost družine
povprecja <- druzine %>% group_by(obcina) %>%
  summarise(povprecje = sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

povprecje.procentov <- procenti.slo %>% group_by(drzava, spol) %>% summarise(delez = sum(delez, na.rm = TRUE)/17)

graf1 <- ggplot(gdp.slo, aes(x = leto, y = delez, color = drzava)) +
  geom_line(size = 1) +
  geom_point(size = 1.5) +
  xlab("Leto") + ylab("Delež BDP") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5), 
        panel.grid.major = element_line(linetype = "dotted"), 
        panel.grid.minor = element_line(linetype = "dotted")) + 
  ggtitle("Delež BDP porabljen za terciarno izobraževanje")
print(graf1)

graf2 <- ggplot(povprecje.procentov, aes(x = drzava, y = delez, fill = spol)) +
  geom_col(position = "dodge") +
  xlab("Država") + ylab("Delež ljudi") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) + 
  ggtitle("Delež ljudi, ki so našli zaposlitev")
print(graf2)

zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip",
                          "ne_50m_admin_0_countries", encoding = "UTF-8")
zemljevid1 <- ggplot() + geom_polygon(data = zemljevid, aes(x = long, y = lat, group = group))
print(zemljevid1)
