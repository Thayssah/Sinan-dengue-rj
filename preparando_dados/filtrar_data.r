library(data.table)
library(readr)
library(dplyr)
#------------FILTRANDO COLUNAS PARA LINHAS ESPECIFICAS -----------
arquivos_filtrados <- fread(
  "C:\\Users\\alves\\OneDrive - edu.unirio.br\\Dados sinan dengue\\dados dengue\\workspace dengue\\dados csv\\filtrados.csv",
  sep = ";",
  select = NULL,  
  nrows = Inf,
  verbose = FALSE
)[ID_AGRAVO == "A90" & SG_UF_NOT == 33] #COLUNA IDAGRAVO E COLUNA SG_UF_NOT PARA FILTRAR APENAS PARA A90 E 33 (RIO DE JANEIRO), RESPECTIVAMENTE.


#---------------------------------------------------------------------------------------
# Filtrar anos de 2015 a 2025 e editar colunas com formato YYYY-MM-DD para
#YYYY
#dados_filtrados <- readRDS("dados_dengue_rj_2014_2025.rds")
#coluna NU_ANO
#dados_filtrados <- dados_filtrados[dados_filtrados$NU_ANO >= 2015 & dados_filtrados$NU_ANO <= 2025, ]
#coluna DT_NASC
#dados_filtrados$DT_NASC <- as.numeric(format(as.Date(dados_filtrados$DT_NASC), "%Y"))



#dados_filtrados <- readRDS("filtrados.rds")
#dados_filtrados$DT_CHIK_S1 <- NULL #dados sobre chikunguya apagados
#dados_filtrados$DT_CHIK_S2 <- NULL
#dados_filtrados$RES_CHIKS1 <- NULL
#dados_filtrados$RES_CHIKS2 <- NULL
#dados_filtrados$ID_REGIONA <- NULL #apagado pois nao usam mais na ficha

# Raça e cor
# Converter para fator com os labels
  #Substituindo numeros por nomes

#dados_filtrados <- rename(dados_filtrados, "RACA_COR" = "RAÇA/COR")

#dados_filtrados$RACA_COR <- factor(dados_filtrados$RACA_COR,
    #levels = c(1, 2, 3, 4, 5, 9),
    #labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena", "Ignorado"))

# NA agora é "Ignorado" tambem
#dados_filtrados$RACA_COR[is.na(dados_filtrados$RACA_COR) | dados_filtrados$RACA_COR == 9] <- "Ignorado"

#saveRDS(dados_filtrados, file = "filtrados.rds")

table(dados_filtrados$"RACA_COR", useNA = "ifany")
View(dados_filtrados$)
saveRDS(dados_com_regiao, file = "dados_com_regiao.rds")
dados_com_regiao <- readRDS("dados_com_regiao.rds")
colnames()
unique(dados_filtrados$"ID_MUNICIP")
nrow()
head()
dados_filtrados <- readRDS("filtrados.rds")