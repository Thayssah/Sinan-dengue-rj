library(data.table)
library(readr)
library(dplyr)
#-----------------------------------------------------------------------------------------------------------------------------------------
# FILTRANDO COLUNAS PARA LINHAS ESPECIFICAS 
arquivos_filtrados <- fread(
  "C:\\Users\\alves\\OneDrive - edu.unirio.br\\Dados sinan dengue\\dados dengue\\workspace dengue\\dados csv\\filtrados.csv",
  sep = ";",
  select = NULL,  
  nrows = Inf,
  verbose = FALSE
)[ID_AGRAVO == "A90" & SG_UF_NOT == 33] #COLUNA IDAGRAVO E COLUNA SG_UF_NOT PARA FILTRAR APENAS PARA A90 E 33 (RIO DE JANEIRO), RESPECTIVAMENTE.

saveRDS(arquivos_filtrados, 
  "C:\\Users\\alves\\OneDrive - edu.unirio.br\\Dados sinan dengue\\dados dengue\\workspace dengue\\dados csv\\filtrados.rds")
