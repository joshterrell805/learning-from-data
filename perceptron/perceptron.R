perceptron <- {}

# `fileName` is a csv file which holds data in the row-format
# x1,x2,y
perceptron.readData <- function(filename) {
  d <- read.csv(filename, sep = ',')
  d <- data.matrix(d)

  d <- cbind(1, d)
  colnames(d) <- c('x0', 'x1', 'x2', 'y')

  d
}

perceptron.isMisclassified <- function(row, weights) {
  sign(weights %*% row[1:3]) != row[4]
}

# Return the index of the first misclassified point using `weights` to
# partition the data.
# If all points are classified correctly, return NULL. 
perceptron.findMisclassified <- function(d, weights) {
  misclassified <- NULL

  for (i in 1:nrow(d)) {
    if (perceptron.isMisclassified(d[i, ], weights)) {
      misclassified <- i
      break
    }
  }

  misclassified
}

perceptron.adjustWeights <- function(weights, misclassified) {
  weights + misclassified[4] * misclassified[1:3]
}

perceptron.graph <- function(d, refreshInterval = 0.15, weights = c(0, 0, 0)) {
  repeat  {
    a <- (-weights[1] / weights[3])
    b <- (-weights[2] / weights[3])

    if (is.finite(a) && is.finite(b)) {
      dev.hold()

      plot(d[, 2], d[, 3], col = ifelse(d[, 4] < 0,'red','blue'))
      abline(a,b)

      dev.flush()

      Sys.sleep(refreshInterval)
    }


    i <- perceptron.findMisclassified(d, weights)

    if (is.null(i)) {
      break
    }

    weights <- perceptron.adjustWeights(weights, d[i, ])
  }
}
