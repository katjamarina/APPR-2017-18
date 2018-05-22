# 3. faza: Vizualizacija podatkov

#Uvozimo grafe

graf1 <- ggplot(uvozi_bdp.slo %>% filter(drzava %in% c("Nemčija", "Slovenija", "Švedska", "Italija", "Francija", "Združeno kraljestvo", "Češka", "Grčija", "Hrvaška")), 
                aes(x = leto, y = delez, color = drzava)) +
  geom_line(size = 1) +
  geom_point(size = 1.5) +
  xlab("Leto") + ylab("Delež BDP") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5), 
        panel.grid.major = element_line(linetype = "dotted"), 
        panel.grid.minor = element_line(linetype = "dotted")) + 
  ggtitle("Delež BDP porabljen za terciarno izobraževanje")

graf2 <- ggplot(procenti.slo %>% filter(drzava %in% c("Nemčija", "Slovenija", "Švedska", "Italija", "Francija", "Združeno kraljestvo", "Češka", "Grčija", "Hrvaška")),
       aes(x = leto, y = delez, color = drzava)) + geom_line() + geom_point() +
  ggtitle("Delež zaposlitve po končanem študiju v odvisnosti od M/Z") + 
  facet_grid(~ spol)

graf3 <- ggplot(trajanje.slo %>% filter(drzava %in% c("Nemčija", "Slovenija", "Švedska", "Italija", "Francija", "Združeno kraljestvo", "Češka", "Grčija", "Hrvaška")),
                aes(x = leto, y = delez, color = drzava)) + geom_line() + geom_point() +
  ggtitle("Delež zaposlitve v odvisnosti od trajanja iskanja zaposlitve po študiju") +
  facet_grid(~ trajanje)

#Uvozimo zemljevid
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip",
                          "ne_50m_admin_0_countries", encoding = "UTF-8") %>%
  pretvori.zemljevid() %>% filter(REGION_WB %in% c("Europe & Central Asia","Middle East & North Africa"))

procenti$drzava <- parse_factor(procenti$drzava, levels(zemljevid$NAME_LONG))

zemljevid.delezM <- ggplot() +
  geom_polygon(data = procenti %>% filter(spol == "M", leto == 2016) %>%
                 right_join(zemljevid, by = c("drzava" = "NAME_LONG")),
               aes(x = long, y = lat, group = group, fill = delez)) +
  coord_cartesian(xlim = c(-22, 40), ylim = c(30, 70)) +
  ggtitle("Zemljevid deleža zaposlenih moških po končanem študiju leta 2016")

zemljevid.delezZ <- ggplot() +
  geom_polygon(data = procenti %>% filter(spol == "Z", leto == 2016) %>%
                 right_join(zemljevid, by = c("drzava" = "NAME_LONG")),
               aes(x = long, y = lat, group = group, fill = delez)) +
  coord_cartesian(xlim = c(-22, 40), ylim = c(30, 70)) +
  ggtitle("Zemljevid deleža zaposlenih žensk po končanem študiju leta 2016")

