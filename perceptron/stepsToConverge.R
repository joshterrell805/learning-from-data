source('perceptron.R')

stepsToConverge <- function(d) {
  w <- rep(0, ncol(d) - 1)
  steps <- c(0)

  repeat {
    i <- perceptron.findMisclassified(d, w)

    if (is.null(i)) {
      break
    }

    w <- perceptron.adjustWeights(w, d[i, ])
    steps[1] <- steps[1] + 1
  }

  steps[1]
}

stepsToConverge.random <- function(dimensions, points) {
  w <- perceptron.randomWeights(dimensions)
  d <- perceptron.randomDataset(w, points)
  stepsToConverge(d)
}
