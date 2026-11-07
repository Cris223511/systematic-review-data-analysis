library(ggplot2)

df_input <- data.frame(
  Group = c(
    "End-to-end learning (CNN)",
    "Facial descriptor extraction",
    "Physiological signal derivation",
    "No computational facial input\n(system design or test scores)",
    "Algorithmic descriptor selection",
    "Capture format definition"
  ),
  Studies = c(8, 7, 2, 2, 1, 1),
  Percentage = c(38.1, 33.3, 9.5, 9.5, 4.8, 4.8)
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
    limits = c(0, 11),
    breaks = seq(0, 10, 2),
    expand = c(0, 0)
  ) +
  labs(
    x = "Number of studies (n = 21 eligible corpus)",
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

ggsave("../results/fig_7_input.png", plot = p, width = 9, height = 4.8, dpi = 300)
ggsave("../results/fig_7_input.pdf", plot = p, width = 9, height = 4.8)