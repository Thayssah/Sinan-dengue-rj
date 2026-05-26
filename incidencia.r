#codigo pra tentar juntar calcular incidencia em 2024 pra usar no mapa
library(dplyr)

# 1. Seus casos agregados (assumindo que você já tem)
dados_rj <- read.csv("dados_rj_filtrado2.csv")
# 2. Carregar população
populacao <- read.csv("tabelafinal.csv")
library(dplyr)
library(tidyr)

# 2. Padronizar nomes (remover " (RJ)" da população)
populacao <- populacao %>%
  mutate(Município = stringr::str_remove(Município, " \\(RJ\\)")) %>%
  rename(NOME_MUN = Município, NU_ANO = Ano, POP = População)

# 3. Padronizar nomes dos casos (deixar tudo maiúsculo)
casos <- casos %>%
  mutate(NOME_MUN = toupper(NOME_MUN) %>% stringr::str_trim())

populacao <- populacao %>%
  mutate(NOME_MUN = toupper(NOME_MUN) %>% stringr::str_trim())

# 4. Juntar as tabelas
incidencia <- casos %>%
  left_join(populacao, by = c("NOME_MUN", "NU_ANO"))

# 5. Verificar quais combinações estão sem população (anos faltantes)
sem_pop <- incidencia %>% filter(is.na(POP)) %>% distinct(NU_ANO)
print(sem_pop)  # Deve mostrar 2022 e 2023

# 6. Para os anos faltantes, usar população de 2021 (último disponível)
pop_2021 <- populacao %>% filter(NU_ANO == 2021) %>% select(NOME_MUN, POP) %>% rename(POP_2021 = POP)

incidencia <- incidencia %>%
  left_join(pop_2021, by = "NOME_MUN") %>%
  mutate(POP = ifelse(is.na(POP), POP_2021, POP)) %>%
  select(-POP_2021)

# 7. Calcular incidência
incidencia <- incidencia %>%
  mutate(INCIDENCIA = (CASOS / POP) * 100000)

# 8. Salvar
write.csv(incidencia, "incidencia_rj_2015_2025.csv", row.names = FALSE)

# 9. Ver resumo
incidencia %>%
  group_by(NU_ANO) %>%
  summarise(
    Media = mean(INCIDENCIA, na.rm = TRUE),
    Max = max(INCIDENCIA, na.rm = TRUE),
    Total_Casos = sum(CASOS, na.rm = TRUE)
  )

View(dados_rj)
View(populacao)
View(incidencia)
unique(populacao$Ano)