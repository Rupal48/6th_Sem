# Create example data
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 5, 4, 6)

# Plot scatter diagram
plot(x, y, main = "Scatter Plot", xlab = "X-axis", ylab = "Y-axis")

# Fit linear regression model
model <- lm(y ~ x)

# Plot residuals
plot(model, which = 1)  # Plot residuals against fitted values
plot(model, which = 2)  # Plot QQ plot of residuals
plot(model, which = 3)  # Plot scale-location plot

# Diagnostic plots
par(mfrow = c(2, 2))  # Set up a 2x2 grid for plots

# Cook's distance
plot(model, which = 4, cook.levels = 0.5)  # Plot Cook's distance

# Leverage plot
plot(model, which = 5)  # Plot leverage

install.packages("car")
library(car)

# Residuals vs. Leverage plot
influencePlot(model)  # Plot residuals vs. leverage

# Influence plot
influenceIndexPlot(model)  # Plot influence plot