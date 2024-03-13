euc <- function(a, b) {
  sum((a - b) ^ 2) ^ 0.5
}

points <- list()
n <- as.integer(readline(prompt = "Enter number of data points: "))

for (i in 1:n) {
  cat("Enter data point ", i, ":\n")
  x <- as.numeric(strsplit(readline(), split = " ")[[1]])
  points[[i]] <- x
}

print(points)
print(apply(do.call(rbind, points), 2, mean))

k <- as.integer(readline(prompt = "Enter no. of clusters: "))
clusters <- rep(0, n)
centroids <- points[1:k]
print(centroids)

n <- length(points)
k <- length(centroids)
matrix1 <- matrix(0, nrow = n, ncol = k)

for (iter in 1:100) {
  new_centroids <- list()
  for (i in 1:n) {
    for (j in 1:k) {
      matrix1[i, j] <- euc(points[[i]], centroids[[j]])
    }
    mincol <- which.min(matrix1[i, ])
    clusters[i] <- mincol
  }
  cat("Clusters in iteration:", iter, "\n")
  for (m in 1:k) {
    clusterset <- list()
    for (i in 1:n) {
      if (clusters[i] == m) {
        clusterset <- c(clusterset, list(points[[i]]))
      }
    }
    new_centroids[[m]] <- colMeans(do.call(rbind, clusterset))
    cat("Cluster", m, "elements:")
    print(clusterset)
  }
  if (identical(new_centroids, centroids)) {
    break
  } else {
    centroids <- new_centroids
  }
}

cat("Final Centroids:\n")
print(centroids)

cat("Final Clusters:\n")
for (m in 1:k) {
  clusterset <- list()
  for (i in 1:n) {
    if (clusters[i] == m) {
      clusterset <- c(clusterset, list(points[[i]]))
    }
  }
  cat("Cluster", m, "elements:")
  print(clusterset)
}
