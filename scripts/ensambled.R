library(treemapify)
library(ggplot2)
library(dplyr)
df_no_ens <- data.frame(
  Modelo = c("Wearable/Mobile", "Traditional ML", "CNN/Deep Learning",
             "Specialized Apps", "Other Models", "Eye-tracking/CV"),
  Frecuencia = c(10, 8, 5, 5, 5, 4)
)
df_no_ens <- df_no_ens %>% arrange(desc(Frecuencia))
df_no_ens$Porcentaje <- round(df_no_ens$Frecuencia / sum(df_no_ens$Frecuencia) * 100, 1)
colores_no_ens <- c("#FFD700", "#F4A582", "#4169E1", 
                    "#8B7500", "#997300", "#7B90D2")
ggplot(df_no_ens, aes(area = Frecuencia, fill = Modelo, 
                      label = paste0(Modelo, "\n", Porcentaje, "%"))) +
  geom_treemap() +
  geom_treemap_text(colour = "white", place = "centre", size = 11, grow = FALSE) +
  scale_fill_manual(values = colores_no_ens) +
  theme(legend.position = "none")
ggsave("figura2_no_ensamblados.png", width = 14, height = 10, dpi = 300)