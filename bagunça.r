
library(dplyr)

#dadosC1

dadosC1 <- readRDS("dadosC1.rds")
dadosC1 <- dadosC1[dadosC1$NU_ANO >= 2015 & dadosC1$NU_ANO <= 2025, ]
#------variaveis pra analises--------------------
#regioes x anos
#criei coluna com nomes  dos municipios
url2 <- "https://raw.githubusercontent.com/kelvins/Municipios-Brasileiros/main/csv/municipios.csv"

municipios <- read.csv(url2, sep = ",", encoding = "UTF-8")
names(municipios)

dadosC1$ID_UNIDADE <- as.character(dadosC1$ID_UNIDADE)
municipios$codigo_ibge <- as.character(municipios$codigo_ibge)

municipios$codigo_ibge_6 <- substr(municipios$codigo_ibge, 1, 6)

dados <- dados %>%
  left_join(municipios %>% select(codigo_ibge_6, nome), 
            by = c("ID_MUNICIP" = "codigo_ibge_6"))

            #left_join(municipios %>% select(codigo_ibge_6, nome), 
            #by = c("ID_MUNICIP" = "codigo_ibge_6"))


#dadoss <- rename(dados, "NOME_MUN_RESI" = "nome")
dados <- rename(dados, "NOME_MUN" = "nome")



# Criar dicionário com nome do município e região de saúde
regioes_saude <- data.frame(
  municipio = c("Angra dos Reis", "Mangaratiba", "Paraty",
                "Araruama", "Armação dos Búzios", "Arraial do Cabo", "Cabo Frio", 
                "Casimiro de Abreu", "Iguaba Grande", "Rio das Ostras", 
                "São Pedro da Aldeia", "Saquarema",
                "Areal", "Comendador Levy Gasparian", "Engenheiro Paulo de Frontin", 
                "Mendes", "Miguel Pereira", "Paracambi", "Paraíba do Sul", 
                "Paty do Alferes", "Sapucaia", "Três Rios", "Vassouras",
                "Barra do Piraí", "Barra Mansa", "Itatiaia", "Pinheiral", "Piraí", 
                "Porto Real", "Quatis", "Resende", "Rio Claro", "Rio das Flores", 
                "Valença", "Volta Redonda",
                "Belford Roxo", "Duque de Caxias", "Itaguaí", "Japeri", "Magé", 
                "Mesquita", "Nilópolis", "Nova Iguaçu", "Queimados", "Rio de Janeiro", 
                "São João de Meriti", "Seropédica",
                "Itaboraí", "Maricá", "Niterói", "Rio Bonito", "São Gonçalo", 
                "Silva Jardim", "Tanguá",
                "Aperibé", "Bom Jesus do Itabapoana", "Cambuci", "Cardoso Moreira", 
                "Italva", "Itaocara", "Itaperuna", "Laje de Muriaé", "Miracema", 
                "Natividade", "Porciúncula", "Santo Antônio de Pádua", "São José de Ubá", 
                "Varre-Sai",
                "Campos dos Goytacazes", "Carapebus", "Conceição de Macabu", "Macaé", 
                "Quissamã", "São Fidélis", "São Francisco de Itabapoana", "São João da Barra",
                "Bom Jardim", "Cachoeiras de Macacu", "Cantagalo", "Carmo", "Cordeiro", 
                "Duas Barras", "Guapimirim", "Macuco", "Nova Friburgo", "Petrópolis", 
                "Santa Maria Madalena", "São José do Vale do Rio Preto", "São Sebastião do Alto", 
                "Sumidouro", "Teresópolis", "Trajano de Moraes"),  
  regiao = c(rep("Baía da Ilha Grande", 3),
             rep("Baixada Litorânea", 9),
             rep("Centro Sul", 11),
             rep("Médio Paraíba", 12),
             rep("Metropolitana I", 12),
             rep("Metropolitana II", 7),
             rep("Noroeste", 14),
             rep("Norte", 8),
             rep("Serrana", 16))
)

dados_com_regiao <- merge(dados, regioes_saude, 
by.x = "NOME_MUN", 
by.y = "municipio",
all.x = TRUE)

saveRDS
dados_com_regiao$regiao[is.na(dados_com_regiao$regiao)] <- "outros estados"
saveRDS(dados_com_regiao, file = "dadosC1.rds")


library(dplyr)


