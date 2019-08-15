
# Brenner
# Aula 1 - R

utils::browseURL("https://github.com/bbiasi/ENGD02/blob/master/Aula1.R")


# ?browseURL


# use # no inicio da frase p comentarios
# evite usar acentos, pontuacao, etc

# 04 tracos (----) indicam paginacao


# Meu diretorio de trabalho ----
setwd("D:/PEI/ENGD02/2019_2/ENGD02")

if(!require("tidyverse")) install.packages("tidyverse") ; library(tidyverse)
if(!require("readxl")) install.packages("readxl") ; library(readxl)

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


# Estatisticas basicas----
media <- mean(vetor)
mediana <- median(vetor)
desvio <- sd(vetor)
var <- var(vetor)

var
media; mediana

paste0("A média é: ", media)

# Importando banco de dados----

library(readxl)
dados <- read_excel("C:/Users/Lucas Mascarenhas/Desktop/Rascunhos R/Aula - Matematica Instrumental/EconomistData.xlsx", 
                    col_types = c("text", "numeric", "numeric", 
                                  "numeric", "text"))

# Graficos----

plot(x = dados$CPI, y = dados$HDI, xlab = "CPI", ylab = "HDI")
hist(x = dados$CPI)
boxplot(x = dados$CPI)

# Exportando dados----

tabela <- data.frame(desvio, media, mediana, var)
write.csv2(x = tabela, file = "tabela_saida.csv")

# Extra----

## Para acessar uma variavel dentro de um banco de dados...
## ...utilizamos '$' apos o banco de dados de interesse

media.CPI <- mean(dados$CPI)


