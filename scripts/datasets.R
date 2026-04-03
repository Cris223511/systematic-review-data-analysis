library(treemap)
library(dplyr)

public_datasets <- data.frame(
  Dataset = c("Kaggle ASD / Autistic Children Emotions", "FER-2013",
              "FERAC", "CK+", "CAFE", "DREAM Dataset",
              "ABIDE", "Kaggle FER", "Kaggle Screening / Tabular"),
  Frequency = c(6, 3, 2, 1, 1, 1, 1, 1, 1),
  Category = "PUBLIC (50.0%)"
)

private_datasets <- data.frame(
  Dataset = c("Own Clinical Data (ASD Children)", "Semi-public (on request)",
              "Robot Therapy Data", "Clinical Eye-tracking Data",
              "Corporate Clinical Trial Data", "No ML Dataset Identified"),
  Frequency = c(7, 3, 3, 2, 1, 1),
  Category = "PRIVATE (50.0%)"
)

df_datasets <- rbind(public_datasets, private_datasets)
total_studies <- 34
df_datasets$Percentage <- round(df_datasets$Frequency / total_studies * 100, 1)
df_datasets$Label <- paste0(df_datasets$Dataset, "\n", df_datasets$Percentage, "%")

treemap(df_datasets,
        index = c("Category", "Label"),
        vSize = "Frequency",
        vColor = "Category",
        type = "categorical",
        palette = c("#4169E1", "#FFD700"),
        fontsize.labels = c(0, 13),
        fontcolor.labels = c("transparent", "black"),
        fontface.labels = c(1, 2),
        align.labels = list(c("center", "center"), c("center", "center")),
        overlap.labels = 0.5,
        inflate.labels = FALSE,
        border.col = "black",
        border.lwds = 2)