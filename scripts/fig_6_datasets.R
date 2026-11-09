library(treemap)

master <- read.csv("../data/extraction_master.csv", stringsAsFactors = FALSE, encoding = "UTF-8")

df_datasets <- data.frame(
  Dataset = c(
    "Kaggle ASD collections",
    "Web videos (SSBD and YouTube)",
    "FER-2013",
    "FERAC",
    "CAFE",
    "DREAM",
    "Own clinical data",
    "Robot therapy data",
    "Clinical eye-tracking",
    "Semi-public on request",
    "Own non-ASD training data",
    "No ML dataset"
  ),
  Access = c(rep("PUBLIC", 6), rep("PRIVATE / SEMI-RESTRICTED", 6)),
  Provenance = c(
    "Web", "Web", "Public general", "Partial provenance",
    "Public curated", "Public curated",
    "Clinical", "Clinical", "Clinical",
    "Mixed", "Non-clinical", "Not applicable"
  )
)

df_datasets$Studies <- sapply(df_datasets$Dataset, function(d) sum(master$dataset_category == d))
total_studies <- nrow(master)
stopifnot(sum(df_datasets$Studies) == total_studies)
df_datasets <- df_datasets[df_datasets$Studies > 0, ]

access_pct <- tapply(df_datasets$Studies, df_datasets$Access, sum) / total_studies * 100
df_datasets$Access <- paste0(df_datasets$Access, " (", sprintf("%.1f", access_pct[df_datasets$Access]), "%)")

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
    "Non-clinical",
    "Web",
    "Not applicable"
  )
)
df_datasets$Provenance <- droplevels(df_datasets$Provenance)

palette_prov <- c(
  "Clinical"           = "#2F4858",
  "Public curated"     = "#4A6C7F",
  "Partial provenance" = "#7E9BAA",
  "Public general"     = "#A9BFC9",
  "Mixed"              = "#C9D6DE",
  "Non-clinical"       = "#DCE3E8",
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
    palette           = palette_prov[levels(df_datasets$Provenance)],
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

png("../results/fig_6_datasets.png", width = 9, height = 6, units = "in", res = 300)
draw_treemap()
dev.off()

pdf("../results/fig_6_datasets.pdf", width = 9, height = 6)
draw_treemap()
dev.off()