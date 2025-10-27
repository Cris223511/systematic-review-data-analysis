library(treemap)
library(dplyr)

public_datasets <- data.frame(
  Dataset = c("CAFE", "FER-2013", "CAFE+GuessWhat", "Q-Chat-10", 
              "FEI/GT/Gallagher", "STREs WoZ", "GuessWhat App"),
  Frequency = c(2, 1, 1, 1, 1, 1, 1),
  Category = "PUBLIC 62.5%"
)

private_datasets <- data.frame(
  Dataset = c("MoodCapture", "Mobile Landmarks", "D-MOMO", 
              "App Reviews", "Children Drawings", "WEMAC", 
              "YouTube Videos", "Children Art"),
  Frequency = c(1, 1, 1, 1, 2, 1, 1, 1),
  Category = "PRIVATE 37.5%"
)

df_datasets <- rbind(public_datasets, private_datasets)
df_datasets$Percentage <- round(df_datasets$Frequency / sum(df_datasets$Frequency) * 100, 1)
df_datasets$Label <- paste0(df_datasets$Dataset, "\n", df_datasets$Percentage, "%")

treemap(df_datasets,
        index = c("Category", "Label"),
        vSize = "Frequency",
        vColor = "Category",
        type = "categorical",
        palette = c("#4169E1", "#FFD700"),
        title = "Distribución de Datasets Públicos y Privados",
        fontsize.labels = c(0, 10),
        fontcolor.labels = c("transparent", "white"),
        fontface.labels = c(1, 2),
        align.labels = list(c("center", "center"), c("center", "center")),
        overlap.labels = 0.5,
        inflate.labels = FALSE,
        border.col = "black",
        border.lwds = 2)
