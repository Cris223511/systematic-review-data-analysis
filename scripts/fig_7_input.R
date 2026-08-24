library(ggplot2)

df_input <- data.frame(
  
  Group = c(
    "Facial Features",
    "CNN Architectures",
    "Input Modalities",
    "Optimization Methods",
    "Physiological Signals",
    "Others"
  ),
  
  Studies = c(14, 4, 2, 2, 1, 1),
  
  Percentage = c(58.3, 16.7, 8.3, 8.3, 4.2, 4.2)
)

df_input$Group <- factor(
  df_input$Group,
  levels = rev(df_input$Group)
)

p <- ggplot(df_input, aes(x = Studies, y = Group)) +
  
  geom_bar(
    stat = "identity",
    width = 0.62,
    fill = "#2F4858",
    colour = "black",
    linewidth = 0.5
  ) +
  
  geom_text(
    aes(label = paste0(Studies, "  (", Percentage, "%)")),
    hjust = -0.15,
    size = 4.6,
    fontface = "bold",
    colour = "black"
  ) +
  
  scale_x_continuous(
    limits = c(0, 18),
    breaks = seq(0, 16, 4),
    expand = c(0, 0)
  ) +
  
  labs(
    x = "Number of studies (n = 24 eligible corpus)",
    y = NULL
  ) +
  
  theme_minimal(base_family = "sans") +
  
  theme(
    legend.position = "none",
    axis.text.y = element_text(size = 12, face = "bold", colour = "black"),
    axis.text.x = element_text(size = 12, colour = "black"),
    axis.title.x = element_text(
      size = 12,
      face = "bold",
      colour = "black",
      margin = margin(t = 10)
    ),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_line(colour = "gray90")
  )

ggsave("../images/fig_7.png", plot = p, width = 9, height = 4.8, dpi = 300)
ggsave("../images/fig_7.pdf", plot = p, width = 9, height = 4.8)