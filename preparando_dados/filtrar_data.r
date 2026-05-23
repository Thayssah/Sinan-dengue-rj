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

#coluna NU_ANO
#dados_filtrados <- arquivos2[arquivos2$NU_ANO >= 2015 & arquivos2$NU_ANO <= 2025, ]
#dados_filtrados$DT_NASC <- as.numeric(format(as.Date(dados_filtrados$DT_NASC), "%Y"))

#coluna DT_SIN_PRI
#dados_filtrados$DT_SIN_PRI <- as.numeric(format(as.Date(dados_filtrados$DT_SIN_PRI), "%Y"))
#unique(dados_filtrados$DT_ENCERRA)
#length(dados_filtrados$DT_INVEST)

#coluna DT_NOTIFIC
#dados_filtrados$DT_NOTIFIC <- as.numeric(format(as.Date(dados_filtrados$DT_NOTIFIC), "%Y"))

#coluna DT_INVEST
#dados_filtrados$DT_INVEST <- as.numeric(format(as.Date(dados_filtrados$DT_INVEST), "%Y"))

#DT_ENCERRA
#dados_filtrados$DT_ENCERRA <- as.numeric(format(as.Date(dados_filtrados$DT_ENCERRA), "%Y"))

#nrow(dados_filtrados)

#------variaveis pra analises--------------------

#idade x anos?

saveRDS(dados_filtrados, file = "filtrados.rds")
