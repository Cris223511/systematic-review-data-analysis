library(ggplot2)
library(dplyr)
df_arch <- data.frame(
  Family = rep(c("CNN / Deep Learning",
                 "Traditional ML",
                 "Multimodal / Wearable",
                 "Computer Vision / Eye-tracking"), each = 2),
  Configuration = rep(c("Non-ensemble", "Ensemble"), times = 4),
  Studies = c(9, 4,
              2, 1,
              2, 1,
              2, 0)
)
df_arch$Family <- factor(df_arch$Family,
                         levels = c("Computer Vision / Eye-tracking",
                                    "Multimodal / Wearable",
                                    "Traditional ML",
                                    "CNN / Deep Learning"))
df_arch$Configuration <- factor(df_arch$Configuration,
                                levels = c("Non-ensemble", "Ensemble"))
totals <- df_arch %>% group_by(Family) %>% summarise(Total = sum(Studies))
colors_conf <- c("Non-ensemble" = "#2F4858",
                 "Ensemble"     = "#C9D6DE")
p <- ggplot(df_arch, aes(x = Studies, y = Family, fill = Configuration)) +
  geom_bar(stat = "identity", width = 0.62,
           colour = "black", linewidth = 0.5) +
  geom_text(aes(label = ifelse(Studies > 0, Studies, ""),
                colour = Configuration),
            position = position_stack(vjust = 0.5),
            size = 5, fontface = "bold", show.legend = FALSE) +
  geom_text(data = totals, inherit.aes = FALSE,
            aes(x = Total, y = Family, label = paste0("n = ", Total)),
            hjust = -0.25, size = 4.5, fontface = "bold", colour = "black") +
  scale_fill_manual(values = colors_conf, name = NULL) +
  scale_colour_manual(values = c("Non-ensemble" = "white",
                                 "Ensemble"     = "black")) +
  scale_x_continuous(limits = c(0, 15), breaks = seq(0, 14, 2), expand = c(0, 0)) +
  labs(x = "Number of studies (n = 21 with identifiable ML architecture)", y = NULL) +
  theme_minimal(base_family = "sans") +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 12, face = "bold", colour = "black"),
        axis.text.y = element_text(size = 12, face = "bold", colour = "black"),
        axis.text.x = element_text(size = 12, colour = "black"),
        axis.title.x = element_text(size = 12, face = "bold", colour = "black",
                                    margin = margin(t = 10)),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_line(colour = "gray90"))
ggsave("../images/fig_4.png", plot = p, width = 9, height = 5.2, dpi = 300)
ggsave("../images/fig_4.pdf", plot = p, width = 9, height = 5.2)