
# Brenner
# Aula 1 - R

utils::browseURL("https://github.com/bbiasi/ENGD02/blob/master/Aula1.R")

# Duvidas
# ?browseURL


# use # no inicio da frase p comentarios
# evite usar acentos, pontuacao, etc

# 04 tracos (----) indicam paginacao


# Meu diretorio de trabalho ----
setwd("D:/PEI/ENGD02/2019_2/ENGD02")

if(!require("tidyverse")) install.packages("tidyverse") ; library(tidyverse)
if(!require("readxl")) install.packages("readxl") ; library(readxl)
if(!require("psych")) install.packages("psych") ; library(psych)
if(!require("plyr")) install.packages("plyr") ; library(plyr)

# Criando objeto ----
Maria <- AA
#Error: object 'AA' not found

Maria <- "AA"
Maria="AA"
Maria = "AA"

# alt + - (traco)
# <- 
Jose <- "11"
Jose <- 111

Area <- 10

x <- Jose - Area
x <- Jose * Area

vetor  <- c(1.80, 1.69, 1.71, 1.59, 2.01, 1.67, 1.82, 1.63)
vetor2 <- c("AA", "BB", 1.71, 1.59, 2.01, 1.67, 1.82, 1.63)

rm(vetor2)
# remove(vetor2)

print(vetor)
View(vetor)

vetor_2 <- vetor + 1

df <- data.frame("Coluna_1" = vetor,
                 "XYZ" = vetor_2)

View(df)

plot(x = df$Coluna_1, y = df$XYZ)

plot(df$Coluna_1, 
     df$XYZ)

attach(df)
plot(Coluna_1, XYZ)

# Estatisticas basicas----
media <- mean(vetor)
mediana <- median(vetor)
desvio <- sd(vetor)
var <- var(vetor)

var
media; mediana

paste0("A média é: ", media)

summary(vetor)

library(psych)
aaaa <- psych::describe(df$XYZ)
aaaa

# Importando banco de dados----

# install.packages("readxl")
# library(readxl)

dados <- readxl::read_excel("EconomistData.xlsx")

# Graficos----
plot(x = dados$CPI, y = dados$HDI, xlab = "CPI", ylab = "HDI")
hist(x = dados$CPI)

# Manipulacao basica de df

# library(dplyr)
dplyr::glimpse(dados)

dados <- dados %>% 
  dplyr::mutate(CPI = as.numeric(as.character(CPI)))

hist(x = dados$CPI)
boxplot(x = dados$CPI)

# library(ggplot2)
ggplot2::ggplot(data = dados) +
  #  aes = estetica
  geom_boxplot(aes(x = Region, y = CPI))

ggplot2::ggplot(data = dados) +
  geom_boxplot(aes(x = Region, y = CPI, fill = Region))

ggplot2::ggplot(data = dados) +
  geom_jitter(aes(x = Region, y = CPI)) +
  geom_boxplot(aes(x = Region, y = CPI, fill = Region))

ggplot2::ggplot(data = dados) +
  geom_boxplot(aes(x = Region, y = CPI, fill = Region)) +
  geom_jitter(aes(x = Region, y = CPI))

ggplot2::ggplot(data = dados) +
  geom_boxplot(aes(x = Region, y = CPI, fill = Region)) +
  geom_jitter(aes(x = Region, y = CPI, alpha = 0.3))

ggplot2::ggplot(data = dados) +
  geom_boxplot(aes(x = Region, y = CPI, fill = Region)) +
  geom_jitter(aes(x = Region, y = CPI, alpha = 0.3), show.legend = F)

plot1 <- ggplot2::ggplot(data = dados) +
  geom_boxplot(aes(x = Region, 
                   y = CPI, 
                   fill = Region),
               show.legend = F) +
  geom_jitter(aes(x = Region, 
                  y = CPI, 
                  alpha = 0.3), 
              show.legend = F) +
  theme_dark()

plot1

# ggsave(file   = "plot1.png", 
#        plot1, 
#        width  = 13, 
#        height = 9,
#        dpi    = 700)

# Manipulacao de dados ----
dados

table(dados$Country)
levels(dados$Country)

# library(plyr)
plyr::count(dados$Country)

# ctrl + shift + m
# %>% 
dados <- dados %>% 
  dplyr::mutate(Country = as.factor(Country))

levels(dados$Country)

dados2 <- dados %>% 
  dplyr::group_by(Region) %>% 
  dplyr::summarise(Media = mean(CPI))

# utilidade ----
utils::browseURL("https://r4ds.had.co.nz/")

utils::browseURL("http://www.sthda.com/english/")
