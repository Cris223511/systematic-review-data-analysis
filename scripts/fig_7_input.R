library(ggplot2)

master <- read.csv("../data/extraction_master.csv", stringsAsFactors = FALSE, encoding = "UTF-8")
n_total <- nrow(master)

groups <- c(
  "End-to-end learning (CNN)",
  "Facial descriptor extraction",
  "Physiological signal derivation",
  "No computational facial input",
  "Algorithmic descriptor selection",
  "Capture format definition"
)
display <- c(
  "No computational facial input" = "No computational facial input\n(system design or test scores)"
)

counts <- sapply(groups, function(g) sum(master$input_group == g))
df_input <- data.frame(
  Group = ifelse(groups %in% names(display), display[groups], groups),
  Studies = as.integer(counts),
  Percentage = round(counts / n_total * 100, 1)
)
df_input <- df_input[order(-df_input$Studies, seq_along(groups)), ]
df_input <- df_input[df_input$Studies > 0, ]
x_upper <- ceiling(max(df_input$Studies) * 1.3 / 2) * 2 + 1

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
    limits = c(0, x_upper),
    breaks = seq(0, x_upper - 1, 2),
    expand = c(0, 0)
  ) +
  labs(
    x = paste0("Number of studies (n = ", n_total, " eligible corpus)"),
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