# (cria combinações completas)
novo_arquivo1 <- dadosC1 %>%
  group_by(NOME_MUN, NU_ANO) %>%
  summarise(CASOS = n(), .groups = 'drop') %>%
  tidyr::complete(NOME_MUN, NU_ANO, fill = list(CASOS = 0))


library(dplyr)
library(tidyr)

municipios_rj <- c(
  "Angra dos Reis", "Aperibé", "Araruama", "Areal", "Armação dos Búzios",
  "Arraial do Cabo", "Barra do Piraí", "Barra Mansa", "Belford Roxo",
  "Bom Jardim", "Bom Jesus do Itabapoana", "Cabo Frio", "Cachoeiras de Macacu",
  "Cambuci", "Campos dos Goytacazes", "Cantagalo", "Carapebus", "Cardoso Moreira",
  "Carmo", "Casimiro de Abreu", "Comendador Levy Gasparian", "Conceição de Macabu",
  "Cordeiro", "Duas Barras", "Duque de Caxias", "Engenheiro Paulo de Frontin",
  "Guapimirim", "Iguaba Grande", "Itaboraí", "Itaguaí", "Italva", "Itaocara",
  "Itaperuna", "Itatiaia", "Japeri", "Laje do Muriaé", "Macaé", "Macuco",
  "Magé", "Mangaratiba", "Maricá", "Mendes", "Mesquita", "Miguel Pereira",
  "Miracema", "Natividade", "Nilópolis", "Niterói", "Nova Friburgo",
  "Nova Iguaçu", "Paracambi", "Paraíba do Sul", "Paraty", "Paty do Alferes",
  "Petrópolis", "Pinheiral", "Piraí", "Porciúncula", "Porto Real",
  "Quatis", "Queimados", "Quissamã", "Resende", "Rio Bonito", "Rio Claro",
  "Rio das Flores", "Rio das Ostras", "Rio de Janeiro", "Santa Maria Madalena",
  "Santo Antônio de Pádua", "São Fidélis", "São Francisco de Itabapoana",
  "São Gonçalo", "São João da Barra", "São João de Meriti", "São José de Ubá",
  "São José do Vale do Rio Preto", "São Pedro da Aldeia", "São Sebastião do Alto",
  "Sapucaia", "Saquarema", "Seropédica", "Silva Jardim", "Sumidouro",
  "Tanguá", "Teresópolis", "Trajano de Moraes", "Três Rios", "Valença",
  "Varre-Sai", "Vassouras", "Volta Redonda"
)


# Filtrar apenas os municípios do RJ
novo_arquivo1 <- read.csv("dados_rj_filtrado2.csv")

dados_rj <- novo_arquivo1 %>%
  filter(NOME_MUN %in% municipios_rj)

# Ver quantos municípios sobraram
n_distinct(dados_rj$NOME_MUN)  # Deve dar 92 (total de municípios do RJ)

write.csv(dados_rj, "dados_rj_2024.csv", row.names = FALSE)
dados_rj <- dados_rj %>% filter(NU_ANO == 2024)


populacao2024 <- read.csv("tabela2024.csv",
    sep = ";",
    fileEncoding = "UTF-8",
    dec = ",",
)  # Don't use any column as row names

library(dplyr)



library(geobr)
install.packages("sf")
library(sf)
municipios_rj <- geobr::read_municipality(code_muni = "RJ", year = 2020)
head(municipios_rj)

# Salvar como shapefile
st_write(municipios_rj, "municipios_rj.shp")

library(geobr)


populacao <- read.csv("tabela4.csv", 
               sep = ";", 
               fileEncoding = "UTF-8", 
               dec = ",")

write.csv(populacao, "tabelafinal.csv", row.names = FALSE)

# Salvar
write.csv(populacao_rj, "populacao_municipios_rj_2010.csv", row.names = FALSE)


names(resultado)[names(resultado) == "NOME_MUN_RESIDENCIA"] <- "MUNICIPIO_RESIDENCIA"
saveRDS(dados, file = "filtrados.rds")
nrow(dadosC1)
nrow(novo_arquivo1)
saveRDS(dadosC1, file = "dadosC1.rds")
head(dadosC1)
View(dadosC1)
View(novo_arquivo1)
View(dados_rj)
View(populacao2024)
table(municipios)
colnames(dadosC1)
colnames(populacao2024)
unique(dadosC1$regiao)
table(dadosC1$ID_MUNICIP, useNA = "ifany")