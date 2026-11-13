library(ggplot2)
library(dplyr)

master <- read.csv("../data/extraction_master.csv", stringsAsFactors = FALSE, encoding = "UTF-8")
ml <- subset(master, ml_architecture == 1)
families <- c("CNN / Deep Learning", "Traditional ML", "Computer Vision pipelines")

df_arch <- expand.grid(
  Configuration = c("Non-ensemble", "Ensemble"),
  Family = families,
  stringsAsFactors = FALSE
)[, c("Family", "Configuration")]
df_arch$Studies <- mapply(
  function(f, cfg) sum(ml$model_family == f & ml$ensemble == ifelse(cfg == "Ensemble", 1, 0)),
  df_arch$Family, df_arch$Configuration
)
n_ml <- nrow(ml)
x_upper <- ceiling(max(tapply(df_arch$Studies, df_arch$Family, sum)) * 1.15 / 2) * 2 + 2

df_arch$Family <- factor(
  df_arch$Family,
  levels = c(
    "Computer Vision pipelines",
    "Traditional ML",
    "CNN / Deep Learning"
  )
)

df_arch$Configuration <- factor(
  df_arch$Configuration,
  levels = c("Non-ensemble", "Ensemble")
)

totals <- df_arch %>%
  group_by(Family) %>%
  summarise(Total = sum(Studies))

colors_conf <- c(
  "Non-ensemble" = "#2F4858",
  "Ensemble"     = "#C9D6DE"
)

p <- ggplot(df_arch, aes(x = Studies, y = Family, fill = Configuration)) +
  geom_bar(
    stat = "identity",
    width = 0.62,
    colour = "black",
    linewidth = 0.5
  ) +
  geom_text(
    aes(
      label = ifelse(Studies > 0, Studies, ""),
      colour = Configuration
    ),
    position = position_stack(vjust = 0.5),
    size = 5,
    fontface = "bold",
    show.legend = FALSE
  ) +
  geom_text(
    data = totals,
    inherit.aes = FALSE,
    aes(x = Total, y = Family, label = paste0("n = ", Total)),
    hjust = -0.25,
    size = 4.5,
    fontface = "bold",
    colour = "black"
  ) +
  scale_fill_manual(values = colors_conf, name = NULL) +
  scale_colour_manual(values = c(
    "Non-ensemble" = "white",
    "Ensemble"     = "black"
  )) +
  scale_x_continuous(
    limits = c(0, x_upper),
    breaks = seq(0, x_upper - 2, 2),
    expand = c(0, 0)
  ) +
  coord_cartesian(clip = "off") +
  labs(
    x = paste0("Number of studies (n = ", n_ml, " eligible with identifiable ML architecture)"),
    y = NULL
  ) +
  theme_minimal(base_family = "sans") +
  theme(
    legend.position = "bottom",
    legend.text = element_text(size = 12, face = "bold", colour = "black"),
    axis.text.y = element_text(size = 12, face = "bold", colour = "black"),
    axis.text.x = element_text(size = 12, colour = "black"),
    axis.title.x = element_text(
      size = 12,
      face = "bold",
      colour = "black",
      margin = margin(t = 10)
    ),
    plot.margin = margin(t = 5, r = 40, b = 5, l = 5),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_line(colour = "gray90")
  )

ggsave("../results/fig_4_architectures.png", plot = p, width = 9, height = 5.2, dpi = 300, bg = "white")
