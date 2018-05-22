# 4. faza: Analiza podatkov

#podatki <- obcine %>% transmute(obcina, povrsina, gostota,
#                                gostota.naselij = naselja/povrsina) %>%
#  left_join(povprecja, by = "obcina")
#row.names(podatki) <- podatki$obcina
#podatki$obcina <- NULL

# Število skupin
#n <- 5
#skupine <- hclust(dist(scale(podatki))) %>% cutree(n)

prva <- uvozi_bdp %>% filter(leto == 2015) %>% select(-leto)
druga <- skupni_procenti %>% filter(leto == 2015) %>% select(-leto)

grupe <- inner_join(prva, druga, by="drzava")
drzave <- grupe$drzava

grupe2 <- grupe %>% select(-drzava) %>% scale()
rownames(grupe2) <- grupe$drzava
k <- kmeans(grupe2, 4, nstart = 1000)

skupine1 <- data.frame(drzava = grupe$drzava, skupina = factor(k$cluster))

#kako sem izbrala skupine
ggplot(inner_join(skupine1, grupe), aes(x = delez.x, y = delez.y, color = skupina)) + geom_point()

grupe_zemljevid <- ggplot() + geom_polygon(data = zemljevid %>% filter(long > -30) %>%
                                             left_join(skupine1, by = c("NAME_LONG" = "drzava")),
                                           aes(x = long, y = lat, group = group, 
                                               fill = skupina)) +
  coord_map(xlim = c(-25, 40), ylim = c(32, 72))

