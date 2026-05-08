
library(data.table)
library(readr)
library(dplyr)
#library(vroom)

pasta_csv <- "C:/Users/alves/Desktop/csv quebrados" # Onde estão seus 11 CSVs
arquivo_saida <- "C:/Users/alves/Desktop/csv quebrados/todos_concatenados.csv"

dados_concatenados <- rbindlist(lapply(arquivos_saida, fread), fill = TRUE)

fwrite(dados_concatenados, arquivo_saida, sep = ";", dec = ",")
#cat(paste0("\n✓ Arquivo salvo em: ", arquivo_saida, "\n"))


arquivos_filtrados <- fread(
  "C:\\Users\\alves\\OneDrive - edu.unirio.br\\Dados sinan dengue\\dados dengue\\workspace dengue\\dados csv\\filtrados.csv",
  sep = ";",
  select = NULL,  # todas as colunas
  nrows = Inf,
  verbose = FALSE
)[ID_AGRAVO == "A90" & SG_UF_NOT == 33]

saveRDS(arquivos_filtrados, "C:\\Users\\alves\\OneDrive - edu.unirio.br\\Dados sinan dengue\\dados dengue\\workspace dengue\\dados csv\\filtrados.rds")




