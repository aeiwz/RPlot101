install.packages("BiocManager")
BiocManager::install("DESeq2")
BiocManager::install("ggplot2")


# Load required libraries
library(DESeq2)
library(ggplot2)

# Load your count data
countData <- read.csv("count_data.csv", row.names = 1)

# Load sample metadata
sampleInfo <- read.csv("sample_info.csv")

# Create a DESeqDataSet object
dds <- DESeqDataSetFromMatrix(countData, colData = sampleInfo, design = ~ condition)

# Perform differential expression analysis
dds <- DESeq(dds)

# Get differential expression results
res <- results(dds)

# Filter for significant genes (adjust p-value as needed)
sig_genes <- res[which(adjusted_pvalue(res) < 0.05), ]

# Visualize differential expression results
# For example, let's create a volcano plot
volcano_plot <- ggplot(sig_genes, aes(x = log2FoldChange, y = -log10(adjusted_pvalue))) +
  geom_point(aes(color = ifelse(abs(log2FoldChange) > 1, "Significant", "Not Significant")), alpha = 0.5) +
  scale_color_manual(values = c("Significant" = "red", "Not Significant" = "blue")) +
  labs(x = "log2 Fold Change", y = "-log10(Adjusted p-value)") +
  ggtitle("Volcano Plot of Differential Expression") +
  theme_minimal()

# Display the volcano plot
print(volcano_plot)


