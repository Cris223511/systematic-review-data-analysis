library(treemapify)
library(ggplot2)
library(dplyr)

df_no_ens <- data.frame(
  Modelo = c("CNN/Deep Learning", "Traditional ML", "Eye-tracking/CV", "Multimodal/Wearable"),
  Frecuencia = c(8, 2, 2, 2)
)
df_no_ens <- df_no_ens %>% arrange(desc(Frecuencia))
df_no_ens$Porcentaje <- round(df_no_ens$Frecuencia / sum(df_no_ens$Frecuencia) * 100, 1)

colores_no_ens <- c("#4472c4", "#70ad47", "#a5a5a5", "#ffc000")

ggplot(df_no_ens, aes(area = Frecuencia, fill = Modelo,
                      label = paste0(Modelo, "\n", Porcentaje, "%"))) +
  geom_treemap() +
  geom_treemap_text(colour = "black",
                    place = "centre",
                    size = 18,
                    grow = FALSE,
                    fontface = "bold") +
  scale_fill_manual(values = colores_no_ens) +
  theme(legend.position = "none")

ggsave("figura2_no_ensamblados.png", width = 14, height = 10, dpi = 300)