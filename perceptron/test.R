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
