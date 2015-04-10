library(testthat)
source('perceptron.R')

########################## isMisclassified #####################################

assertMisclassified <- function(w, e, a) {
  a <- perceptron.isMisclassified(a, w)[1]
  expect_that(e, equals(a))
}

w <- c(0, 1, 1)

assertMisclassified(w, FALSE, c(1, 1, 1, 1))
assertMisclassified(w, FALSE, c(1, 1, 0, 1))
assertMisclassified(w, FALSE, c(1,-1,-1,-1))
assertMisclassified(w, FALSE, c(1,-1, 0,-1))
assertMisclassified(w,  TRUE, c(1, 1, 1,-1))
assertMisclassified(w,  TRUE, c(1,-1,-1, 1))

assertMisclassified(w,  TRUE, c(1, 1,-1,-1))
assertMisclassified(w,  TRUE, c(1,-1, 1,-1))
assertMisclassified(w,  TRUE, c(1, 1,-1, 1))
assertMisclassified(w,  TRUE, c(1,-1, 1, 1))

w <- c(3, -4, 5)

assertMisclassified(w,  TRUE, c(1, 2, 1, 1))
assertMisclassified(w, FALSE, c(1, 3, 1,-1))
assertMisclassified(w,  TRUE, c(1, 3, 1, 1))
assertMisclassified(w, FALSE, c(1, 3, 2, 1))
assertMisclassified(w,  TRUE, c(1, 3, 2,-1))


######################### findMisclassified ####################################

assertFoundClassified <- function(w, e, a) {
  a <- t(matrix(a, nrow=4))
  a <- perceptron.findMisclassified(a, w)
  expect_that(e, equals(a))
}

w <- c(0, 1, 1)

assertFoundClassified(w, NULL,
                         c(1, 1, 1, 1,
                         1,-1,-1,-1,
                         1,-1, 3, 1,
                         1, 1,-3,-1))
assertFoundClassified(w, 4,
                         c(1, 1, 1, 1,
                         1,-1,-1,-1,
                         1,-1, 3, 1,
                         1, 3,-3,-1))
assertFoundClassified(w, 2,
                         c(1, 1, 1, 1,
                         1,-1,-7, 1,
                         1,-1, 3, 1,
                         1, 1,-3,-1))

########################### randomDataset ######################################

assertDatasetValid <- function(dimensions, points) {
  w <- perceptron.randomWeights(dimensions)
  d <- perceptron.randomDataset(w, points)

  expect_that(nrow(d), equals(points))
  expect_that(ncol(d), equals(dimensions + 2))

  expect_that(rep(1, points), equals(d[, 1]))
  expect_that(length(w), equals(dimensions + 1))

  for (i in 1:points) {
    s <- sign(w %*% d[i, 1:(dimensions + 1)])[1]
    expect_that(s, not(equals(0)))
    expect_that(s, equals(d[i, dimensions + 2]))
  }
}

assertDatasetValid(1, 1)
assertDatasetValid(1, 10)
assertDatasetValid(2, 10)
assertDatasetValid(10, 10)
assertDatasetValid(10, 1)
