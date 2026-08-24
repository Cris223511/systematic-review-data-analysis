library(treemap)

df_datasets <- data.frame(
  
  Dataset = c(
    "Kaggle ASD collections",
    "FER-2013",
    "FERAC",
    "CAFE",
    "DREAM",
    "Kaggle Screening",
    "Kaggle FER",
    "Own clinical data",
    "Robot therapy data",
    "Clinical eye-tracking",
    "Semi-public on request",
    "No ML dataset"
  ),
  
  Studies = c(
    5, 1, 1, 1, 1, 1, 1,
    5, 2, 2, 3, 1
  ),
  
  Access = c(
    rep("PUBLIC (45.8%)", 7),
    rep("PRIVATE / SEMI-RESTRICTED (54.2%)", 5)
  ),
  
  Provenance = c(
    "Web", "Public general", "Partial provenance",
    "Public curated", "Public curated",
    "Web", "Web",
    "Clinical", "Clinical", "Clinical",
    "Mixed", "Not applicable"
  )
)

total_studies <- 24

df_datasets$Percentage <- round(
  df_datasets$Studies / total_studies * 100, 1
)

df_datasets$Label <- paste0(
  df_datasets$Dataset, "\n",
  df_datasets$Studies, " (",
  df_datasets$Percentage, "%)"
)

df_datasets$Provenance <- factor(
  df_datasets$Provenance,
  levels = c(
    "Clinical",
    "Public curated",
    "Partial provenance",
    "Public general",
    "Mixed",
    "Web",
    "Not applicable"
  )
)

palette_prov <- c(
  "Clinical"           = "#2F4858",
  "Public curated"     = "#4A6C7F",
  "Partial provenance" = "#7E9BAA",
  "Public general"     = "#A9BFC9",
  "Mixed"              = "#C9D6DE",
  "Web"                = "#E8B649",
  "Not applicable"     = "#F2F2F2"
)

draw_treemap <- function() {
  treemap(
    df_datasets,
    index             = c("Access", "Label"),
    vSize             = "Studies",
    vColor            = "Provenance",
    type              = "categorical",
    palette           = palette_prov,
    title             = "",
    title.legend      = "Dataset provenance",
    fontsize.labels   = c(0, 12),
    fontsize.legend   = 11,
    fontfamily.labels = "sans",
    fontfamily.legend = "sans",
    fontcolor.labels  = c("transparent", "black"),
    fontface.labels   = c(1, 2),
    align.labels      = list(
      c("center", "center"),
      c("center", "center")
    ),
    overlap.labels    = 0.5,
    inflate.labels    = FALSE,
    border.col        = "black",
    border.lwds       = c(3, 1.2),
    position.legend   = "bottom"
  )
}

png("../images/fig_6.png", width = 9, height = 6, units = "in", res = 300)
draw_treemap()
dev.off()

pdf("../images/fig_6.pdf", width = 9, height = 6)
draw_treemap()
dev.off()