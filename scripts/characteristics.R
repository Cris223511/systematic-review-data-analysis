library(ggplot2)
library(dplyr)

df_features <- data.frame(
  Features_Group = c("Características Faciales", "Arquitecturas CNN", 
                     "Modalidades de Entrada", "Métodos de Optimización",
                     "Señales Fisiológicas", "Características Textuales/Audio"),
  Count = c(17, 10, 6, 4, 3, 2),
  Percentage = c(40.48, 23.81, 14.29, 9.52, 7.14, 4.76)
)

df_features <- df_features %>% arrange(desc(Count))

colores_features <- c("#4169E1", "#FFD700", "#5B9BD5", 
                      "#F4A582", "#8B7500", "#997300")

ggplot(df_features, aes(x = reorder(Features_Group, Count), 
                        y = Count, fill = Features_Group)) +
  geom_bar(stat = "identity", width = 0.7) +
  geom_text(aes(label = paste0(Count, " (", Percentage, "%)")), 
            hjust = -0.1, size = 4, fontface = "bold") +
  coord_flip() +
  scale_fill_manual(values = colores_features) +
  labs(title = "Grupos de Características Utilizadas en Reconocimiento Emocional",
       x = "", y = "Frecuencia de Uso") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.text.y = element_text(size = 11),
        axis.text.x = element_text(size = 10)) +
  ylim(0, max(df_features$Count) * 1.15)

ggsave("figura6_grupos_caracteristicas.png", width = 12, height = 8, dpi = 300)