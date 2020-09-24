## -----------------------------------------------------------------------------
library(KneeArrower)

set.seed(12345)
x <- runif(100, min=0, max=4)
y <- -exp(-x) * (1+rnorm(100) * 0.10) * 4
plot(x, y, pch=20, col="gray")

## -----------------------------------------------------------------------------
cutoff.point <- findCutoff(x, y, method="first", 0.5)
cutoff.point

plot(x, y, pch=20, col="gray")
points(cutoff.point, col="red", cex=3, pch=20)

## -----------------------------------------------------------------------------
thresholds <- c(0.25, 0.5, 0.75, 1)

# Find cutoff points at each threshold
cutoff.points <- lapply(thresholds, function(i) {
  findCutoff(x, y, method="first", i)
})
x.coord <- sapply(cutoff.points, function(p) p$x)
y.coord <- sapply(cutoff.points, function(p) p$y)

# Plot the cutoff points on the scatterplot
plot(x, y, pch=20, col="gray")
points(x.coord, y.coord, col="red", pch=20)
text(x.coord, y.coord, labels=thresholds, pos=4, col="red")

## -----------------------------------------------------------------------------
cutoff.point <- findCutoff(x, y, method="curvature")
cutoff.point

plot(x, y, pch=20, col="gray")
points(cutoff.point, col="blue", cex=3, pch=20)

