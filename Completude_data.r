library(dplyr)
#separei um arquivo pras veariaveis 
#"CS_RACA", "ID_MUNICIP", "ID_REGIONA", "ID_UNIDADE" de interesse
#dados <- readRDS("filtrados.rds")
#variaveis_interesse <- c("CS_RACA", "ID_MUNICIP", "ID_REGIONA", "ID_UNIDADE")
#dadosC1 <- dados_filtrados[, variaveis_interesse]

#saveRDS(dadosC1, file = "dadosC1.rds")
dadosC1 <- readRDS("dadosC1.rds")

# Raça e cor
# Converter para fator com os labels
  #Substituindo numeros por nomes
dadosC1$CS_RACA <- factor(dadosC1$CS_RACA,
    levels = c(1, 2, 3, 4, 5, 9),
    labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena", "Ignorado"))

# NA agora é "Ignorado" tambem
dadosC1$CS_RACA[is.na(dadosC1$CS_RACA) | dadosC1$CS_RACA == 9] <- "Ignorado"

#-----dados do ibge pra juntar com o id dos municipios----

url2 <- "https://raw.githubusercontent.com/kelvins/Municipios-Brasileiros/main/csv/municipios.csv"

municipios <- read.csv(url2, sep = ",", encoding = "UTF-8")
names(municipios)

dadosC1$ID_UNIDADE <- as.character(dadosC1$ID_UNIDADE)
municipios$codigo_ibge <- as.character(municipios$codigo_ibge)

municipios$codigo_ibge_6 <- substr(municipios$codigo_ibge, 1, 6)
dadosC1 <- dadosC1 %>%
  left_join(municipios %>% select(codigo_ibge_6, nome), 
            by = c("ID_MUNICIP" = "codigo_ibge_6"))

dadosC1 <- dadosC1 [
    , -c(5 , 6,)
]

dadosC1 <- dadosC1 [
    , -c(3
    )
]

dadosC1 <- rename(dadosC1, "NOME_MUNICIP" = "Nome_Municip")
dadosC1 <- rename(dadosC1, "RAÇA/COR" = "CS_RACA")
"

nrow(dadosC1)
saveRDS(dadosC1, file = "dadosC1.rds")
head(municipios)
View(dadosC1)
table(municipios)
colnames(dadosC1)
unique(dadosC1$nome.y)
table(dadosC1$CS_RACA, useNA = "ifany")