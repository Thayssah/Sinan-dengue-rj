#-----------------------------------------------------------------------------------------------------------------------------------------

#Baixar o ano de 2024 por outro lugar porque o do datasus estava dando erro.
library(remotes)
remotes::install_github("danicat/read.dbc")

url_dbc <- "ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/DENGBR24.dbc"
caminho_fixo <- "C:/Users/alves/Desktop/dados dengue/dados dengue 2015-2025/dados dbc/DENGBR24.dbc"
download.file(url_dbc, caminho_fixo, mode = "wb")

#-----------------------------------------------------------------------------------------------------------------------------------------

library(data.table)
library(readr)
library(dplyr)

# Juntar os arquivos CSV em um único arquivo
pasta_csv <- "C:/Users/alves/Desktop/csv quebrados" 
arquivo_saida <- "C:/Users/alves/Desktop/csv quebrados/todos_concatenados.csv"

dados_concatenados <- rbindlist(lapply(arquivos_saida, fread), fill = TRUE)

fwrite(dados_concatenados, arquivo_saida, sep = ";", dec = ",")