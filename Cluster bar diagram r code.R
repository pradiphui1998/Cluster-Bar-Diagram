

####################################################################################################
## Cluster bar diagram r code
####################################################################################################

# Data
data <- matrix(c(62, 93, 38, 41, 31, 61), ncol = 2, byrow = TRUE)
rownames(data) <- c("<200", "200-300", ">300")
colnames(data) <- c("Prediabetes", "Type2 Diabetes")
data <- as.table(data)

# Calculate column percentages
data_percentage <- prop.table(data, margin = 2) * 100

# Lighter colors
light_red <- "#FF9999"
light_blue <- "#99CCFF"
light_green <- "#99FF99"

# Barplot with cluster bars (rotated)
barplot(data_percentage, beside = TRUE, col = c(light_red, light_blue, light_green),
        main = "",
        xlab = "Type of Diabetes", ylab = "Percentage",
        legend.text = rownames(data_percentage), args.legend = list(x = "topright"),
        ylim = c(0, 60)
)

# Add legend
legend(title = "Vitamin B12 ", "topright", legend = rownames(data_percentage),
       fill = c(light_red, light_blue, light_green)
)







# Add legend
legend(title = "Vitamin B12 ", "topright", legend = rownames(data_percentage),
       fill = c(light_red, light_blue, light_green)
)

# Add column percentages on top of bars
text_pos <- barplot(data_percentage, beside = TRUE, col = c(light_red, light_blue, light_green),
                    plot = FALSE)  # Get the position of the bars

for (i in 1:ncol(data_percentage)) {
  text(text_pos[, i], data_percentage[, i], labels = sprintf("%.1f%%", data_percentage[, i]),
       pos = 3, offset = 0.5, cex = 0.8, col = "black")
}
