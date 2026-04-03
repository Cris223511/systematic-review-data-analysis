library(treemapify)
library(ggplot2)
library(dplyr)

df_ens <- data.frame(
  Modelo = c("CNN/Deep Learning Ensemble", "Traditional ML Ensemble", "Multimodal/Wearable Ensemble"),
  Frecuencia = c(3, 1, 1)
)
df_ens$Porcentaje <- round(df_ens$Frecuencia / sum(df_ens$Frecuencia) * 100, 1)

colores_ens <- c("#4169E1", "#FFD700", "#70ad47")

ggplot(df_ens, aes(area = Frecuencia, fill = Modelo,
                   label = paste0(Modelo, "\n", Porcentaje, "%"))) +
  geom_treemap() +
  geom_treemap_text(colour = "black", place = "centre", size = 22, grow = FALSE,
                    fontface = "bold") +
  scale_fill_manual(values = colores_ens) +
  theme(legend.position = "none")

ggsave("figura4_ensamblados.png", width = 14, height = 10, dpi = 300)