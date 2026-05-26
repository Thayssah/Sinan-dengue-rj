library(dplyr)
library(ggplot2)


populacao_estado <- data.frame(
  NU_ANO = c(2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025),
  POP_TOTAL = c( 16974000, 17043727, 17100398, 17148943, 17193919, 17222305, 
                17220455, 17211760, 17213813, 17219679, 17223547)
)

print(populacao_estado)

dados <- read.csv("pop_populacao_ripsa202417797544416.csv")
dados_casos <- read.csv("dados_rj_filtrado2.csv")

# Somar casos de todos os municípios por ano

casos_estado <- dados_casos %>%
  group_by(NU_ANO) %>%
  summarise(CASOS_TOTAL = sum(CASOS, na.rm = TRUE), .groups = 'drop')

  print(casos_estado)


incidencia_estado <- casos_estado %>%
  left_join(populacao_estado, by = "NU_ANO") %>%
  mutate(
    INCIDENCIA = (CASOS_TOTAL / POP_TOTAL) * 100000,
    INCIDENCIA = round(INCIDENCIA, 1)
  ) %>%
  arrange(NU_ANO)
  
print(incidencia_estado)

write.csv(incidencia_estado, "incidencia_ano_estado_barras.csv", row.names = FALSE)



##-------- grafico

ggplot(incidencia_estado, aes(x = factor(NU_ANO), y = INCIDENCIA)) +
  geom_bar(stat = "identity", fill = "#556B2F", width = 0.7) +
  geom_hline(yintercept = 300, linetype = "dashed", color = "red", size = 1) +
  geom_text(aes(label = round(INCIDENCIA, 0)), vjust = -0.5, size = 3) +
  labs(
    title = "Incidência de Dengue no Estado do Rio de Janeiro. (2015-2025)",
    x = "Ano",
    y = "Incidência por 100.000 habitantes",
    caption = "Fonte: SINAN e IBGE\nLinha vermelha = Limiar epidêmico (300 casos/100mil)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )